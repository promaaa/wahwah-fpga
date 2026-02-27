#!/usr/bin/env python3
"""
Preuve de concept DSP d'une pédale wah-wah numérique (simulation orientée FPGA).

Contraintes respectées :
- Traitement séquentiel échantillon par échantillon (pas de filtrage vectorisé par blocs)
- Séparation claire entre :
  1) Calcul dynamique des coefficients biquad (bloc matériel dédié)
  2) Équation de filtrage DF1 + registres d'état (bloc matériel dédié)

Dépendances:
    pip install numpy scipy

Exemple:
    python wah_wah_poc.py --input entree.wav --output sortie_wah.wav --lfo-hz 1.5 --q 4.0
"""

from __future__ import annotations

import argparse
import math
from dataclasses import dataclass
from pathlib import Path

import numpy as np
from scipy.io import wavfile


# ============================================================================
# Bloc 1 : Utilitaires I/O et normalisation
# ============================================================================

def _wav_to_float(data: np.ndarray) -> np.ndarray:
    if np.issubdtype(data.dtype, np.integer):
        info = np.iinfo(data.dtype)
        if data.dtype == np.uint8:
            x = (data.astype(np.float32) - 128.0) / 128.0
        else:
            x = data.astype(np.float32) / float(max(abs(info.min), info.max))
    elif np.issubdtype(data.dtype, np.floating):
        x = data.astype(np.float32)
        peak = np.max(np.abs(x)) if x.size else 0.0
        if peak > 1.0:
            x = x / peak
    else:
        raise TypeError(f"Type WAV non supporté: {data.dtype}")
    return np.clip(x, -1.0, 1.0)


def i2s_rx_to_stereo(data: np.ndarray) -> tuple[np.ndarray, int]:
    x = _wav_to_float(data)
    if x.ndim == 1:
        stereo = np.column_stack([x, x]).astype(np.float32, copy=False)
        return stereo, 1
    if x.ndim == 2 and x.shape[1] == 2:
        return x.astype(np.float32, copy=False), 2
    raise ValueError("Le fichier WAV doit être mono ou stéréo (1 ou 2 canaux).")


def wav_to_float_mono(data: np.ndarray) -> np.ndarray:
    stereo, _ = i2s_rx_to_stereo(data)
    return stereo.mean(axis=1).astype(np.float32, copy=False)


# ============================================================================
# Bloc 2 : Génération du signal de contrôle + mapping fréquentiel
# ============================================================================

def generate_lfo(num_samples: int, fs: int, lfo_hz: float = 1.5) -> np.ndarray:
    """
    Génère un LFO sinusoïdal strictement dans [0.0, 1.0], de même longueur que l'audio.
    """
    n = np.arange(num_samples, dtype=np.float64)
    t = n / float(fs)

    lfo = 0.5 * (1.0 + np.sin(2.0 * math.pi * lfo_hz * t))
    return np.clip(lfo.astype(np.float32), 0.0, 1.0)


def control_to_fc(control: float, fmin: float = 400.0, fmax: float = 2200.0) -> float:
    """
    Convertit une commande c in [0,1] en fréquence centrale fc via balayage exponentiel.

    fc = fmin * (fmax/fmin)^c
    """
    c = min(max(control, 0.0), 1.0)
    return fmin * ((fmax / fmin) ** c)


@dataclass
class WahUiParams:
    lfo_hz: float = 1.5
    q: float = 4.0
    fmin: float = 400.0
    fmax: float = 2200.0
    bypass: bool = False
    mix: float = 1.0


# ============================================================================
# Bloc 3 : Calcul des coefficients biquad (Audio EQ Cookbook RBJ)
# ============================================================================

def _compute_trig(fs: float, fc: float) -> tuple[float, float]:
    nyquist = fs * 0.5
    fc = min(max(fc, 1.0), nyquist - 1.0)
    w0 = 2.0 * math.pi * (fc / fs)
    return math.sin(w0), math.cos(w0)


