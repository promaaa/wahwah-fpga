#!/usr/bin/env python3
"""
Wah-wah temps réel avec curseur de pédale + visualisation temporelle/fréquentielle.

- Lecture d'un fichier WAV
- Sortie audio en temps réel
- Traitement séquentiel échantillon par échantillon (DF1) dans le callback audio
- Contrôle live via un curseur (position pédale 0..1)
- Affichage live domaine temporel et fréquentiel (entrée/sortie)

Dépendances:
    pip install numpy scipy matplotlib sounddevice

Exemple:
    python wah_wah_realtime.py --input trap-sad-electric-guitar-quiet-lo-fi-melody_65bpm_A#.wav
"""

from __future__ import annotations

import argparse
import math
import threading
from collections import deque
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation
from matplotlib.widgets import Slider
from scipy.io import wavfile

try:
    import sounddevice as sd
except ImportError as exc:
    raise SystemExit(
        "Le package 'sounddevice' est requis pour le mode temps réel. "
        "Installe-le avec: pip install sounddevice"
    ) from exc

from wah_wah_poc import control_to_fc, rbj_bandpass_const_peak_0db, wav_to_float_mono


class WahRealtimeEngine:
    """Moteur DSP temps réel (simulation FPGA DF1 échantillon par échantillon)."""

    def __init__(
        self,
        x: np.ndarray,
        fs: int,
        q: float,
        fmin: float,
        fmax: float,
        lfo_hz: float,
        lfo_depth: float,
        pedal_init: float,
        bypass: bool,
        mix: float,
        vis_window: int,
    ) -> None:
        self.x = x.astype(np.float32, copy=False)
        self.fs = fs
        self.q = float(q)
        self.fmin = float(fmin)
        self.fmax = float(fmax)
        self.lfo_hz = float(max(lfo_hz, 0.0))
        self.lfo_depth = float(np.clip(lfo_depth, 0.0, 1.0))
        self.bypass = bool(bypass)
        self.mix = float(np.clip(mix, 0.0, 1.0))

        self.lock = threading.Lock()
        self.pedal = float(np.clip(pedal_init, 0.0, 1.0))

        self.idx = 0

        # Registres DF1
        self.x_z1 = 0.0
        self.x_z2 = 0.0
        self.y_z1 = 0.0
        self.y_z2 = 0.0

        # Buffers pour affichage temps/fréquence
        self.in_hist = deque([0.0] * vis_window, maxlen=vis_window)
        self.out_hist = deque([0.0] * vis_window, maxlen=vis_window)

    def set_pedal(self, value: float) -> None:
        with self.lock:
            self.pedal = float(np.clip(value, 0.0, 1.0))

    def get_pedal(self) -> float:
        with self.lock:
            return self.pedal

    def set_bypass(self, value: bool) -> None:
        self.bypass = bool(value)

    def set_mix(self, value: float) -> None:
        self.mix = float(np.clip(value, 0.0, 1.0))

    def _control_sample(self) -> float:
        base = self.get_pedal()
        if self.lfo_hz <= 0.0 or self.lfo_depth <= 0.0:
            return base
        t = self.idx / float(self.fs)
        lfo = 0.5 * (1.0 + math.sin(2.0 * math.pi * self.lfo_hz * t))
        return float(np.clip((1.0 - self.lfo_depth) * base + self.lfo_depth * lfo, 0.0, 1.0))

    def process_sample(self, xn: float) -> float:
        """Bloc DSP: coeffs + équation aux différences DF1 pour 1 échantillon."""
        control = self._control_sample()
        fc = control_to_fc(control, fmin=self.fmin, fmax=self.fmax)
        b0, b1, b2, a1, a2 = rbj_bandpass_const_peak_0db(fs=self.fs, fc=fc, q=self.q)

        yn = b0 * xn + b1 * self.x_z1 + b2 * self.x_z2 - a1 * self.y_z1 - a2 * self.y_z2

        self.x_z2 = self.x_z1
        self.x_z1 = xn
        self.y_z2 = self.y_z1
        self.y_z1 = yn
        return yn

    def audio_callback(self, outdata: np.ndarray, frames: int, _time, status) -> None:
        if status:
            print(status)

        block_in = np.zeros(frames, dtype=np.float32)
        block_out = np.zeros(frames, dtype=np.float32)

        for i in range(frames):
            if self.idx < self.x.size:
                xn = float(self.x[self.idx])
                self.idx += 1
            else:
                xn = 0.0

            wet = self.process_sample(xn)
            selected = xn if self.bypass else wet
            yn = float(np.clip((1.0 - self.mix) * xn + self.mix * selected, -1.0, 1.0))

            block_in[i] = xn
            block_out[i] = yn

        self.in_hist.extend(block_in.tolist())
        self.out_hist.extend(block_out.tolist())

        outdata[:, 0] = block_out

        if self.idx >= self.x.size:
            raise sd.CallbackStop



