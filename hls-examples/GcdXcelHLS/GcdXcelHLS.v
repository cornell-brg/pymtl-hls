// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.1
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="GcdXcelHLS,hls_ip_2014_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.888000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}" *)

/* verilator lint_off WIDTH */
module GcdXcelHLS (
        ap_clk,
        ap_rst,
        xcelIn_V,
        xcelIn_V_ap_vld,
        xcelIn_V_ap_ack,
        xcelOut_V,
        xcelOut_V_ap_vld,
        xcelOut_V_ap_ack
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 1'b0;
parameter    ap_ST_st2_fsm_1 = 1'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv5_2 = 5'b10;
parameter    ap_const_lv5_1 = 5'b1;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_30 = 32'b110000;
parameter    ap_const_lv32_38 = 32'b111000;
parameter    ap_const_lv32_B = 32'b1011;
parameter    ap_const_lv32_2A = 32'b101010;
parameter    ap_const_lv32_2B = 32'b101011;
parameter    ap_const_lv32_2F = 32'b101111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input  [56:0] xcelIn_V;
input   xcelIn_V_ap_vld;
output   xcelIn_V_ap_ack;
output  [51:0] xcelOut_V;
output   xcelOut_V_ap_vld;
input   xcelOut_V_ap_ack;

reg xcelIn_V_ap_ack;
reg[51:0] xcelOut_V;
reg xcelOut_V_ap_vld;
reg   [0:0] gcdState = 1'b0;
reg   [31:0] opA_V = 32'b00000000000000000000000000000000;
reg   [31:0] opB_V = 32'b00000000000000000000000000000000;
reg   [0:0] gcdState_load_reg_299;
reg   [0:0] ap_CS_fsm = 1'b0;
wire   [0:0] grp_nbreadreq_fu_68_p3;
reg    ap_sig_bdd_31;
wire   [4:0] this_assign_load_2_new_fu_163_p4;
reg    ap_sig_ioackin_xcelOut_V_ap_ack;
wire   [31:0] opA_V_buf_1_i_fu_265_p3;
wire   [0:0] tmp_i_fu_241_p2;
reg    ap_sig_bdd_69;
wire   [31:0] opB_V_buf_1_i_fu_273_p3;
reg   [31:0] tmp_data_V_reg_106;
reg   [31:0] opB_V_buf_i_reg_115;
wire   [51:0] tmp_3_fu_179_p4;
wire   [51:0] tmp_241_fu_199_p4;
wire   [51:0] tmp_131_fu_213_p4;
wire   [51:0] tmp_5_fu_285_p4;
reg    ap_reg_ioackin_xcelOut_V_ap_ack = 1'b0;
wire   [8:0] grp_fu_129_p4;
wire   [10:0] tmp_id_V_fu_149_p1;
wire   [0:0] tmp_1_i_fu_247_p2;
wire   [31:0] tmp_2_i_fu_253_p2;
wire   [31:0] tmp_3_i_fu_259_p2;
wire   [10:0] tmp_id_V_1_fu_281_p1;
reg   [0:0] ap_NS_fsm;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ioackin_xcelOut_V_ap_ack assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_xcelOut_V_ap_ack
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_xcelOut_V_ap_ack <= ap_const_logic_0;
    end else begin
        if ((((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2)))))) begin
            ap_reg_ioackin_xcelOut_V_ap_ack <= ap_const_logic_0;
        end else if ((((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_1 == xcelOut_V_ap_ack) & ~ap_sig_bdd_31) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & (ap_const_logic_1 == xcelOut_V_ap_ack) & ~ap_sig_bdd_31) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0) & (ap_const_logic_1 == xcelOut_V_ap_ack) & ~ap_sig_bdd_31) | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & (ap_const_logic_1 == xcelOut_V_ap_ack) & ~ap_sig_bdd_69))) begin
            ap_reg_ioackin_xcelOut_V_ap_ack <= ap_const_logic_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        gcdState <= ap_const_lv1_1;
    end else if ((((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2)))))) begin
        gcdState <= ap_const_lv1_0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & (ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2))))) begin
        opB_V_buf_i_reg_115 <= opB_V_buf_1_i_fu_273_p3;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))) & ~(ap_const_lv1_0 == gcdState))) begin
        opB_V_buf_i_reg_115 <= opB_V;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & (ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2))))) begin
        tmp_data_V_reg_106 <= opA_V_buf_1_i_fu_265_p3;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))) & ~(ap_const_lv1_0 == gcdState))) begin
        tmp_data_V_reg_106 <= opA_V;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        gcdState_load_reg_299 <= gcdState;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        opA_V <= {{xcelIn_V[ap_const_lv32_2A : ap_const_lv32_B]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        opB_V <= {{xcelIn_V[ap_const_lv32_2A : ap_const_lv32_B]}};
    end
end

/// ap_sig_ioackin_xcelOut_V_ap_ack assign process. ///
always @ (xcelOut_V_ap_ack or ap_reg_ioackin_xcelOut_V_ap_ack)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_xcelOut_V_ap_ack)) begin
        ap_sig_ioackin_xcelOut_V_ap_ack = xcelOut_V_ap_ack;
    end else begin
        ap_sig_ioackin_xcelOut_V_ap_ack = ap_const_logic_1;
    end