def _coeffs_from_trig(sin_w0: float, cos_w0: float, q: float) -> tuple[float, float, float, float, float]:
    q = max(q, 1e-6)
    alpha = sin_w0 / (2.0 * q)
    b0 = alpha
    b1 = 0.0
    b2 = -alpha
    a0 = 1.0 + alpha
    a1 = -2.0 * cos_w0
    a2 = 1.0 - alpha
    b0 /= a0
    b1 /= a0
    b2 /= a0
    a1 /= a0
    a2 /= a0
    return b0, b1, b2, a1, a2


def rbj_bandpass_const_peak_0db(fs: float, fc: float, q: float) -> tuple[float, float, float, float, float]:
    """
    Coefficients d'un biquad passe-bande résonant, type
    "Bandpass (constant 0 dB peak gain)" selon RBJ.

    Équation normalisée utilisée ensuite :
        y[n] = b0*x[n] + b1*x[n-1] + b2*x[n-2] - a1*y[n-1] - a2*y[n-2]

    Retour: (b0, b1, b2, a1, a2)
    """
    sin_w0, cos_w0 = _compute_trig(fs, fc)
    return _coeffs_from_trig(sin_w0, cos_w0, q)


# ============================================================================
# Bloc 4 : Boucle de traitement séquentielle (Simulation FPGA, DF1)
# ============================================================================

@dataclass
class BiquadDf1State:
    x_z1: float = 0.0
    x_z2: float = 0.0
    y_z1: float = 0.0
    y_z2: float = 0.0

    def process(self, xn: float, coeffs: tuple[float, float, float, float, float]) -> float:
        b0, b1, b2, a1, a2 = coeffs
        yn = b0 * xn + b1 * self.x_z1 + b2 * self.x_z2 - a1 * self.y_z1 - a2 * self.y_z2
        self.x_z2 = self.x_z1
        self.x_z1 = xn
        self.y_z2 = self.y_z1
        self.y_z1 = yn
        return yn


def _preprocess(stereo_in: np.ndarray) -> np.ndarray:
    return np.clip(stereo_in.astype(np.float32, copy=False), -1.0, 1.0)


def _postprocess(stereo_in: np.ndarray) -> np.ndarray:
    return np.clip(stereo_in.astype(np.float32, copy=False), -1.0, 1.0)


def _mix_route(dry: np.ndarray, wet: np.ndarray, mix: float) -> np.ndarray:
    mix = float(np.clip(mix, 0.0, 1.0))
    return (1.0 - mix) * dry + mix * wet


def process_wah_stereo_architecture(
    stereo_in: np.ndarray,
    fs: int,
    ui: WahUiParams,
) -> np.ndarray:
    n_samples = stereo_in.shape[0]
    prep = _preprocess(stereo_in)
    lfo = generate_lfo(num_samples=n_samples, fs=fs, lfo_hz=ui.lfo_hz)
    state_l = BiquadDf1State()
    state_r = BiquadDf1State()
    wet = np.zeros_like(prep, dtype=np.float32)

    for n in range(n_samples):
        fc = control_to_fc(float(lfo[n]), fmin=ui.fmin, fmax=ui.fmax)
        sin_w0, cos_w0 = _compute_trig(fs=fs, fc=fc)
        coeffs = _coeffs_from_trig(sin_w0=sin_w0, cos_w0=cos_w0, q=ui.q)
        wet[n, 0] = np.float32(state_l.process(float(prep[n, 0]), coeffs))
        wet[n, 1] = np.float32(state_r.process(float(prep[n, 1]), coeffs))

    selected = prep if ui.bypass else wet
    post = _postprocess(selected)
    mixed = _mix_route(dry=prep, wet=post, mix=ui.mix)
    return np.clip(mixed, -1.0, 1.0).astype(np.float32, copy=False)


