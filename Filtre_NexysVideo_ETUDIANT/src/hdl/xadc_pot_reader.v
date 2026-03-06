`timescale 1ns / 1ps

module xadc_pot_reader(
    input  wire clk,
    input  wire rst,
    input  wire vauxp0,
    input  wire vauxn0,
    output reg  [7:0] pot_pos
);

  wire [15:0] do_out;
  wire drdy_out;

  reg den_reg;
  always @(posedge clk) begin
    if (rst) begin
      den_reg <= 1'b0;
    end else begin
      den_reg <= ~den_reg;
    end
  end

  XADC #(
    .INIT_40(16'h1000),
    .INIT_41(16'h20F0),
    .INIT_42(16'h0400),
    .INIT_48(16'h0010),
    .INIT_49(16'h0000),
    .INIT_4A(16'h0000),
    .INIT_4B(16'h0000),
    .INIT_4C(16'h0000),
    .INIT_4D(16'h0000),
    .INIT_4E(16'h0000),
    .INIT_4F(16'h0000),
    .SIM_DEVICE("7SERIES")
  ) xadc_inst (
    .DCLK(clk),
    .RESET(rst),
    .CONVST(1'b0),
    .CONVSTCLK(1'b0),
    .DADDR(7'h11),
    .DWE(1'b0),
    .DEN(den_reg),
    .DI(16'h0000),
    .DO(do_out),
    .DRDY(drdy_out),
    .BUSY(),
    .CHANNEL(),
    .EOC(),
    .EOS(),
    .JTAGBUSY(),
    .JTAGLOCKED(),
    .JTAGMODIFIED(),
    .OT(),
    .ALM(),
    .VAUXP({15'b0, vauxp0}),
    .VAUXN({15'b0, vauxn0}),
    .VP(1'b0),
    .VN(1'b0)
  );

  always @(posedge clk) begin
    if (rst) begin
      pot_pos <= 8'h00;
    end else if (drdy_out) begin
      pot_pos <= do_out[15:8];
    end
  end

endmodule