end

/// xcelIn_V_ap_ack assign process. ///
always @ (gcdState or gcdState_load_reg_299 or ap_CS_fsm or grp_nbreadreq_fu_68_p3 or ap_sig_bdd_31 or this_assign_load_2_new_fu_163_p4 or ap_sig_ioackin_xcelOut_V_ap_ack or tmp_i_fu_241_p2 or ap_sig_bdd_69)
begin
    if (((~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2)))) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))))) begin
        xcelIn_V_ap_ack = ap_const_logic_1;
    end else begin
        xcelIn_V_ap_ack = ap_const_logic_0;
    end
end

/// xcelOut_V assign process. ///
always @ (gcdState or gcdState_load_reg_299 or ap_CS_fsm or grp_nbreadreq_fu_68_p3 or ap_sig_bdd_31 or this_assign_load_2_new_fu_163_p4 or ap_sig_ioackin_xcelOut_V_ap_ack or tmp_i_fu_241_p2 or ap_sig_bdd_69 or tmp_3_fu_179_p4 or tmp_241_fu_199_p4 or tmp_131_fu_213_p4 or tmp_5_fu_285_p4)
begin
    if ((~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2))))) begin
        xcelOut_V = tmp_5_fu_285_p4;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        xcelOut_V = tmp_131_fu_213_p4;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        xcelOut_V = tmp_241_fu_199_p4;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & ~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0))))) begin
        xcelOut_V = tmp_3_fu_179_p4;
    end else begin
        xcelOut_V = 'bx;
    end
end

/// xcelOut_V_ap_vld assign process. ///
always @ (gcdState or gcdState_load_reg_299 or ap_CS_fsm or grp_nbreadreq_fu_68_p3 or ap_sig_bdd_31 or this_assign_load_2_new_fu_163_p4 or tmp_i_fu_241_p2 or ap_sig_bdd_69 or ap_reg_ioackin_xcelOut_V_ap_ack)
begin
    if ((((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & ~ap_sig_bdd_31 & (ap_const_logic_0 == ap_reg_ioackin_xcelOut_V_ap_ack)) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1) & ~ap_sig_bdd_31 & (ap_const_logic_0 == ap_reg_ioackin_xcelOut_V_ap_ack)) | ((ap_ST_st1_fsm_0 == ap_CS_fsm) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0) & ~ap_sig_bdd_31 & (ap_const_logic_0 == ap_reg_ioackin_xcelOut_V_ap_ack)) | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2) & (ap_const_logic_0 == ap_reg_ioackin_xcelOut_V_ap_ack) & ~ap_sig_bdd_69))) begin
        xcelOut_V_ap_vld = ap_const_logic_1;
    end else begin
        xcelOut_V_ap_vld = ap_const_logic_0;
    end
