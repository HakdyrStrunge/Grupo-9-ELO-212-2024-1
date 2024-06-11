`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 15:12:46
// Design Name: 
// Module Name: S9_actividad1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S9_actividad1 (
    input logic clk,
    input logic reset,
    input logic Enter,
    input logic [15:0] DataIn,

    output logic [15:0] ToDisplay, // Valor de salida para el Display
    output logic [4:0] Flags, // {N, Z, C, V, P}
    output logic [2:0] Status // Indica de manera secuencial el estado en el que se encuentra
);
    logic Pulse;
    logic LoadOpA, LoadOpB;
    logic LoadOpCode, ToDisplaySel;
    logic updateRes;
    logic [4:0] Flags_ALU;
    logic [15:0] DataOut_A;
    logic [15:0] DataOut_B;
    logic [15:0] Result_ALU;
    logic [15:0] Result_ALU2;
    logic [1:0] OpCodeOut;
    
    level_to_pulse Level_to_Pulse(
        .clk(clk),
        .reset(reset),
        .L(Enter),
        .P(Pulse)
    );
    
    Reverse_Polish_FSM RPFSM(
        .clk(clk),
        .reset(reset),
        .EnterPulse(Pulse),
        .LoadOpA(LoadOpA),
        .LoadOpB(LoadOpB),
        .LoadOpCode(LoadOpCode),
        .ToDisplaySel(ToDisplaySel),
        .updateRes(updateRes),
        .Status(Status)
        );
        
    reset_over_load #(16) OpA_reg_cond (
        .clk(clk),
        .reset(reset),
        .D(DataIn),
        .load(LoadOpA),
        .Q(DataOut_A)
    );
    
    reset_over_load #(16) OpB_reg_cond ( 
        .D(DataIn),
        .clk(clk),
        .reset(reset),
        .load(LoadOpB),
        .Q(DataOut_B)
    );
    reset_over_load #(2) OpCode_reg_cond (
        .clk(clk),
        .reset(reset),
        .D(DataIn[1:0]),
        .load(LoadOpCode),
        .Q(OpCodeOut)
        );
    
    ALU #(16) ALU (
        .A(DataOut_A),
        .B(DataOut_B),
        .OpCode(OpCodeOut),
        .Flags(Flags_ALU),
        .Result(Result_ALU)
    );
    reset_over_load #(16) Result_reg_cond ( 
        .clk(clk),
        .reset(reset),
        .D(Result_ALU),
        .load(updateRes),
        .Q(Result_ALU2));
    
    reset_over_load #(5) Flags_red_cond (
        .clk(clk),
        .reset(reset),
        .D(Flags_ALU),
        .load(updateRes),
        .Q(Flags));
        
    Display_selector Display_selector (
        .datain(DataIn),
        .ToDisplaySel(ToDisplaySel),
        .result(Result_ALU2),
        .ToDisplay(ToDisplay)
   );
endmodule