def process_wah_sample_by_sample(
    x: np.ndarray,
    fs: int,
    lfo: np.ndarray,
    q: float = 4.0,
    fmin: float = 400.0,
    fmax: float = 2200.0,
) -> np.ndarray:
    if x.shape != lfo.shape:
        raise ValueError("Le LFO doit avoir la même taille que le signal audio.")
    x_mono = x.astype(np.float32, copy=False)
    stereo = np.column_stack([x_mono, x_mono]).astype(np.float32, copy=False)
    ui = WahUiParams(lfo_hz=0.0, q=q, fmin=fmin, fmax=fmax, bypass=False, mix=1.0)
    state_l = BiquadDf1State()
    y = np.zeros_like(x_mono, dtype=np.float32)
    prep = _preprocess(stereo)
    for n in range(x_mono.size):
        fc = control_to_fc(float(lfo[n]), fmin=ui.fmin, fmax=ui.fmax)
        sin_w0, cos_w0 = _compute_trig(fs=fs, fc=fc)
        coeffs = _coeffs_from_trig(sin_w0=sin_w0, cos_w0=cos_w0, q=ui.q)
        y[n] = np.float32(state_l.process(float(prep[n, 0]), coeffs))
    return y


# ============================================================================
# Bloc 5 : Protection clipping + export WAV 16-bit
# ============================================================================

def protect_from_clipping(y: np.ndarray, mode: str = "normalize") -> np.ndarray:
    """
    Protection clipping :
    - normalize : normalisation globale si pic > 1.0
    - softclip  : écrêtage doux via tanh
    """
    y = y.astype(np.float32, copy=False)

    if mode == "softclip":
        return np.tanh(y).astype(np.float32)

    peak = float(np.max(np.abs(y))) if y.size else 0.0
    if peak > 1.0:
        y = y / peak
    return y


def float_to_int16(y: np.ndarray) -> np.ndarray:
    """Convertit [-1,1] float vers int16 (mono ou stéréo)."""
    y = np.clip(y, -1.0, 1.0)
    return (y * 32767.0).astype(np.int16)


# ============================================================================
# Main CLI
# ============================================================================

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="POC Wah-Wah DSP séquentiel (numpy/scipy)")
    parser.add_argument("--input", required=True, type=Path, help="Chemin du WAV d'entrée mono")
    parser.add_argument("--output", required=True, type=Path, help="Chemin du WAV de sortie")
    parser.add_argument("--lfo-hz", type=float, default=1.5, help="Fréquence LFO en Hz (défaut: 1.5)")
    parser.add_argument("--q", type=float, default=4.0, help="Facteur de qualité du biquad (défaut: 4.0)")
    parser.add_argument("--fmin", type=float, default=400.0, help="Fréquence min du sweep (Hz)")
    parser.add_argument("--fmax", type=float, default=2200.0, help="Fréquence max du sweep (Hz)")
    parser.add_argument("--bypass", action="store_true", help="Bypass du filtre IIR")
    parser.add_argument("--mix", type=float, default=1.0, help="Mix dry/wet [0..1]")
    parser.add_argument(
        "--clip-mode",
        choices=["normalize", "softclip"],
        default="normalize",
        help="Protection clipping en sortie",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    fs, raw = wavfile.read(args.input)
    stereo_in, input_channels = i2s_rx_to_stereo(raw)
    ui = WahUiParams(
        lfo_hz=args.lfo_hz,
        q=args.q,
        fmin=args.fmin,
        fmax=args.fmax,
        bypass=bool(args.bypass),
        mix=float(np.clip(args.mix, 0.0, 1.0)),
    )
    stereo_out = process_wah_stereo_architecture(stereo_in=stereo_in, fs=fs, ui=ui)
    y = stereo_out[:, 0] if input_channels == 1 else stereo_out

    y_safe = protect_from_clipping(y, mode=args.clip_mode)
    y_i16 = float_to_int16(y_safe)

    wavfile.write(args.output, fs, y_i16)

    print("Traitement terminé.")
    print(f"Entrée : {args.input}")
    print(f"Sortie : {args.output}")
    print(
        f"fs={fs} Hz, N={stereo_in.shape[0]}, C_in={input_channels}, "
        f"LFO={args.lfo_hz} Hz, Q={args.q}, sweep=[{args.fmin}, {args.fmax}] Hz, "
        f"bypass={args.bypass}, mix={float(np.clip(args.mix, 0.0, 1.0)):.2f}"
    )


if __name__ == "__main__":
    main()