def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Wah-wah temps réel avec curseur + scopes")
    parser.add_argument("--input", required=True, type=Path, help="Chemin WAV d'entrée")
    parser.add_argument("--q", type=float, default=4.0, help="Facteur Q (défaut: 4.0)")
    parser.add_argument("--fmin", type=float, default=400.0, help="Fréquence min sweep (Hz)")
    parser.add_argument("--fmax", type=float, default=2200.0, help="Fréquence max sweep (Hz)")
    parser.add_argument("--pedal-init", type=float, default=0.5, help="Position initiale pédale [0..1]")
    parser.add_argument("--lfo-hz", type=float, default=0.0, help="LFO de modulation (Hz), 0=off")
    parser.add_argument("--lfo-depth", type=float, default=1.0, help="Poids du LFO [0..1]")
    parser.add_argument("--bypass", action="store_true", help="Bypass du filtre")
    parser.add_argument("--mix", type=float, default=1.0, help="Mix dry/wet [0..1]")
    parser.add_argument("--blocksize", type=int, default=256, help="Taille bloc callback audio")
    parser.add_argument("--vis-window", type=int, default=4096, help="Fenêtre visualisation (échantillons)")
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    fs, raw = wavfile.read(args.input)
    x = wav_to_float_mono(raw)

    engine = WahRealtimeEngine(
        x=x,
        fs=fs,
        q=args.q,
        fmin=args.fmin,
        fmax=args.fmax,
        lfo_hz=args.lfo_hz,
        lfo_depth=args.lfo_depth,
        pedal_init=args.pedal_init,
        bypass=args.bypass,
        mix=args.mix,
        vis_window=args.vis_window,
    )

    # ---------- UI Matplotlib ----------
    fig, (ax_time, ax_freq) = plt.subplots(2, 1, figsize=(10, 7))
    plt.subplots_adjust(bottom=0.18, hspace=0.35)

    t_axis = np.arange(args.vis_window, dtype=np.float32) / float(fs)
    line_in_t, = ax_time.plot(t_axis, np.zeros(args.vis_window), label="Entrée", alpha=0.7)
    line_out_t, = ax_time.plot(t_axis, np.zeros(args.vis_window), label="Sortie Wah", alpha=0.9)
    ax_time.set_title("Domaine temporel (fenêtre glissante)")
    ax_time.set_xlabel("Temps (s)")
    ax_time.set_ylabel("Amplitude")
    ax_time.set_ylim(-1.05, 1.05)
    ax_time.grid(True, alpha=0.3)
    ax_time.legend(loc="upper right")

    n_fft = args.vis_window
    f_axis = np.fft.rfftfreq(n_fft, d=1.0 / fs)
    line_in_f, = ax_freq.plot(f_axis, np.full_like(f_axis, -120.0), label="Entrée", alpha=0.7)
    line_out_f, = ax_freq.plot(f_axis, np.full_like(f_axis, -120.0), label="Sortie Wah", alpha=0.9)
    ax_freq.set_title("Domaine fréquentiel (FFT)")
    ax_freq.set_xlabel("Fréquence (Hz)")
    ax_freq.set_ylabel("Magnitude (dB)")
    ax_freq.set_xlim(0.0, min(6000.0, fs / 2.0))
    ax_freq.set_ylim(-120.0, 20.0)
    ax_freq.grid(True, alpha=0.3)
    ax_freq.legend(loc="upper right")

    slider_ax = plt.axes([0.12, 0.06, 0.75, 0.04])
    pedal_slider = Slider(
        ax=slider_ax,
        label="Pédale Wah (0..1)",
        valmin=0.0,
        valmax=1.0,
        valinit=float(np.clip(args.pedal_init, 0.0, 1.0)),
    )

    pedal_text = fig.text(0.12, 0.12, "", fontsize=10)

    def on_slider_change(value: float) -> None:
        engine.set_pedal(value)

    pedal_slider.on_changed(on_slider_change)

    def update_plot(_frame_idx: int):
        in_buf = np.array(engine.in_hist, dtype=np.float32)
        out_buf = np.array(engine.out_hist, dtype=np.float32)

        line_in_t.set_ydata(in_buf)
        line_out_t.set_ydata(out_buf)

        win = np.hanning(n_fft).astype(np.float32)
        in_spec = np.fft.rfft(in_buf * win)
        out_spec = np.fft.rfft(out_buf * win)

        eps = 1e-12
        in_db = 20.0 * np.log10(np.maximum(np.abs(in_spec), eps))
        out_db = 20.0 * np.log10(np.maximum(np.abs(out_spec), eps))

        line_in_f.set_ydata(in_db)
        line_out_f.set_ydata(out_db)

        pedal = engine.get_pedal()
        fc = control_to_fc(pedal, fmin=args.fmin, fmax=args.fmax)
        pedal_text.set_text(
            f"Pédale={pedal:.3f} | fc≈{fc:.1f} Hz | Q={args.q:.2f} | "
            f"LFO={args.lfo_hz:.2f}Hz d={np.clip(args.lfo_depth,0,1):.2f} | "
            f"bypass={args.bypass} mix={np.clip(args.mix,0,1):.2f}"
        )

        return line_in_t, line_out_t, line_in_f, line_out_f, pedal_text

    stream = sd.OutputStream(
        samplerate=fs,
        channels=1,
        dtype="float32",
        blocksize=args.blocksize,
        callback=engine.audio_callback,
    )

    def on_close(_event) -> None:
        if stream.active:
            stream.stop()
        stream.close()

    fig.canvas.mpl_connect("close_event", on_close)

    print("Lecture démarrée. Déplace le curseur pour modifier l'effet en temps réel.")
    print("Ferme la fenêtre pour arrêter.")

    with stream:
        _anim = FuncAnimation(fig, update_plot, interval=30, blit=False, cache_frame_data=False)
        plt.show()


if __name__ == "__main__":
    main()
