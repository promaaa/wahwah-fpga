// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Feb 25 17:59:18 2019
// Host        : marzel-XPS-13-9350 running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog
//               /home/marzel/Documents/enseignements/IMTA_ELEC_A1S2_TAF/UV_ELEC_A1S2/TP_loto_ProcSon/ProcSon/NexysVideo/src/hdl/processingUnitIP.v
// Design      : operativeUnit
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STRUCTURAL_NETLIST = "yes" *)
module operativeUnit
   (I_clock,
    I_reset,
    I_inputSample,
    I_loadShift,
    I_initAddress,
    I_incrAddress,
    I_initSum,
    I_loadSum,
    I_loadY,
    O_processingDone,
    O_Y);
  input I_clock;
  input I_reset;
  input [7:0]I_inputSample;
  input I_loadShift;
  input I_initAddress;
  input I_incrAddress;
  input I_initSum;
  input I_loadSum;
  input I_loadY;
  output O_processingDone;
  output [7:0]O_Y;

  wire \<const0> ;
  wire \<const1> ;
  wire I_clock;
  wire I_clock_IBUF;
  wire I_clock_IBUF_BUFG;
  wire I_incrAddress;
  wire I_incrAddress_IBUF;
  wire I_initAddress;
  wire I_initAddress_IBUF;
  wire I_initSum;
  wire I_initSum_IBUF;
  wire [7:0]I_inputSample;
  wire [7:0]I_inputSample_IBUF;
  wire I_loadShift;
  wire I_loadShift_IBUF;
  wire I_loadSum;
  wire I_loadSum_IBUF;
  wire I_loadY;
  wire I_loadY_IBUF;
  wire I_reset;
  wire I_reset_IBUF;
  wire [14:7]L;
  wire [7:0]O_Y;
  wire [7:0]O_Y_OBUF;
  wire O_processingDone;
  wire O_processingDone_OBUF;
  wire [14:0]SC_MultResult;
  wire [4:0]SC_multOperand2;
  wire \SR_Y[4]_i_11_n_0 ;
  wire \SR_Y[4]_i_12_n_0 ;
  wire \SR_Y[4]_i_13_n_0 ;
  wire \SR_Y[4]_i_14_n_0 ;
  wire \SR_Y[4]_i_15_n_0 ;
  wire \SR_Y[4]_i_16_n_0 ;
  wire \SR_Y[4]_i_17_n_0 ;
  wire \SR_Y[4]_i_18_n_0 ;
  wire \SR_Y[4]_i_19_n_0 ;
  wire \SR_Y[4]_i_20_n_0 ;
  wire \SR_Y[4]_i_21_n_0 ;
  wire \SR_Y[4]_i_22_n_0 ;
  wire \SR_Y[4]_i_23_n_0 ;
  wire \SR_Y[4]_i_24_n_0 ;
  wire \SR_Y[4]_i_25_n_0 ;
  wire \SR_Y[4]_i_26_n_0 ;
  wire \SR_Y[4]_i_28_n_0 ;
  wire \SR_Y[4]_i_29_n_0 ;
  wire \SR_Y[4]_i_30_n_0 ;
  wire \SR_Y[4]_i_32_n_0 ;
  wire \SR_Y[4]_i_33_n_0 ;
  wire \SR_Y[4]_i_34_n_0 ;
  wire \SR_Y[4]_i_35_n_0 ;
  wire \SR_Y[4]_i_36_n_0 ;
  wire \SR_Y[4]_i_37_n_0 ;
  wire \SR_Y[4]_i_38_n_0 ;
  wire \SR_Y[4]_i_39_n_0 ;
  wire \SR_Y[4]_i_40_n_0 ;
  wire \SR_Y[4]_i_41_n_0 ;
  wire \SR_Y[4]_i_42_n_0 ;
  wire \SR_Y[4]_i_43_n_0 ;
  wire \SR_Y[4]_i_44_n_0 ;
  wire \SR_Y[4]_i_45_n_0 ;
  wire \SR_Y[4]_i_46_n_0 ;
  wire \SR_Y[4]_i_47_n_0 ;
  wire \SR_Y[4]_i_48_n_0 ;
  wire \SR_Y[4]_i_49_n_0 ;
  wire \SR_Y[4]_i_50_n_0 ;
  wire \SR_Y[4]_i_51_n_0 ;
  wire \SR_Y[4]_i_5_n_0 ;
  wire \SR_Y[4]_i_6_n_0 ;
  wire \SR_Y[4]_i_7_n_0 ;
  wire \SR_Y[4]_i_8_n_0 ;
  wire \SR_Y[7]_i_11_n_0 ;
  wire \SR_Y[7]_i_12_n_0 ;
  wire \SR_Y[7]_i_13_n_0 ;
  wire \SR_Y[7]_i_15_n_0 ;
  wire \SR_Y[7]_i_16_n_0 ;
  wire \SR_Y[7]_i_17_n_0 ;
  wire \SR_Y[7]_i_18_n_0 ;
  wire \SR_Y[7]_i_19_n_0 ;
  wire \SR_Y[7]_i_20_n_0 ;
  wire \SR_Y[7]_i_21_n_0 ;
  wire \SR_Y[7]_i_22_n_0 ;
  wire \SR_Y[7]_i_25_n_0 ;
  wire \SR_Y[7]_i_26_n_0 ;
  wire \SR_Y[7]_i_27_n_0 ;
  wire \SR_Y[7]_i_28_n_0 ;
  wire \SR_Y[7]_i_3_n_0 ;
  wire \SR_Y[7]_i_42_n_0 ;
  wire \SR_Y[7]_i_43_n_0 ;
  wire \SR_Y[7]_i_44_n_0 ;
  wire \SR_Y[7]_i_45_n_0 ;
  wire \SR_Y[7]_i_46_n_0 ;
  wire \SR_Y[7]_i_47_n_0 ;
  wire \SR_Y[7]_i_48_n_0 ;
  wire \SR_Y[7]_i_49_n_0 ;
  wire \SR_Y[7]_i_50_n_0 ;
  wire \SR_Y[7]_i_51_n_0 ;
  wire \SR_Y[7]_i_52_n_0 ;
  wire \SR_Y[7]_i_53_n_0 ;
  wire \SR_Y[7]_i_54_n_0 ;
  wire \SR_Y[7]_i_55_n_0 ;
  wire \SR_Y[7]_i_56_n_0 ;
  wire \SR_Y[7]_i_57_n_0 ;
  wire \SR_Y[7]_i_5_n_0 ;
  wire \SR_Y[7]_i_6_n_0 ;
  wire \SR_Y[7]_i_7_n_0 ;
  wire \SR_Y[7]_i_9_n_0 ;
  wire \SR_Y_reg[4]_i_10_n_0 ;
  wire \SR_Y_reg[4]_i_10_n_1 ;
  wire \SR_Y_reg[4]_i_10_n_2 ;
  wire \SR_Y_reg[4]_i_10_n_3 ;
  wire \SR_Y_reg[4]_i_27_n_0 ;
  wire \SR_Y_reg[4]_i_27_n_1 ;
  wire \SR_Y_reg[4]_i_27_n_2 ;
  wire \SR_Y_reg[4]_i_27_n_3 ;
  wire \SR_Y_reg[4]_i_27_n_4 ;
  wire \SR_Y_reg[4]_i_27_n_5 ;
  wire \SR_Y_reg[4]_i_27_n_6 ;
  wire \SR_Y_reg[4]_i_27_n_7 ;
  wire \SR_Y_reg[4]_i_2_n_0 ;
  wire \SR_Y_reg[4]_i_2_n_1 ;
  wire \SR_Y_reg[4]_i_2_n_2 ;
  wire \SR_Y_reg[4]_i_2_n_3 ;
  wire \SR_Y_reg[4]_i_3_n_0 ;
  wire \SR_Y_reg[4]_i_3_n_1 ;
  wire \SR_Y_reg[4]_i_3_n_2 ;
  wire \SR_Y_reg[4]_i_3_n_3 ;
  wire \SR_Y_reg[4]_i_3_n_5 ;
  wire \SR_Y_reg[4]_i_4_n_0 ;
  wire \SR_Y_reg[4]_i_4_n_1 ;
  wire \SR_Y_reg[4]_i_4_n_2 ;
  wire \SR_Y_reg[4]_i_4_n_3 ;
  wire \SR_Y_reg[4]_i_9_n_0 ;
  wire \SR_Y_reg[4]_i_9_n_1 ;
  wire \SR_Y_reg[4]_i_9_n_2 ;
  wire \SR_Y_reg[4]_i_9_n_3 ;
  wire \SR_Y_reg[7]_i_10_n_0 ;
  wire \SR_Y_reg[7]_i_10_n_1 ;
  wire \SR_Y_reg[7]_i_10_n_2 ;
  wire \SR_Y_reg[7]_i_10_n_3 ;
  wire \SR_Y_reg[7]_i_10_n_4 ;
  wire \SR_Y_reg[7]_i_10_n_5 ;
  wire \SR_Y_reg[7]_i_10_n_6 ;
  wire \SR_Y_reg[7]_i_10_n_7 ;
  wire \SR_Y_reg[7]_i_14_n_1 ;
  wire \SR_Y_reg[7]_i_14_n_3 ;
  wire \SR_Y_reg[7]_i_14_n_6 ;
  wire \SR_Y_reg[7]_i_14_n_7 ;
  wire \SR_Y_reg[7]_i_2_n_2 ;
  wire \SR_Y_reg[7]_i_2_n_3 ;
  wire \SR_Y_reg[7]_i_33_n_0 ;
  wire \SR_Y_reg[7]_i_34_n_0 ;
  wire \SR_Y_reg[7]_i_35_n_0 ;
  wire \SR_Y_reg[7]_i_36_n_0 ;
  wire \SR_Y_reg[7]_i_38_n_0 ;
  wire \SR_Y_reg[7]_i_39_n_0 ;
  wire \SR_Y_reg[7]_i_40_n_0 ;
  wire \SR_Y_reg[7]_i_41_n_0 ;
  wire \SR_Y_reg[7]_i_4_n_1 ;
  wire \SR_Y_reg[7]_i_4_n_2 ;
  wire \SR_Y_reg[7]_i_4_n_3 ;
  wire \SR_Y_reg[7]_i_8_n_2 ;
  wire \SR_Y_reg[7]_i_8_n_3 ;
  wire \SR_Y_reg[7]_i_8_n_5 ;
  wire \SR_Y_reg[7]_i_8_n_6 ;
  wire \SR_Y_reg[7]_i_8_n_7 ;
  wire \SR_readAddress[0]_i_1_n_0 ;
  wire \SR_readAddress[1]_i_1_n_0 ;
  wire \SR_readAddress[2]_i_1_n_0 ;
  wire \SR_readAddress[3]_i_1_n_0 ;
  wire \SR_readAddress[3]_i_2_n_0 ;
  wire [3:0]SR_readAddress_reg__0;
  wire [7:0]\SR_shiftRegister[0] ;
  wire [7:0]\SR_shiftRegister_reg[0]__0 ;
  wire [7:0]\SR_shiftRegister_reg[10]__0 ;
  wire [7:0]\SR_shiftRegister_reg[11]__0 ;
  wire [7:0]\SR_shiftRegister_reg[12]__0 ;
  wire [7:0]\SR_shiftRegister_reg[13]__0 ;
  wire [7:0]\SR_shiftRegister_reg[14]__0 ;
  wire [7:0]\SR_shiftRegister_reg[15]__0 ;
  wire [7:0]\SR_shiftRegister_reg[1]__0 ;
  wire [7:0]\SR_shiftRegister_reg[2]__0 ;
  wire [7:0]\SR_shiftRegister_reg[3]__0 ;
  wire [7:0]\SR_shiftRegister_reg[4]__0 ;
  wire [7:0]\SR_shiftRegister_reg[5]__0 ;
  wire [7:0]\SR_shiftRegister_reg[6]__0 ;
  wire [7:0]\SR_shiftRegister_reg[7]__0 ;
  wire [7:0]\SR_shiftRegister_reg[8]__0 ;
  wire [7:0]\SR_shiftRegister_reg[9]__0 ;
  wire \SR_sum[0]_i_10_n_0 ;
  wire \SR_sum[0]_i_13_n_0 ;
  wire \SR_sum[0]_i_14_n_0 ;
  wire \SR_sum[0]_i_15_n_0 ;
  wire \SR_sum[0]_i_16_n_0 ;
  wire \SR_sum[0]_i_17_n_0 ;
  wire \SR_sum[0]_i_18_n_0 ;
  wire \SR_sum[0]_i_19_n_0 ;
  wire \SR_sum[0]_i_1_n_0 ;
  wire \SR_sum[0]_i_20_n_0 ;
  wire \SR_sum[0]_i_21_n_0 ;
  wire \SR_sum[0]_i_22_n_0 ;
  wire \SR_sum[0]_i_23_n_0 ;
  wire \SR_sum[0]_i_24_n_0 ;
  wire \SR_sum[0]_i_25_n_0 ;
  wire \SR_sum[0]_i_26_n_0 ;
  wire \SR_sum[0]_i_27_n_0 ;
  wire \SR_sum[0]_i_31_n_0 ;
  wire \SR_sum[0]_i_32_n_0 ;
  wire \SR_sum[0]_i_33_n_0 ;
  wire \SR_sum[0]_i_3_n_0 ;
  wire \SR_sum[0]_i_45_n_0 ;
  wire \SR_sum[0]_i_46_n_0 ;
  wire \SR_sum[0]_i_47_n_0 ;
  wire \SR_sum[0]_i_48_n_0 ;
  wire \SR_sum[0]_i_49_n_0 ;
  wire \SR_sum[0]_i_4_n_0 ;
  wire \SR_sum[0]_i_50_n_0 ;
  wire \SR_sum[0]_i_51_n_0 ;
  wire \SR_sum[0]_i_52_n_0 ;
  wire \SR_sum[0]_i_53_n_0 ;
  wire \SR_sum[0]_i_54_n_0 ;
  wire \SR_sum[0]_i_55_n_0 ;
  wire \SR_sum[0]_i_56_n_0 ;
  wire \SR_sum[0]_i_57_n_0 ;
  wire \SR_sum[0]_i_58_n_0 ;
  wire \SR_sum[0]_i_59_n_0 ;
  wire \SR_sum[0]_i_5_n_0 ;
  wire \SR_sum[0]_i_60_n_0 ;
  wire \SR_sum[0]_i_6_n_0 ;
  wire \SR_sum[0]_i_7_n_0 ;
  wire \SR_sum[0]_i_8_n_0 ;
  wire \SR_sum[0]_i_9_n_0 ;
  wire \SR_sum[12]_i_2_n_0 ;
  wire \SR_sum[12]_i_3_n_0 ;
  wire \SR_sum[12]_i_4_n_0 ;
  wire \SR_sum[12]_i_5_n_0 ;
  wire \SR_sum[12]_i_6_n_0 ;
  wire \SR_sum[4]_i_2_n_0 ;
  wire \SR_sum[4]_i_3_n_0 ;
  wire \SR_sum[4]_i_4_n_0 ;
  wire \SR_sum[4]_i_5_n_0 ;
  wire \SR_sum[4]_i_6_n_0 ;
  wire \SR_sum[4]_i_7_n_0 ;
  wire \SR_sum[4]_i_8_n_0 ;
  wire \SR_sum[4]_i_9_n_0 ;
  wire \SR_sum[8]_i_2_n_0 ;
  wire \SR_sum[8]_i_3_n_0 ;
  wire \SR_sum[8]_i_4_n_0 ;
  wire \SR_sum[8]_i_5_n_0 ;
  wire \SR_sum[8]_i_6_n_0 ;
  wire \SR_sum[8]_i_7_n_0 ;
  wire \SR_sum[8]_i_8_n_0 ;
  wire \SR_sum[8]_i_9_n_0 ;
  wire [14:0]SR_sum_reg;
  wire \SR_sum_reg[0]_i_11_n_0 ;
  wire \SR_sum_reg[0]_i_11_n_1 ;
  wire \SR_sum_reg[0]_i_11_n_2 ;
  wire \SR_sum_reg[0]_i_11_n_3 ;
  wire \SR_sum_reg[0]_i_11_n_4 ;
  wire \SR_sum_reg[0]_i_11_n_5 ;
  wire \SR_sum_reg[0]_i_11_n_6 ;
  wire \SR_sum_reg[0]_i_11_n_7 ;
  wire \SR_sum_reg[0]_i_12_n_0 ;
  wire \SR_sum_reg[0]_i_12_n_1 ;
  wire \SR_sum_reg[0]_i_12_n_2 ;
  wire \SR_sum_reg[0]_i_12_n_3 ;
  wire \SR_sum_reg[0]_i_12_n_4 ;
  wire \SR_sum_reg[0]_i_2_n_0 ;
  wire \SR_sum_reg[0]_i_2_n_1 ;
  wire \SR_sum_reg[0]_i_2_n_2 ;
  wire \SR_sum_reg[0]_i_2_n_3 ;
  wire \SR_sum_reg[0]_i_2_n_4 ;
  wire \SR_sum_reg[0]_i_2_n_5 ;
  wire \SR_sum_reg[0]_i_2_n_6 ;
  wire \SR_sum_reg[0]_i_2_n_7 ;
  wire \SR_sum_reg[0]_i_37_n_0 ;
  wire \SR_sum_reg[0]_i_38_n_0 ;
  wire \SR_sum_reg[0]_i_39_n_0 ;
  wire \SR_sum_reg[0]_i_40_n_0 ;
  wire \SR_sum_reg[0]_i_41_n_0 ;
  wire \SR_sum_reg[0]_i_42_n_0 ;
  wire \SR_sum_reg[0]_i_43_n_0 ;
  wire \SR_sum_reg[0]_i_44_n_0 ;
  wire \SR_sum_reg[12]_i_1_n_2 ;
  wire \SR_sum_reg[12]_i_1_n_3 ;
  wire \SR_sum_reg[12]_i_1_n_5 ;
  wire \SR_sum_reg[12]_i_1_n_6 ;
  wire \SR_sum_reg[12]_i_1_n_7 ;
  wire \SR_sum_reg[4]_i_1_n_0 ;
  wire \SR_sum_reg[4]_i_1_n_1 ;
  wire \SR_sum_reg[4]_i_1_n_2 ;
  wire \SR_sum_reg[4]_i_1_n_3 ;
  wire \SR_sum_reg[4]_i_1_n_4 ;
  wire \SR_sum_reg[4]_i_1_n_5 ;
  wire \SR_sum_reg[4]_i_1_n_6 ;
  wire \SR_sum_reg[4]_i_1_n_7 ;
  wire \SR_sum_reg[8]_i_1_n_0 ;
  wire \SR_sum_reg[8]_i_1_n_1 ;
  wire \SR_sum_reg[8]_i_1_n_2 ;
  wire \SR_sum_reg[8]_i_1_n_3 ;
  wire \SR_sum_reg[8]_i_1_n_4 ;
  wire \SR_sum_reg[8]_i_1_n_5 ;
  wire \SR_sum_reg[8]_i_1_n_6 ;
  wire \SR_sum_reg[8]_i_1_n_7 ;
  wire [7:0]p_0_in;
  wire [3:0]\NLW_SR_Y_reg[4]_i_10_O_UNCONNECTED ;
  wire [3:0]\NLW_SR_Y_reg[4]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_SR_Y_reg[7]_i_14_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  BUFG I_clock_IBUF_BUFG_inst
       (.I(I_clock_IBUF),
        .O(I_clock_IBUF_BUFG));
  IBUF I_clock_IBUF_inst
       (.I(I_clock),
        .O(I_clock_IBUF));
  IBUF I_incrAddress_IBUF_inst
       (.I(I_incrAddress),
        .O(I_incrAddress_IBUF));
  IBUF I_initAddress_IBUF_inst
       (.I(I_initAddress),
        .O(I_initAddress_IBUF));
  IBUF I_initSum_IBUF_inst
       (.I(I_initSum),
        .O(I_initSum_IBUF));
  IBUF \I_inputSample_IBUF[0]_inst 
       (.I(I_inputSample[0]),
        .O(I_inputSample_IBUF[0]));
  IBUF \I_inputSample_IBUF[1]_inst 
       (.I(I_inputSample[1]),
        .O(I_inputSample_IBUF[1]));
  IBUF \I_inputSample_IBUF[2]_inst 
       (.I(I_inputSample[2]),
        .O(I_inputSample_IBUF[2]));
  IBUF \I_inputSample_IBUF[3]_inst 
       (.I(I_inputSample[3]),
        .O(I_inputSample_IBUF[3]));
  IBUF \I_inputSample_IBUF[4]_inst 
       (.I(I_inputSample[4]),
        .O(I_inputSample_IBUF[4]));
  IBUF \I_inputSample_IBUF[5]_inst 
       (.I(I_inputSample[5]),
        .O(I_inputSample_IBUF[5]));
  IBUF \I_inputSample_IBUF[6]_inst 
       (.I(I_inputSample[6]),
        .O(I_inputSample_IBUF[6]));
  IBUF \I_inputSample_IBUF[7]_inst 
       (.I(I_inputSample[7]),
        .O(I_inputSample_IBUF[7]));
  IBUF I_loadShift_IBUF_inst
       (.I(I_loadShift),
        .O(I_loadShift_IBUF));
  IBUF I_loadSum_IBUF_inst
       (.I(I_loadSum),
        .O(I_loadSum_IBUF));
  IBUF I_loadY_IBUF_inst
       (.I(I_loadY),
        .O(I_loadY_IBUF));
  IBUF I_reset_IBUF_inst
       (.I(I_reset),
        .O(I_reset_IBUF));
  OBUF \O_Y_OBUF[0]_inst 
       (.I(O_Y_OBUF[0]),
        .O(O_Y[0]));
  OBUF \O_Y_OBUF[1]_inst 
       (.I(O_Y_OBUF[1]),
        .O(O_Y[1]));
  OBUF \O_Y_OBUF[2]_inst 
       (.I(O_Y_OBUF[2]),
        .O(O_Y[2]));
  OBUF \O_Y_OBUF[3]_inst 
       (.I(O_Y_OBUF[3]),
        .O(O_Y[3]));
  OBUF \O_Y_OBUF[4]_inst 
       (.I(O_Y_OBUF[4]),
        .O(O_Y[4]));
  OBUF \O_Y_OBUF[5]_inst 
       (.I(O_Y_OBUF[5]),
        .O(O_Y[5]));
  OBUF \O_Y_OBUF[6]_inst 
       (.I(O_Y_OBUF[6]),
        .O(O_Y[6]));
  OBUF \O_Y_OBUF[7]_inst 
       (.I(O_Y_OBUF[7]),
        .O(O_Y[7]));
  OBUF O_processingDone_OBUF_inst
       (.I(O_processingDone_OBUF),
        .O(O_processingDone));
  LUT3 #(
    .INIT(8'h80)) 
    O_processingDone_OBUF_inst_i_1
       (.I0(SR_readAddress_reg__0[1]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[2]),
        .O(O_processingDone_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[0]_i_1 
       (.I0(\SR_Y_reg[4]_i_3_n_5 ),
        .I1(L[7]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \SR_Y[1]_i_1 
       (.I0(\SR_Y_reg[4]_i_3_n_5 ),
        .I1(L[7]),
        .I2(L[8]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \SR_Y[2]_i_1 
       (.I0(L[7]),
        .I1(\SR_Y_reg[4]_i_3_n_5 ),
        .I2(L[8]),
        .I3(L[9]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SR_Y[3]_i_1 
       (.I0(L[8]),
        .I1(\SR_Y_reg[4]_i_3_n_5 ),
        .I2(L[7]),
        .I3(L[9]),
        .I4(L[10]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \SR_Y[4]_i_1 
       (.I0(L[9]),
        .I1(L[7]),
        .I2(\SR_Y_reg[4]_i_3_n_5 ),
        .I3(L[8]),
        .I4(L[10]),
        .I5(L[11]),
        .O(p_0_in[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_11 
       (.I0(SC_MultResult[7]),
        .I1(SR_sum_reg[7]),
        .O(\SR_Y[4]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_12 
       (.I0(SC_MultResult[6]),
        .I1(SR_sum_reg[6]),
        .O(\SR_Y[4]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_13 
       (.I0(SC_MultResult[5]),
        .I1(SR_sum_reg[5]),
        .O(\SR_Y[4]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_14 
       (.I0(SC_MultResult[4]),
        .I1(SR_sum_reg[4]),
        .O(\SR_Y[4]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \SR_Y[4]_i_15 
       (.I0(\SR_Y_reg[7]_i_10_n_5 ),
        .I1(\SR_Y_reg[7]_i_14_n_6 ),
        .O(\SR_Y[4]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \SR_Y[4]_i_16 
       (.I0(\SR_Y_reg[7]_i_10_n_6 ),
        .I1(\SR_Y_reg[7]_i_14_n_7 ),
        .O(\SR_Y[4]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \SR_Y[4]_i_17 
       (.I0(\SR_Y_reg[4]_i_27_n_4 ),
        .I1(\SR_Y_reg[7]_i_10_n_7 ),
        .O(\SR_Y[4]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \SR_Y[4]_i_18 
       (.I0(\SR_Y_reg[7]_i_10_n_7 ),
        .I1(\SR_Y_reg[4]_i_27_n_4 ),
        .O(\SR_Y[4]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \SR_Y[4]_i_19 
       (.I0(\SR_Y_reg[7]_i_14_n_6 ),
        .I1(\SR_Y_reg[7]_i_10_n_5 ),
        .I2(\SR_Y_reg[7]_i_10_n_4 ),
        .I3(\SR_Y_reg[7]_i_14_n_1 ),
        .O(\SR_Y[4]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \SR_Y[4]_i_20 
       (.I0(\SR_Y_reg[7]_i_14_n_7 ),
        .I1(\SR_Y_reg[7]_i_10_n_6 ),
        .I2(\SR_Y_reg[7]_i_10_n_5 ),
        .I3(\SR_Y_reg[7]_i_14_n_6 ),
        .O(\SR_Y[4]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hE11E)) 
    \SR_Y[4]_i_21 
       (.I0(\SR_Y_reg[7]_i_10_n_7 ),
        .I1(\SR_Y_reg[4]_i_27_n_4 ),
        .I2(\SR_Y_reg[7]_i_10_n_6 ),
        .I3(\SR_Y_reg[7]_i_14_n_7 ),
        .O(\SR_Y[4]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'h6999)) 
    \SR_Y[4]_i_22 
       (.I0(\SR_Y_reg[7]_i_10_n_7 ),
        .I1(\SR_Y_reg[4]_i_27_n_4 ),
        .I2(\SR_Y_reg[4]_i_27_n_5 ),
        .I3(\SR_sum_reg[0]_i_11_n_4 ),
        .O(\SR_Y[4]_i_22_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \SR_Y[4]_i_23 
       (.I0(\SR_sum_reg[0]_i_11_n_7 ),
        .I1(\SR_sum_reg[0]_i_12_n_4 ),
        .I2(SR_sum_reg[3]),
        .O(\SR_Y[4]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_24 
       (.I0(SC_MultResult[2]),
        .I1(SR_sum_reg[2]),
        .O(\SR_Y[4]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_25 
       (.I0(SC_MultResult[1]),
        .I1(SR_sum_reg[1]),
        .O(\SR_Y[4]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_26 
       (.I0(SC_MultResult[0]),
        .I1(SR_sum_reg[0]),
        .O(\SR_Y[4]_i_26_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \SR_Y[4]_i_28 
       (.I0(\SR_sum_reg[0]_i_11_n_5 ),
        .I1(\SR_sum_reg[0]_i_11_n_4 ),
        .I2(\SR_Y_reg[4]_i_27_n_5 ),
        .O(\SR_Y[4]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \SR_Y[4]_i_29 
       (.I0(\SR_sum_reg[0]_i_11_n_5 ),
        .I1(\SR_Y_reg[4]_i_27_n_6 ),
        .O(\SR_Y[4]_i_29_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_30 
       (.I0(\SR_Y_reg[4]_i_27_n_7 ),
        .I1(\SR_sum_reg[0]_i_11_n_6 ),
        .O(\SR_Y[4]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_31 
       (.I0(\SR_sum_reg[0]_i_12_n_4 ),
        .I1(\SR_sum_reg[0]_i_11_n_7 ),
        .O(SC_MultResult[3]));
  LUT3 #(
    .INIT(8'h17)) 
    \SR_Y[4]_i_32 
       (.I0(\SR_Y[4]_i_40_n_0 ),
        .I1(\SR_Y[4]_i_41_n_0 ),
        .I2(\SR_Y[4]_i_42_n_0 ),
        .O(\SR_Y[4]_i_32_n_0 ));
  LUT3 #(
    .INIT(8'h17)) 
    \SR_Y[4]_i_33 
       (.I0(\SR_Y[4]_i_43_n_0 ),
        .I1(\SR_Y[4]_i_44_n_0 ),
        .I2(\SR_Y[4]_i_45_n_0 ),
        .O(\SR_Y[4]_i_33_n_0 ));
  LUT3 #(
    .INIT(8'h17)) 
    \SR_Y[4]_i_34 
       (.I0(\SR_Y[4]_i_46_n_0 ),
        .I1(\SR_Y[4]_i_47_n_0 ),
        .I2(\SR_Y[4]_i_48_n_0 ),
        .O(\SR_Y[4]_i_34_n_0 ));
  LUT3 #(
    .INIT(8'h17)) 
    \SR_Y[4]_i_35 
       (.I0(\SR_sum[0]_i_32_n_0 ),
        .I1(\SR_sum[0]_i_31_n_0 ),
        .I2(\SR_sum[0]_i_33_n_0 ),
        .O(\SR_Y[4]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \SR_Y[4]_i_36 
       (.I0(\SR_Y[4]_i_32_n_0 ),
        .I1(\SR_Y[4]_i_49_n_0 ),
        .I2(\SR_Y[4]_i_50_n_0 ),
        .I3(\SR_Y[4]_i_51_n_0 ),
        .O(\SR_Y[4]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \SR_Y[4]_i_37 
       (.I0(\SR_Y[4]_i_45_n_0 ),
        .I1(\SR_Y[4]_i_44_n_0 ),
        .I2(\SR_Y[4]_i_43_n_0 ),
        .I3(\SR_Y[4]_i_41_n_0 ),
        .I4(\SR_Y[4]_i_40_n_0 ),
        .I5(\SR_Y[4]_i_42_n_0 ),
        .O(\SR_Y[4]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \SR_Y[4]_i_38 
       (.I0(\SR_Y[4]_i_48_n_0 ),
        .I1(\SR_Y[4]_i_47_n_0 ),
        .I2(\SR_Y[4]_i_46_n_0 ),
        .I3(\SR_Y[4]_i_44_n_0 ),
        .I4(\SR_Y[4]_i_43_n_0 ),
        .I5(\SR_Y[4]_i_45_n_0 ),
        .O(\SR_Y[4]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \SR_Y[4]_i_39 
       (.I0(\SR_sum[0]_i_33_n_0 ),
        .I1(\SR_sum[0]_i_31_n_0 ),
        .I2(\SR_sum[0]_i_32_n_0 ),
        .I3(\SR_Y[4]_i_47_n_0 ),
        .I4(\SR_Y[4]_i_46_n_0 ),
        .I5(\SR_Y[4]_i_48_n_0 ),
        .O(\SR_Y[4]_i_39_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hF5FD7F5F)) 
    \SR_Y[4]_i_40 
       (.I0(\SR_shiftRegister[0] [4]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_40_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h557D7D55)) 
    \SR_Y[4]_i_41 
       (.I0(\SR_shiftRegister[0] [5]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_Y[4]_i_41_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF7D7DFF)) 
    \SR_Y[4]_i_42 
       (.I0(\SR_shiftRegister[0] [6]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_42_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hF5FD7F5F)) 
    \SR_Y[4]_i_43 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_43_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h557D7D55)) 
    \SR_Y[4]_i_44 
       (.I0(\SR_shiftRegister[0] [4]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_Y[4]_i_44_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFF7D7DFF)) 
    \SR_Y[4]_i_45 
       (.I0(\SR_shiftRegister[0] [5]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_45_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hF5FD7F5F)) 
    \SR_Y[4]_i_46 
       (.I0(\SR_shiftRegister[0] [2]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_46_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h557D7D55)) 
    \SR_Y[4]_i_47 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_Y[4]_i_47_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFF7D7DFF)) 
    \SR_Y[4]_i_48 
       (.I0(\SR_shiftRegister[0] [4]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_48_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h557D7D55)) 
    \SR_Y[4]_i_49 
       (.I0(\SR_shiftRegister[0] [6]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_Y[4]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_5 
       (.I0(SC_MultResult[11]),
        .I1(SR_sum_reg[11]),
        .O(\SR_Y[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hF5FD7F5F)) 
    \SR_Y[4]_i_50 
       (.I0(\SR_shiftRegister[0] [5]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_50_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF7D7DFF)) 
    \SR_Y[4]_i_51 
       (.I0(\SR_shiftRegister[0] [7]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_Y[4]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_6 
       (.I0(SC_MultResult[10]),
        .I1(SR_sum_reg[10]),
        .O(\SR_Y[4]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_7 
       (.I0(SC_MultResult[9]),
        .I1(SR_sum_reg[9]),
        .O(\SR_Y[4]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[4]_i_8 
       (.I0(SC_MultResult[8]),
        .I1(SR_sum_reg[8]),
        .O(\SR_Y[4]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[5]_i_1 
       (.I0(\SR_Y[7]_i_3_n_0 ),
        .I1(L[12]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \SR_Y[6]_i_1 
       (.I0(\SR_Y[7]_i_3_n_0 ),
        .I1(L[12]),
        .I2(L[13]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \SR_Y[7]_i_1 
       (.I0(L[12]),
        .I1(\SR_Y[7]_i_3_n_0 ),
        .I2(L[13]),
        .I3(L[14]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hFFF55FFFDDF55F77)) 
    \SR_Y[7]_i_11 
       (.I0(\SR_shiftRegister[0] [7]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [6]),
        .O(\SR_Y[7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFDDD777F)) 
    \SR_Y[7]_i_12 
       (.I0(\SR_shiftRegister[0] [7]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_Y[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hDDC00377FFFFFFFF)) 
    \SR_Y[7]_i_13 
       (.I0(\SR_shiftRegister[0] [6]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [7]),
        .O(\SR_Y[7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h333AACCC220AA088)) 
    \SR_Y[7]_i_15 
       (.I0(\SR_shiftRegister[0] [6]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [5]),
        .O(\SR_Y[7]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h333AACCC220AA088)) 
    \SR_Y[7]_i_16 
       (.I0(\SR_shiftRegister[0] [5]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [4]),
        .O(\SR_Y[7]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h333AACCC220AA088)) 
    \SR_Y[7]_i_17 
       (.I0(\SR_shiftRegister[0] [4]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [3]),
        .O(\SR_Y[7]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h333AACCC220AA088)) 
    \SR_Y[7]_i_18 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [2]),
        .O(\SR_Y[7]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hD32C6060)) 
    \SR_Y[7]_i_19 
       (.I0(\SR_shiftRegister[0] [5]),
        .I1(\SR_shiftRegister[0] [6]),
        .I2(SC_multOperand2[4]),
        .I3(\SR_shiftRegister[0] [7]),
        .I4(SC_multOperand2[3]),
        .O(\SR_Y[7]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    \SR_Y[7]_i_20 
       (.I0(\SR_shiftRegister[0] [4]),
        .I1(\SR_shiftRegister[0] [5]),
        .I2(SC_multOperand2[4]),
        .I3(\SR_shiftRegister[0] [6]),
        .I4(SC_multOperand2[3]),
        .O(\SR_Y[7]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    \SR_Y[7]_i_21 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(\SR_shiftRegister[0] [4]),
        .I2(SC_multOperand2[4]),
        .I3(\SR_shiftRegister[0] [5]),
        .I4(SC_multOperand2[3]),
        .O(\SR_Y[7]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h2CD39F9F)) 
    \SR_Y[7]_i_22 
       (.I0(\SR_shiftRegister[0] [2]),
        .I1(\SR_shiftRegister[0] [3]),
        .I2(SC_multOperand2[4]),
        .I3(\SR_shiftRegister[0] [4]),
        .I4(SC_multOperand2[3]),
        .O(\SR_Y[7]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h134001C400000000)) 
    \SR_Y[7]_i_25 
       (.I0(\SR_shiftRegister[0] [7]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[3]),
        .I5(\SR_shiftRegister[0] [6]),
        .O(\SR_Y[7]_i_25_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \SR_Y[7]_i_26 
       (.I0(\SR_Y[4]_i_50_n_0 ),
        .I1(\SR_Y[4]_i_49_n_0 ),
        .I2(\SR_Y[4]_i_51_n_0 ),
        .O(\SR_Y[7]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hCE3FFCB3DD7FFD77)) 
    \SR_Y[7]_i_27 
       (.I0(\SR_shiftRegister[0] [6]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[3]),
        .I5(\SR_shiftRegister[0] [7]),
        .O(\SR_Y[7]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h8171FC0C1EEE3CCC)) 
    \SR_Y[7]_i_28 
       (.I0(SC_multOperand2[0]),
        .I1(\SR_Y[4]_i_50_n_0 ),
        .I2(\SR_shiftRegister[0] [6]),
        .I3(SC_multOperand2[2]),
        .I4(\SR_shiftRegister[0] [7]),
        .I5(SC_multOperand2[1]),
        .O(\SR_Y[7]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \SR_Y[7]_i_3 
       (.I0(L[11]),
        .I1(L[9]),
        .I2(L[7]),
        .I3(\SR_Y_reg[4]_i_3_n_5 ),
        .I4(L[8]),
        .I5(L[10]),
        .O(\SR_Y[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h542A)) 
    \SR_Y[7]_i_31 
       (.I0(SR_readAddress_reg__0[3]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .O(SC_multOperand2[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h724E)) 
    \SR_Y[7]_i_32 
       (.I0(SR_readAddress_reg__0[3]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .O(SC_multOperand2[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6006)) 
    \SR_Y[7]_i_37 
       (.I0(SR_readAddress_reg__0[2]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[1]),
        .O(SC_multOperand2[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_42 
       (.I0(\SR_shiftRegister_reg[3]__0 [7]),
        .I1(\SR_shiftRegister_reg[2]__0 [7]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [7]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [7]),
        .O(\SR_Y[7]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_43 
       (.I0(\SR_shiftRegister_reg[7]__0 [7]),
        .I1(\SR_shiftRegister_reg[6]__0 [7]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [7]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [7]),
        .O(\SR_Y[7]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_44 
       (.I0(\SR_shiftRegister_reg[11]__0 [7]),
        .I1(\SR_shiftRegister_reg[10]__0 [7]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [7]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [7]),
        .O(\SR_Y[7]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_45 
       (.I0(\SR_shiftRegister_reg[15]__0 [7]),
        .I1(\SR_shiftRegister_reg[14]__0 [7]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [7]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [7]),
        .O(\SR_Y[7]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_46 
       (.I0(\SR_shiftRegister_reg[3]__0 [6]),
        .I1(\SR_shiftRegister_reg[2]__0 [6]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [6]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [6]),
        .O(\SR_Y[7]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_47 
       (.I0(\SR_shiftRegister_reg[7]__0 [6]),
        .I1(\SR_shiftRegister_reg[6]__0 [6]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [6]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [6]),
        .O(\SR_Y[7]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_48 
       (.I0(\SR_shiftRegister_reg[11]__0 [6]),
        .I1(\SR_shiftRegister_reg[10]__0 [6]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [6]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [6]),
        .O(\SR_Y[7]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_49 
       (.I0(\SR_shiftRegister_reg[15]__0 [6]),
        .I1(\SR_shiftRegister_reg[14]__0 [6]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [6]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [6]),
        .O(\SR_Y[7]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[7]_i_5 
       (.I0(SR_sum_reg[14]),
        .I1(SC_MultResult[14]),
        .O(\SR_Y[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_50 
       (.I0(\SR_shiftRegister_reg[3]__0 [5]),
        .I1(\SR_shiftRegister_reg[2]__0 [5]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [5]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [5]),
        .O(\SR_Y[7]_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_51 
       (.I0(\SR_shiftRegister_reg[7]__0 [5]),
        .I1(\SR_shiftRegister_reg[6]__0 [5]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [5]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [5]),
        .O(\SR_Y[7]_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_52 
       (.I0(\SR_shiftRegister_reg[11]__0 [5]),
        .I1(\SR_shiftRegister_reg[10]__0 [5]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [5]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [5]),
        .O(\SR_Y[7]_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_53 
       (.I0(\SR_shiftRegister_reg[15]__0 [5]),
        .I1(\SR_shiftRegister_reg[14]__0 [5]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [5]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [5]),
        .O(\SR_Y[7]_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_54 
       (.I0(\SR_shiftRegister_reg[3]__0 [4]),
        .I1(\SR_shiftRegister_reg[2]__0 [4]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [4]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [4]),
        .O(\SR_Y[7]_i_54_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_55 
       (.I0(\SR_shiftRegister_reg[7]__0 [4]),
        .I1(\SR_shiftRegister_reg[6]__0 [4]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [4]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [4]),
        .O(\SR_Y[7]_i_55_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_56 
       (.I0(\SR_shiftRegister_reg[11]__0 [4]),
        .I1(\SR_shiftRegister_reg[10]__0 [4]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [4]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [4]),
        .O(\SR_Y[7]_i_56_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_Y[7]_i_57 
       (.I0(\SR_shiftRegister_reg[15]__0 [4]),
        .I1(\SR_shiftRegister_reg[14]__0 [4]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [4]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [4]),
        .O(\SR_Y[7]_i_57_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[7]_i_6 
       (.I0(SC_MultResult[13]),
        .I1(SR_sum_reg[13]),
        .O(\SR_Y[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \SR_Y[7]_i_7 
       (.I0(SC_MultResult[12]),
        .I1(SR_sum_reg[12]),
        .O(\SR_Y[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \SR_Y[7]_i_9 
       (.I0(\SR_Y_reg[7]_i_14_n_1 ),
        .I1(\SR_Y_reg[7]_i_10_n_4 ),
        .I2(\SR_Y_reg[7]_i_8_n_7 ),
        .O(\SR_Y[7]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[0]),
        .Q(O_Y_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[1]),
        .Q(O_Y_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[2]),
        .Q(O_Y_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[3]),
        .Q(O_Y_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[4]),
        .Q(O_Y_OBUF[4]));
  CARRY4 \SR_Y_reg[4]_i_10 
       (.CI(\<const0> ),
        .CO({\SR_Y_reg[4]_i_10_n_0 ,\SR_Y_reg[4]_i_10_n_1 ,\SR_Y_reg[4]_i_10_n_2 ,\SR_Y_reg[4]_i_10_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum_reg[0]_i_11_n_5 ,\SR_Y_reg[4]_i_27_n_6 ,\SR_Y_reg[4]_i_27_n_7 ,\SR_sum_reg[0]_i_12_n_4 }),
        .O({SC_MultResult[6:4],\NLW_SR_Y_reg[4]_i_10_O_UNCONNECTED [0]}),
        .S({\SR_Y[4]_i_28_n_0 ,\SR_Y[4]_i_29_n_0 ,\SR_Y[4]_i_30_n_0 ,SC_MultResult[3]}));
  CARRY4 \SR_Y_reg[4]_i_2 
       (.CI(\SR_Y_reg[4]_i_3_n_0 ),
        .CO({\SR_Y_reg[4]_i_2_n_0 ,\SR_Y_reg[4]_i_2_n_1 ,\SR_Y_reg[4]_i_2_n_2 ,\SR_Y_reg[4]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI(SC_MultResult[11:8]),
        .O(L[11:8]),
        .S({\SR_Y[4]_i_5_n_0 ,\SR_Y[4]_i_6_n_0 ,\SR_Y[4]_i_7_n_0 ,\SR_Y[4]_i_8_n_0 }));
  CARRY4 \SR_Y_reg[4]_i_27 
       (.CI(\SR_sum_reg[0]_i_12_n_0 ),
        .CO({\SR_Y_reg[4]_i_27_n_0 ,\SR_Y_reg[4]_i_27_n_1 ,\SR_Y_reg[4]_i_27_n_2 ,\SR_Y_reg[4]_i_27_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_Y[4]_i_32_n_0 ,\SR_Y[4]_i_33_n_0 ,\SR_Y[4]_i_34_n_0 ,\SR_Y[4]_i_35_n_0 }),
        .O({\SR_Y_reg[4]_i_27_n_4 ,\SR_Y_reg[4]_i_27_n_5 ,\SR_Y_reg[4]_i_27_n_6 ,\SR_Y_reg[4]_i_27_n_7 }),
        .S({\SR_Y[4]_i_36_n_0 ,\SR_Y[4]_i_37_n_0 ,\SR_Y[4]_i_38_n_0 ,\SR_Y[4]_i_39_n_0 }));
  CARRY4 \SR_Y_reg[4]_i_3 
       (.CI(\SR_Y_reg[4]_i_9_n_0 ),
        .CO({\SR_Y_reg[4]_i_3_n_0 ,\SR_Y_reg[4]_i_3_n_1 ,\SR_Y_reg[4]_i_3_n_2 ,\SR_Y_reg[4]_i_3_n_3 }),
        .CYINIT(\<const0> ),
        .DI(SC_MultResult[7:4]),
        .O({L[7],\SR_Y_reg[4]_i_3_n_5 ,\NLW_SR_Y_reg[4]_i_3_O_UNCONNECTED [1:0]}),
        .S({\SR_Y[4]_i_11_n_0 ,\SR_Y[4]_i_12_n_0 ,\SR_Y[4]_i_13_n_0 ,\SR_Y[4]_i_14_n_0 }));
  CARRY4 \SR_Y_reg[4]_i_4 
       (.CI(\SR_Y_reg[4]_i_10_n_0 ),
        .CO({\SR_Y_reg[4]_i_4_n_0 ,\SR_Y_reg[4]_i_4_n_1 ,\SR_Y_reg[4]_i_4_n_2 ,\SR_Y_reg[4]_i_4_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_Y[4]_i_15_n_0 ,\SR_Y[4]_i_16_n_0 ,\SR_Y[4]_i_17_n_0 ,\SR_Y[4]_i_18_n_0 }),
        .O(SC_MultResult[10:7]),
        .S({\SR_Y[4]_i_19_n_0 ,\SR_Y[4]_i_20_n_0 ,\SR_Y[4]_i_21_n_0 ,\SR_Y[4]_i_22_n_0 }));
  CARRY4 \SR_Y_reg[4]_i_9 
       (.CI(\<const0> ),
        .CO({\SR_Y_reg[4]_i_9_n_0 ,\SR_Y_reg[4]_i_9_n_1 ,\SR_Y_reg[4]_i_9_n_2 ,\SR_Y_reg[4]_i_9_n_3 }),
        .CYINIT(\<const0> ),
        .DI({SR_sum_reg[3],SC_MultResult[2:0]}),
        .S({\SR_Y[4]_i_23_n_0 ,\SR_Y[4]_i_24_n_0 ,\SR_Y[4]_i_25_n_0 ,\SR_Y[4]_i_26_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[5]),
        .Q(O_Y_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[6]),
        .Q(O_Y_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_Y_reg[7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadY_IBUF),
        .CLR(I_reset_IBUF),
        .D(p_0_in[7]),
        .Q(O_Y_OBUF[7]));
  CARRY4 \SR_Y_reg[7]_i_10 
       (.CI(\SR_sum_reg[0]_i_11_n_0 ),
        .CO({\SR_Y_reg[7]_i_10_n_0 ,\SR_Y_reg[7]_i_10_n_1 ,\SR_Y_reg[7]_i_10_n_2 ,\SR_Y_reg[7]_i_10_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_Y[7]_i_15_n_0 ,\SR_Y[7]_i_16_n_0 ,\SR_Y[7]_i_17_n_0 ,\SR_Y[7]_i_18_n_0 }),
        .O({\SR_Y_reg[7]_i_10_n_4 ,\SR_Y_reg[7]_i_10_n_5 ,\SR_Y_reg[7]_i_10_n_6 ,\SR_Y_reg[7]_i_10_n_7 }),
        .S({\SR_Y[7]_i_19_n_0 ,\SR_Y[7]_i_20_n_0 ,\SR_Y[7]_i_21_n_0 ,\SR_Y[7]_i_22_n_0 }));
  CARRY4 \SR_Y_reg[7]_i_14 
       (.CI(\SR_Y_reg[4]_i_27_n_0 ),
        .CO({\SR_Y_reg[7]_i_14_n_1 ,\NLW_SR_Y_reg[7]_i_14_CO_UNCONNECTED [1],\SR_Y_reg[7]_i_14_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\SR_Y[7]_i_25_n_0 ,\SR_Y[7]_i_26_n_0 }),
        .O({\SR_Y_reg[7]_i_14_n_6 ,\SR_Y_reg[7]_i_14_n_7 }),
        .S({\<const0> ,\<const1> ,\SR_Y[7]_i_27_n_0 ,\SR_Y[7]_i_28_n_0 }));
  CARRY4 \SR_Y_reg[7]_i_2 
       (.CI(\SR_Y_reg[4]_i_2_n_0 ),
        .CO({\SR_Y_reg[7]_i_2_n_2 ,\SR_Y_reg[7]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,SC_MultResult[13:12]}),
        .O(L[14:12]),
        .S({\<const0> ,\SR_Y[7]_i_5_n_0 ,\SR_Y[7]_i_6_n_0 ,\SR_Y[7]_i_7_n_0 }));
  MUXF8 \SR_Y_reg[7]_i_23 
       (.I0(\SR_Y_reg[7]_i_33_n_0 ),
        .I1(\SR_Y_reg[7]_i_34_n_0 ),
        .O(\SR_shiftRegister[0] [7]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_Y_reg[7]_i_24 
       (.I0(\SR_Y_reg[7]_i_35_n_0 ),
        .I1(\SR_Y_reg[7]_i_36_n_0 ),
        .O(\SR_shiftRegister[0] [6]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_Y_reg[7]_i_29 
       (.I0(\SR_Y_reg[7]_i_38_n_0 ),
        .I1(\SR_Y_reg[7]_i_39_n_0 ),
        .O(\SR_shiftRegister[0] [5]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_Y_reg[7]_i_30 
       (.I0(\SR_Y_reg[7]_i_40_n_0 ),
        .I1(\SR_Y_reg[7]_i_41_n_0 ),
        .O(\SR_shiftRegister[0] [4]),
        .S(SR_readAddress_reg__0[3]));
  MUXF7 \SR_Y_reg[7]_i_33 
       (.I0(\SR_Y[7]_i_42_n_0 ),
        .I1(\SR_Y[7]_i_43_n_0 ),
        .O(\SR_Y_reg[7]_i_33_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_34 
       (.I0(\SR_Y[7]_i_44_n_0 ),
        .I1(\SR_Y[7]_i_45_n_0 ),
        .O(\SR_Y_reg[7]_i_34_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_35 
       (.I0(\SR_Y[7]_i_46_n_0 ),
        .I1(\SR_Y[7]_i_47_n_0 ),
        .O(\SR_Y_reg[7]_i_35_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_36 
       (.I0(\SR_Y[7]_i_48_n_0 ),
        .I1(\SR_Y[7]_i_49_n_0 ),
        .O(\SR_Y_reg[7]_i_36_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_38 
       (.I0(\SR_Y[7]_i_50_n_0 ),
        .I1(\SR_Y[7]_i_51_n_0 ),
        .O(\SR_Y_reg[7]_i_38_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_39 
       (.I0(\SR_Y[7]_i_52_n_0 ),
        .I1(\SR_Y[7]_i_53_n_0 ),
        .O(\SR_Y_reg[7]_i_39_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  CARRY4 \SR_Y_reg[7]_i_4 
       (.CI(\SR_Y_reg[4]_i_4_n_0 ),
        .CO({\SR_Y_reg[7]_i_4_n_1 ,\SR_Y_reg[7]_i_4_n_2 ,\SR_Y_reg[7]_i_4_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\SR_Y_reg[7]_i_8_n_5 ,\<const0> ,\SR_Y_reg[7]_i_8_n_7 }),
        .O(SC_MultResult[14:11]),
        .S({\SR_Y_reg[7]_i_8_n_5 ,\SR_Y_reg[7]_i_8_n_5 ,\SR_Y_reg[7]_i_8_n_6 ,\SR_Y[7]_i_9_n_0 }));
  MUXF7 \SR_Y_reg[7]_i_40 
       (.I0(\SR_Y[7]_i_54_n_0 ),
        .I1(\SR_Y[7]_i_55_n_0 ),
        .O(\SR_Y_reg[7]_i_40_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_Y_reg[7]_i_41 
       (.I0(\SR_Y[7]_i_56_n_0 ),
        .I1(\SR_Y[7]_i_57_n_0 ),
        .O(\SR_Y_reg[7]_i_41_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  CARRY4 \SR_Y_reg[7]_i_8 
       (.CI(\SR_Y_reg[7]_i_10_n_0 ),
        .CO({\SR_Y_reg[7]_i_8_n_2 ,\SR_Y_reg[7]_i_8_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\SR_Y[7]_i_11_n_0 }),
        .O({\SR_Y_reg[7]_i_8_n_5 ,\SR_Y_reg[7]_i_8_n_6 ,\SR_Y_reg[7]_i_8_n_7 }),
        .S({\<const0> ,\<const1> ,\SR_Y[7]_i_12_n_0 ,\SR_Y[7]_i_13_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \SR_readAddress[0]_i_1 
       (.I0(SR_readAddress_reg__0[0]),
        .I1(I_initAddress_IBUF),
        .O(\SR_readAddress[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \SR_readAddress[1]_i_1 
       (.I0(SR_readAddress_reg__0[1]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(I_initAddress_IBUF),
        .O(\SR_readAddress[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \SR_readAddress[2]_i_1 
       (.I0(SR_readAddress_reg__0[2]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(I_initAddress_IBUF),
        .O(\SR_readAddress[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \SR_readAddress[3]_i_1 
       (.I0(I_incrAddress_IBUF),
        .I1(I_initAddress_IBUF),
        .O(\SR_readAddress[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \SR_readAddress[3]_i_2 
       (.I0(SR_readAddress_reg__0[3]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(I_initAddress_IBUF),
        .O(\SR_readAddress[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \SR_readAddress_reg[0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_readAddress[3]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_readAddress[0]_i_1_n_0 ),
        .Q(SR_readAddress_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_readAddress_reg[1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_readAddress[3]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_readAddress[1]_i_1_n_0 ),
        .Q(SR_readAddress_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_readAddress_reg[2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_readAddress[3]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_readAddress[2]_i_1_n_0 ),
        .Q(SR_readAddress_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_readAddress_reg[3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_readAddress[3]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_readAddress[3]_i_2_n_0 ),
        .Q(SR_readAddress_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[0]),
        .Q(\SR_shiftRegister_reg[0]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[1]),
        .Q(\SR_shiftRegister_reg[0]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[2]),
        .Q(\SR_shiftRegister_reg[0]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[3]),
        .Q(\SR_shiftRegister_reg[0]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[4]),
        .Q(\SR_shiftRegister_reg[0]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[5]),
        .Q(\SR_shiftRegister_reg[0]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[6]),
        .Q(\SR_shiftRegister_reg[0]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[0][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(I_inputSample_IBUF[7]),
        .Q(\SR_shiftRegister_reg[0]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [0]),
        .Q(\SR_shiftRegister_reg[10]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [1]),
        .Q(\SR_shiftRegister_reg[10]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [2]),
        .Q(\SR_shiftRegister_reg[10]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [3]),
        .Q(\SR_shiftRegister_reg[10]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [4]),
        .Q(\SR_shiftRegister_reg[10]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [5]),
        .Q(\SR_shiftRegister_reg[10]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [6]),
        .Q(\SR_shiftRegister_reg[10]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[10][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[9]__0 [7]),
        .Q(\SR_shiftRegister_reg[10]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [0]),
        .Q(\SR_shiftRegister_reg[11]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [1]),
        .Q(\SR_shiftRegister_reg[11]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [2]),
        .Q(\SR_shiftRegister_reg[11]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [3]),
        .Q(\SR_shiftRegister_reg[11]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [4]),
        .Q(\SR_shiftRegister_reg[11]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [5]),
        .Q(\SR_shiftRegister_reg[11]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [6]),
        .Q(\SR_shiftRegister_reg[11]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[11][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[10]__0 [7]),
        .Q(\SR_shiftRegister_reg[11]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [0]),
        .Q(\SR_shiftRegister_reg[12]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [1]),
        .Q(\SR_shiftRegister_reg[12]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [2]),
        .Q(\SR_shiftRegister_reg[12]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [3]),
        .Q(\SR_shiftRegister_reg[12]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [4]),
        .Q(\SR_shiftRegister_reg[12]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [5]),
        .Q(\SR_shiftRegister_reg[12]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [6]),
        .Q(\SR_shiftRegister_reg[12]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[12][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[11]__0 [7]),
        .Q(\SR_shiftRegister_reg[12]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [0]),
        .Q(\SR_shiftRegister_reg[13]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [1]),
        .Q(\SR_shiftRegister_reg[13]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [2]),
        .Q(\SR_shiftRegister_reg[13]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [3]),
        .Q(\SR_shiftRegister_reg[13]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [4]),
        .Q(\SR_shiftRegister_reg[13]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [5]),
        .Q(\SR_shiftRegister_reg[13]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [6]),
        .Q(\SR_shiftRegister_reg[13]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[13][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[12]__0 [7]),
        .Q(\SR_shiftRegister_reg[13]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [0]),
        .Q(\SR_shiftRegister_reg[14]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [1]),
        .Q(\SR_shiftRegister_reg[14]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [2]),
        .Q(\SR_shiftRegister_reg[14]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [3]),
        .Q(\SR_shiftRegister_reg[14]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [4]),
        .Q(\SR_shiftRegister_reg[14]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [5]),
        .Q(\SR_shiftRegister_reg[14]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [6]),
        .Q(\SR_shiftRegister_reg[14]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[14][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[13]__0 [7]),
        .Q(\SR_shiftRegister_reg[14]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [0]),
        .Q(\SR_shiftRegister_reg[15]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [1]),
        .Q(\SR_shiftRegister_reg[15]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [2]),
        .Q(\SR_shiftRegister_reg[15]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [3]),
        .Q(\SR_shiftRegister_reg[15]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [4]),
        .Q(\SR_shiftRegister_reg[15]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [5]),
        .Q(\SR_shiftRegister_reg[15]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [6]),
        .Q(\SR_shiftRegister_reg[15]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[15][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[14]__0 [7]),
        .Q(\SR_shiftRegister_reg[15]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [0]),
        .Q(\SR_shiftRegister_reg[1]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [1]),
        .Q(\SR_shiftRegister_reg[1]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [2]),
        .Q(\SR_shiftRegister_reg[1]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [3]),
        .Q(\SR_shiftRegister_reg[1]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [4]),
        .Q(\SR_shiftRegister_reg[1]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [5]),
        .Q(\SR_shiftRegister_reg[1]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [6]),
        .Q(\SR_shiftRegister_reg[1]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[1][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[0]__0 [7]),
        .Q(\SR_shiftRegister_reg[1]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [0]),
        .Q(\SR_shiftRegister_reg[2]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [1]),
        .Q(\SR_shiftRegister_reg[2]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [2]),
        .Q(\SR_shiftRegister_reg[2]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [3]),
        .Q(\SR_shiftRegister_reg[2]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [4]),
        .Q(\SR_shiftRegister_reg[2]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [5]),
        .Q(\SR_shiftRegister_reg[2]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [6]),
        .Q(\SR_shiftRegister_reg[2]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[2][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[1]__0 [7]),
        .Q(\SR_shiftRegister_reg[2]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [0]),
        .Q(\SR_shiftRegister_reg[3]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [1]),
        .Q(\SR_shiftRegister_reg[3]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [2]),
        .Q(\SR_shiftRegister_reg[3]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [3]),
        .Q(\SR_shiftRegister_reg[3]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [4]),
        .Q(\SR_shiftRegister_reg[3]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [5]),
        .Q(\SR_shiftRegister_reg[3]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [6]),
        .Q(\SR_shiftRegister_reg[3]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[3][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[2]__0 [7]),
        .Q(\SR_shiftRegister_reg[3]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [0]),
        .Q(\SR_shiftRegister_reg[4]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [1]),
        .Q(\SR_shiftRegister_reg[4]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [2]),
        .Q(\SR_shiftRegister_reg[4]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [3]),
        .Q(\SR_shiftRegister_reg[4]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [4]),
        .Q(\SR_shiftRegister_reg[4]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [5]),
        .Q(\SR_shiftRegister_reg[4]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [6]),
        .Q(\SR_shiftRegister_reg[4]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[4][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[3]__0 [7]),
        .Q(\SR_shiftRegister_reg[4]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [0]),
        .Q(\SR_shiftRegister_reg[5]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [1]),
        .Q(\SR_shiftRegister_reg[5]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [2]),
        .Q(\SR_shiftRegister_reg[5]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [3]),
        .Q(\SR_shiftRegister_reg[5]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [4]),
        .Q(\SR_shiftRegister_reg[5]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [5]),
        .Q(\SR_shiftRegister_reg[5]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [6]),
        .Q(\SR_shiftRegister_reg[5]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[5][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[4]__0 [7]),
        .Q(\SR_shiftRegister_reg[5]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [0]),
        .Q(\SR_shiftRegister_reg[6]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [1]),
        .Q(\SR_shiftRegister_reg[6]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [2]),
        .Q(\SR_shiftRegister_reg[6]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [3]),
        .Q(\SR_shiftRegister_reg[6]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [4]),
        .Q(\SR_shiftRegister_reg[6]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [5]),
        .Q(\SR_shiftRegister_reg[6]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [6]),
        .Q(\SR_shiftRegister_reg[6]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[6][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[5]__0 [7]),
        .Q(\SR_shiftRegister_reg[6]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [0]),
        .Q(\SR_shiftRegister_reg[7]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [1]),
        .Q(\SR_shiftRegister_reg[7]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [2]),
        .Q(\SR_shiftRegister_reg[7]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [3]),
        .Q(\SR_shiftRegister_reg[7]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [4]),
        .Q(\SR_shiftRegister_reg[7]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [5]),
        .Q(\SR_shiftRegister_reg[7]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [6]),
        .Q(\SR_shiftRegister_reg[7]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[7][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[6]__0 [7]),
        .Q(\SR_shiftRegister_reg[7]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [0]),
        .Q(\SR_shiftRegister_reg[8]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [1]),
        .Q(\SR_shiftRegister_reg[8]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [2]),
        .Q(\SR_shiftRegister_reg[8]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [3]),
        .Q(\SR_shiftRegister_reg[8]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [4]),
        .Q(\SR_shiftRegister_reg[8]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [5]),
        .Q(\SR_shiftRegister_reg[8]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [6]),
        .Q(\SR_shiftRegister_reg[8]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[8][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[7]__0 [7]),
        .Q(\SR_shiftRegister_reg[8]__0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [0]),
        .Q(\SR_shiftRegister_reg[9]__0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [1]),
        .Q(\SR_shiftRegister_reg[9]__0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [2]),
        .Q(\SR_shiftRegister_reg[9]__0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [3]),
        .Q(\SR_shiftRegister_reg[9]__0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [4]),
        .Q(\SR_shiftRegister_reg[9]__0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [5]),
        .Q(\SR_shiftRegister_reg[9]__0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [6]),
        .Q(\SR_shiftRegister_reg[9]__0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_shiftRegister_reg[9][7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(I_loadShift_IBUF),
        .CLR(I_reset_IBUF),
        .D(\SR_shiftRegister_reg[8]__0 [7]),
        .Q(\SR_shiftRegister_reg[9]__0 [7]));
  LUT2 #(
    .INIT(4'hE)) 
    \SR_sum[0]_i_1 
       (.I0(I_loadSum_IBUF),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[0]_i_10 
       (.I0(SC_MultResult[0]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[0]),
        .O(\SR_sum[0]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \SR_sum[0]_i_13 
       (.I0(\SR_sum[0]_i_27_n_0 ),
        .O(\SR_sum[0]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFDDD777F)) 
    \SR_sum[0]_i_14 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_sum[0]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h724E0000)) 
    \SR_sum[0]_i_15 
       (.I0(SR_readAddress_reg__0[3]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(\SR_shiftRegister[0] [1]),
        .O(\SR_sum[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h02228880FDDD777F)) 
    \SR_sum[0]_i_16 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[3]),
        .I5(\SR_sum[0]_i_27_n_0 ),
        .O(\SR_sum[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hCED287B3FDDD777F)) 
    \SR_sum[0]_i_17 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[3]),
        .I5(\SR_shiftRegister[0] [2]),
        .O(\SR_sum[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h113AAC44220AA088)) 
    \SR_sum[0]_i_18 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [0]),
        .O(\SR_sum[0]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h028AA280)) 
    \SR_sum[0]_i_19 
       (.I0(\SR_shiftRegister[0] [0]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_sum[0]_i_19_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \SR_sum[0]_i_20 
       (.I0(\SR_sum[0]_i_31_n_0 ),
        .I1(\SR_sum[0]_i_32_n_0 ),
        .I2(\SR_sum[0]_i_33_n_0 ),
        .O(\SR_sum[0]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h9B4AA1E6A88AA22A)) 
    \SR_sum[0]_i_21 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[3]),
        .I5(\SR_shiftRegister[0] [0]),
        .O(\SR_sum[0]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h60060000)) 
    \SR_sum[0]_i_22 
       (.I0(SR_readAddress_reg__0[2]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(\SR_shiftRegister[0] [1]),
        .O(\SR_sum[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h6696969666666666)) 
    \SR_sum[0]_i_23 
       (.I0(\SR_sum[0]_i_31_n_0 ),
        .I1(\SR_sum[0]_i_33_n_0 ),
        .I2(\SR_shiftRegister[0] [1]),
        .I3(SC_multOperand2[1]),
        .I4(\SR_shiftRegister[0] [0]),
        .I5(SC_multOperand2[2]),
        .O(\SR_sum[0]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h96AAAA96AAAAAAAA)) 
    \SR_sum[0]_i_24 
       (.I0(\SR_sum[0]_i_21_n_0 ),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[3]),
        .I4(SR_readAddress_reg__0[1]),
        .I5(\SR_shiftRegister[0] [2]),
        .O(\SR_sum[0]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hF7C143DF08028020)) 
    \SR_sum[0]_i_25 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[2]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister[0] [0]),
        .O(\SR_sum[0]_i_25_n_0 ));
  LUT5 #(
    .INIT(32'h00828200)) 
    \SR_sum[0]_i_26 
       (.I0(\SR_shiftRegister[0] [0]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_sum[0]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h113AAC44220AA088)) 
    \SR_sum[0]_i_27 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[0]),
        .I3(SR_readAddress_reg__0[1]),
        .I4(SR_readAddress_reg__0[2]),
        .I5(\SR_shiftRegister[0] [2]),
        .O(\SR_sum[0]_i_27_n_0 ));
  LUT3 #(
    .INIT(8'h06)) 
    \SR_sum[0]_i_3 
       (.I0(\SR_sum_reg[0]_i_11_n_7 ),
        .I1(\SR_sum_reg[0]_i_12_n_4 ),
        .I2(I_initSum_IBUF),
        .O(\SR_sum[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h557D7D55)) 
    \SR_sum[0]_i_31 
       (.I0(\SR_shiftRegister[0] [2]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[2]),
        .I4(SR_readAddress_reg__0[3]),
        .O(\SR_sum[0]_i_31_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hF5FD7F5F)) 
    \SR_sum[0]_i_32 
       (.I0(\SR_shiftRegister[0] [1]),
        .I1(SR_readAddress_reg__0[3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_sum[0]_i_32_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFF7D7DFF)) 
    \SR_sum[0]_i_33 
       (.I0(\SR_shiftRegister[0] [3]),
        .I1(SR_readAddress_reg__0[1]),
        .I2(SR_readAddress_reg__0[3]),
        .I3(SR_readAddress_reg__0[0]),
        .I4(SR_readAddress_reg__0[2]),
        .O(\SR_sum[0]_i_33_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF99F)) 
    \SR_sum[0]_i_34 
       (.I0(SR_readAddress_reg__0[3]),
        .I1(SR_readAddress_reg__0[2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[0]),
        .O(SC_multOperand2[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h581A)) 
    \SR_sum[0]_i_35 
       (.I0(SR_readAddress_reg__0[2]),
        .I1(SR_readAddress_reg__0[0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(SR_readAddress_reg__0[3]),
        .O(SC_multOperand2[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[0]_i_4 
       (.I0(SC_MultResult[2]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_45 
       (.I0(\SR_shiftRegister_reg[3]__0 [1]),
        .I1(\SR_shiftRegister_reg[2]__0 [1]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [1]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [1]),
        .O(\SR_sum[0]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_46 
       (.I0(\SR_shiftRegister_reg[7]__0 [1]),
        .I1(\SR_shiftRegister_reg[6]__0 [1]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [1]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [1]),
        .O(\SR_sum[0]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_47 
       (.I0(\SR_shiftRegister_reg[11]__0 [1]),
        .I1(\SR_shiftRegister_reg[10]__0 [1]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [1]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [1]),
        .O(\SR_sum[0]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_48 
       (.I0(\SR_shiftRegister_reg[15]__0 [1]),
        .I1(\SR_shiftRegister_reg[14]__0 [1]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [1]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [1]),
        .O(\SR_sum[0]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_49 
       (.I0(\SR_shiftRegister_reg[3]__0 [2]),
        .I1(\SR_shiftRegister_reg[2]__0 [2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [2]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [2]),
        .O(\SR_sum[0]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[0]_i_5 
       (.I0(SC_MultResult[1]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_50 
       (.I0(\SR_shiftRegister_reg[7]__0 [2]),
        .I1(\SR_shiftRegister_reg[6]__0 [2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [2]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [2]),
        .O(\SR_sum[0]_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_51 
       (.I0(\SR_shiftRegister_reg[11]__0 [2]),
        .I1(\SR_shiftRegister_reg[10]__0 [2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [2]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [2]),
        .O(\SR_sum[0]_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_52 
       (.I0(\SR_shiftRegister_reg[15]__0 [2]),
        .I1(\SR_shiftRegister_reg[14]__0 [2]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [2]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [2]),
        .O(\SR_sum[0]_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_53 
       (.I0(\SR_shiftRegister_reg[3]__0 [0]),
        .I1(\SR_shiftRegister_reg[2]__0 [0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [0]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [0]),
        .O(\SR_sum[0]_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_54 
       (.I0(\SR_shiftRegister_reg[7]__0 [0]),
        .I1(\SR_shiftRegister_reg[6]__0 [0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [0]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [0]),
        .O(\SR_sum[0]_i_54_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_55 
       (.I0(\SR_shiftRegister_reg[11]__0 [0]),
        .I1(\SR_shiftRegister_reg[10]__0 [0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [0]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [0]),
        .O(\SR_sum[0]_i_55_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_56 
       (.I0(\SR_shiftRegister_reg[15]__0 [0]),
        .I1(\SR_shiftRegister_reg[14]__0 [0]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [0]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [0]),
        .O(\SR_sum[0]_i_56_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_57 
       (.I0(\SR_shiftRegister_reg[3]__0 [3]),
        .I1(\SR_shiftRegister_reg[2]__0 [3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[1]__0 [3]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[0]__0 [3]),
        .O(\SR_sum[0]_i_57_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_58 
       (.I0(\SR_shiftRegister_reg[7]__0 [3]),
        .I1(\SR_shiftRegister_reg[6]__0 [3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[5]__0 [3]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[4]__0 [3]),
        .O(\SR_sum[0]_i_58_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_59 
       (.I0(\SR_shiftRegister_reg[11]__0 [3]),
        .I1(\SR_shiftRegister_reg[10]__0 [3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[9]__0 [3]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[8]__0 [3]),
        .O(\SR_sum[0]_i_59_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[0]_i_6 
       (.I0(SC_MultResult[0]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SR_sum[0]_i_60 
       (.I0(\SR_shiftRegister_reg[15]__0 [3]),
        .I1(\SR_shiftRegister_reg[14]__0 [3]),
        .I2(SR_readAddress_reg__0[1]),
        .I3(\SR_shiftRegister_reg[13]__0 [3]),
        .I4(SR_readAddress_reg__0[0]),
        .I5(\SR_shiftRegister_reg[12]__0 [3]),
        .O(\SR_sum[0]_i_60_n_0 ));
  LUT4 #(
    .INIT(16'h0906)) 
    \SR_sum[0]_i_7 
       (.I0(\SR_sum_reg[0]_i_12_n_4 ),
        .I1(\SR_sum_reg[0]_i_11_n_7 ),
        .I2(I_initSum_IBUF),
        .I3(SR_sum_reg[3]),
        .O(\SR_sum[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[0]_i_8 
       (.I0(SC_MultResult[2]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[2]),
        .O(\SR_sum[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[0]_i_9 
       (.I0(SC_MultResult[1]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[1]),
        .O(\SR_sum[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[12]_i_2 
       (.I0(SC_MultResult[13]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[12]_i_3 
       (.I0(SC_MultResult[12]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[12]_i_4 
       (.I0(SC_MultResult[14]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[14]),
        .O(\SR_sum[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[12]_i_5 
       (.I0(SC_MultResult[13]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[13]),
        .O(\SR_sum[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[12]_i_6 
       (.I0(SC_MultResult[12]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[12]),
        .O(\SR_sum[12]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[4]_i_2 
       (.I0(SC_MultResult[7]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[4]_i_3 
       (.I0(SC_MultResult[6]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[4]_i_4 
       (.I0(SC_MultResult[5]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[4]_i_5 
       (.I0(SC_MultResult[4]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[4]_i_6 
       (.I0(SC_MultResult[7]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[7]),
        .O(\SR_sum[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[4]_i_7 
       (.I0(SC_MultResult[6]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[6]),
        .O(\SR_sum[4]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[4]_i_8 
       (.I0(SC_MultResult[5]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[5]),
        .O(\SR_sum[4]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[4]_i_9 
       (.I0(SC_MultResult[4]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[4]),
        .O(\SR_sum[4]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[8]_i_2 
       (.I0(SC_MultResult[11]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[8]_i_3 
       (.I0(SC_MultResult[10]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[8]_i_4 
       (.I0(SC_MultResult[9]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SR_sum[8]_i_5 
       (.I0(SC_MultResult[8]),
        .I1(I_initSum_IBUF),
        .O(\SR_sum[8]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[8]_i_6 
       (.I0(SC_MultResult[11]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[11]),
        .O(\SR_sum[8]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[8]_i_7 
       (.I0(SC_MultResult[10]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[10]),
        .O(\SR_sum[8]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[8]_i_8 
       (.I0(SC_MultResult[9]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[9]),
        .O(\SR_sum[8]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \SR_sum[8]_i_9 
       (.I0(SC_MultResult[8]),
        .I1(I_initSum_IBUF),
        .I2(SR_sum_reg[8]),
        .O(\SR_sum[8]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[0] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[0]_i_2_n_7 ),
        .Q(SR_sum_reg[0]));
  CARRY4 \SR_sum_reg[0]_i_11 
       (.CI(\<const0> ),
        .CO({\SR_sum_reg[0]_i_11_n_0 ,\SR_sum_reg[0]_i_11_n_1 ,\SR_sum_reg[0]_i_11_n_2 ,\SR_sum_reg[0]_i_11_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum[0]_i_13_n_0 ,\SR_sum[0]_i_14_n_0 ,\SR_sum[0]_i_15_n_0 ,\<const0> }),
        .O({\SR_sum_reg[0]_i_11_n_4 ,\SR_sum_reg[0]_i_11_n_5 ,\SR_sum_reg[0]_i_11_n_6 ,\SR_sum_reg[0]_i_11_n_7 }),
        .S({\SR_sum[0]_i_16_n_0 ,\SR_sum[0]_i_17_n_0 ,\SR_sum[0]_i_18_n_0 ,\SR_sum[0]_i_19_n_0 }));
  CARRY4 \SR_sum_reg[0]_i_12 
       (.CI(\<const0> ),
        .CO({\SR_sum_reg[0]_i_12_n_0 ,\SR_sum_reg[0]_i_12_n_1 ,\SR_sum_reg[0]_i_12_n_2 ,\SR_sum_reg[0]_i_12_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum[0]_i_20_n_0 ,\SR_sum[0]_i_21_n_0 ,\SR_sum[0]_i_22_n_0 ,\<const0> }),
        .O({\SR_sum_reg[0]_i_12_n_4 ,SC_MultResult[2:0]}),
        .S({\SR_sum[0]_i_23_n_0 ,\SR_sum[0]_i_24_n_0 ,\SR_sum[0]_i_25_n_0 ,\SR_sum[0]_i_26_n_0 }));
  CARRY4 \SR_sum_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\SR_sum_reg[0]_i_2_n_0 ,\SR_sum_reg[0]_i_2_n_1 ,\SR_sum_reg[0]_i_2_n_2 ,\SR_sum_reg[0]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum[0]_i_3_n_0 ,\SR_sum[0]_i_4_n_0 ,\SR_sum[0]_i_5_n_0 ,\SR_sum[0]_i_6_n_0 }),
        .O({\SR_sum_reg[0]_i_2_n_4 ,\SR_sum_reg[0]_i_2_n_5 ,\SR_sum_reg[0]_i_2_n_6 ,\SR_sum_reg[0]_i_2_n_7 }),
        .S({\SR_sum[0]_i_7_n_0 ,\SR_sum[0]_i_8_n_0 ,\SR_sum[0]_i_9_n_0 ,\SR_sum[0]_i_10_n_0 }));
  MUXF8 \SR_sum_reg[0]_i_28 
       (.I0(\SR_sum_reg[0]_i_37_n_0 ),
        .I1(\SR_sum_reg[0]_i_38_n_0 ),
        .O(\SR_shiftRegister[0] [1]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_sum_reg[0]_i_29 
       (.I0(\SR_sum_reg[0]_i_39_n_0 ),
        .I1(\SR_sum_reg[0]_i_40_n_0 ),
        .O(\SR_shiftRegister[0] [2]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_sum_reg[0]_i_30 
       (.I0(\SR_sum_reg[0]_i_41_n_0 ),
        .I1(\SR_sum_reg[0]_i_42_n_0 ),
        .O(\SR_shiftRegister[0] [0]),
        .S(SR_readAddress_reg__0[3]));
  MUXF8 \SR_sum_reg[0]_i_36 
       (.I0(\SR_sum_reg[0]_i_43_n_0 ),
        .I1(\SR_sum_reg[0]_i_44_n_0 ),
        .O(\SR_shiftRegister[0] [3]),
        .S(SR_readAddress_reg__0[3]));
  MUXF7 \SR_sum_reg[0]_i_37 
       (.I0(\SR_sum[0]_i_45_n_0 ),
        .I1(\SR_sum[0]_i_46_n_0 ),
        .O(\SR_sum_reg[0]_i_37_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_38 
       (.I0(\SR_sum[0]_i_47_n_0 ),
        .I1(\SR_sum[0]_i_48_n_0 ),
        .O(\SR_sum_reg[0]_i_38_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_39 
       (.I0(\SR_sum[0]_i_49_n_0 ),
        .I1(\SR_sum[0]_i_50_n_0 ),
        .O(\SR_sum_reg[0]_i_39_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_40 
       (.I0(\SR_sum[0]_i_51_n_0 ),
        .I1(\SR_sum[0]_i_52_n_0 ),
        .O(\SR_sum_reg[0]_i_40_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_41 
       (.I0(\SR_sum[0]_i_53_n_0 ),
        .I1(\SR_sum[0]_i_54_n_0 ),
        .O(\SR_sum_reg[0]_i_41_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_42 
       (.I0(\SR_sum[0]_i_55_n_0 ),
        .I1(\SR_sum[0]_i_56_n_0 ),
        .O(\SR_sum_reg[0]_i_42_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_43 
       (.I0(\SR_sum[0]_i_57_n_0 ),
        .I1(\SR_sum[0]_i_58_n_0 ),
        .O(\SR_sum_reg[0]_i_43_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  MUXF7 \SR_sum_reg[0]_i_44 
       (.I0(\SR_sum[0]_i_59_n_0 ),
        .I1(\SR_sum[0]_i_60_n_0 ),
        .O(\SR_sum_reg[0]_i_44_n_0 ),
        .S(SR_readAddress_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[10] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[8]_i_1_n_5 ),
        .Q(SR_sum_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[11] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[8]_i_1_n_4 ),
        .Q(SR_sum_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[12] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[12]_i_1_n_7 ),
        .Q(SR_sum_reg[12]));
  CARRY4 \SR_sum_reg[12]_i_1 
       (.CI(\SR_sum_reg[8]_i_1_n_0 ),
        .CO({\SR_sum_reg[12]_i_1_n_2 ,\SR_sum_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\SR_sum[12]_i_2_n_0 ,\SR_sum[12]_i_3_n_0 }),
        .O({\SR_sum_reg[12]_i_1_n_5 ,\SR_sum_reg[12]_i_1_n_6 ,\SR_sum_reg[12]_i_1_n_7 }),
        .S({\<const0> ,\SR_sum[12]_i_4_n_0 ,\SR_sum[12]_i_5_n_0 ,\SR_sum[12]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[13] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[12]_i_1_n_6 ),
        .Q(SR_sum_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[14] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[12]_i_1_n_5 ),
        .Q(SR_sum_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[1] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[0]_i_2_n_6 ),
        .Q(SR_sum_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[2] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[0]_i_2_n_5 ),
        .Q(SR_sum_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[3] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[0]_i_2_n_4 ),
        .Q(SR_sum_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[4] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[4]_i_1_n_7 ),
        .Q(SR_sum_reg[4]));
  CARRY4 \SR_sum_reg[4]_i_1 
       (.CI(\SR_sum_reg[0]_i_2_n_0 ),
        .CO({\SR_sum_reg[4]_i_1_n_0 ,\SR_sum_reg[4]_i_1_n_1 ,\SR_sum_reg[4]_i_1_n_2 ,\SR_sum_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum[4]_i_2_n_0 ,\SR_sum[4]_i_3_n_0 ,\SR_sum[4]_i_4_n_0 ,\SR_sum[4]_i_5_n_0 }),
        .O({\SR_sum_reg[4]_i_1_n_4 ,\SR_sum_reg[4]_i_1_n_5 ,\SR_sum_reg[4]_i_1_n_6 ,\SR_sum_reg[4]_i_1_n_7 }),
        .S({\SR_sum[4]_i_6_n_0 ,\SR_sum[4]_i_7_n_0 ,\SR_sum[4]_i_8_n_0 ,\SR_sum[4]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[5] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[4]_i_1_n_6 ),
        .Q(SR_sum_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[6] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[4]_i_1_n_5 ),
        .Q(SR_sum_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[7] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[4]_i_1_n_4 ),
        .Q(SR_sum_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[8] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[8]_i_1_n_7 ),
        .Q(SR_sum_reg[8]));
  CARRY4 \SR_sum_reg[8]_i_1 
       (.CI(\SR_sum_reg[4]_i_1_n_0 ),
        .CO({\SR_sum_reg[8]_i_1_n_0 ,\SR_sum_reg[8]_i_1_n_1 ,\SR_sum_reg[8]_i_1_n_2 ,\SR_sum_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\SR_sum[8]_i_2_n_0 ,\SR_sum[8]_i_3_n_0 ,\SR_sum[8]_i_4_n_0 ,\SR_sum[8]_i_5_n_0 }),
        .O({\SR_sum_reg[8]_i_1_n_4 ,\SR_sum_reg[8]_i_1_n_5 ,\SR_sum_reg[8]_i_1_n_6 ,\SR_sum_reg[8]_i_1_n_7 }),
        .S({\SR_sum[8]_i_6_n_0 ,\SR_sum[8]_i_7_n_0 ,\SR_sum[8]_i_8_n_0 ,\SR_sum[8]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \SR_sum_reg[9] 
       (.C(I_clock_IBUF_BUFG),
        .CE(\SR_sum[0]_i_1_n_0 ),
        .CLR(I_reset_IBUF),
        .D(\SR_sum_reg[8]_i_1_n_6 ),
        .Q(SR_sum_reg[9]));
  VCC VCC
       (.P(\<const1> ));
endmodule