end
always @ (gcdState or gcdState_load_reg_299 or ap_CS_fsm or grp_nbreadreq_fu_68_p3 or ap_sig_bdd_31 or this_assign_load_2_new_fu_163_p4 or ap_sig_ioackin_xcelOut_V_ap_ack or tmp_i_fu_241_p2 or ap_sig_bdd_69)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 :
            if (~(ap_sig_bdd_31 | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_2) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_1)) | ((ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & (this_assign_load_2_new_fu_163_p4 == ap_const_lv5_0)))) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        ap_ST_st2_fsm_1 :
            if ((~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2))) & ((ap_const_lv1_0 == gcdState_load_reg_299) | ~(ap_const_lv1_0 == tmp_i_fu_241_p2)))) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else if ((~(ap_const_lv1_0 == gcdState_load_reg_299) & (ap_const_lv1_0 == tmp_i_fu_241_p2) & ~(ap_sig_bdd_69 | (~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & (ap_const_logic_0 == ap_sig_ioackin_xcelOut_V_ap_ack) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2))))) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        default :
            ap_NS_fsm = 'bx;
    endcase
end

/// ap_sig_bdd_31 assign process. ///
always @ (xcelIn_V_ap_vld or gcdState or grp_nbreadreq_fu_68_p3)
begin
    ap_sig_bdd_31 = ((xcelIn_V_ap_vld == ap_const_logic_0) & (ap_const_lv1_0 == gcdState) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3));
end

/// ap_sig_bdd_69 assign process. ///
always @ (xcelIn_V_ap_vld or gcdState_load_reg_299 or grp_nbreadreq_fu_68_p3 or tmp_i_fu_241_p2)
begin
    ap_sig_bdd_69 = ((xcelIn_V_ap_vld == ap_const_logic_0) & ~(ap_const_lv1_0 == grp_nbreadreq_fu_68_p3) & ~(ap_const_lv1_0 == gcdState_load_reg_299) & ~(ap_const_lv1_0 == tmp_i_fu_241_p2));
end
assign grp_fu_129_p4 = {{xcelIn_V[ap_const_lv32_38 : ap_const_lv32_30]}};
assign grp_nbreadreq_fu_68_p3 = xcelIn_V_ap_vld;
assign opA_V_buf_1_i_fu_265_p3 = ((tmp_1_i_fu_247_p2)? tmp_2_i_fu_253_p2: tmp_data_V_reg_106);
assign opB_V_buf_1_i_fu_273_p3 = ((tmp_1_i_fu_247_p2)? opB_V_buf_i_reg_115: tmp_3_i_fu_259_p2);
assign this_assign_load_2_new_fu_163_p4 = {{xcelIn_V[ap_const_lv32_2F : ap_const_lv32_2B]}};
assign tmp_131_fu_213_p4 = {{{grp_fu_129_p4}, {ap_const_lv32_0}}, {tmp_id_V_fu_149_p1}};
assign tmp_1_i_fu_247_p2 = (tmp_data_V_reg_106 > opB_V_buf_i_reg_115? 1'b1: 1'b0);
assign tmp_241_fu_199_p4 = {{{grp_fu_129_p4}, {ap_const_lv32_0}}, {tmp_id_V_fu_149_p1}};
assign tmp_2_i_fu_253_p2 = (tmp_data_V_reg_106 - opB_V_buf_i_reg_115);
assign tmp_3_fu_179_p4 = {{{grp_fu_129_p4}, {ap_const_lv32_0}}, {tmp_id_V_fu_149_p1}};
assign tmp_3_i_fu_259_p2 = (opB_V_buf_i_reg_115 - tmp_data_V_reg_106);
assign tmp_5_fu_285_p4 = {{{grp_fu_129_p4}, {tmp_data_V_reg_106}}, {tmp_id_V_1_fu_281_p1}};
assign tmp_i_fu_241_p2 = (tmp_data_V_reg_106 == opB_V_buf_i_reg_115? 1'b1: 1'b0);
assign tmp_id_V_1_fu_281_p1 = xcelIn_V[10:0];
assign tmp_id_V_fu_149_p1 = xcelIn_V[10:0];


endmodule //GcdXcelHLS
