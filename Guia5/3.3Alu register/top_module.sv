`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 14:50:53
// Design Name: 
// Module Name: top_module
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


module top_module #(parameter M = 16)(
    input logic [M-1:0] data_in,
    input logic load_A,
    input logic load_B,
    input logic load_Op,
    input logic updateRes,
    input logic Clk,
    input logic Clk_hex, //Clock que se utiliza para la parte del hex to bcd
    input logic reset,
    output logic [4:0] LEDs,
    output logic [6:0] Segments,
    output logic [7:0] Anodes
    );
    logic [M-1:0] A_out;
    logic [M-1:0] B_out;
    logic [1:0] OP_out;
    logic [M-1:0] ALU_Result;
    logic [4:0] ALU_Flags;
    logic [M-1:0] Hex_in;

        // Puertos internos
    logic [1:0] two_op;  // Almacena los 2 bits menos significativos de data_in
    
    // Extrae los 2 bits menos significativos de data_in y los asigna a two_least_significant_bits
    assign two_op = data_in[1:0];
    
    reset_over_load #(M) rol_A(
        .D(data_in),
        .Clk(Clk),
        .reset(reset),
        .load(load_A),
        .Q(A_out)
    );   
    reset_over_load #(M) rol_B(
        .D(data_in),
        .Clk(Clk),
        .reset(reset),
        .load(load_B),
        .Q(B_out)
    );     
    reset_over_load #(2) rol_OP(
        .D(two_op),
        .Clk(Clk),
        .reset(reset),
        .load(load_Op),
        .Q(OP_out)
    );    
    ALU ALU_instance(
        .A(A_out),
        .B(B_out),
        .OpCode(OP_out),
        .Result(ALU_Result),
        .Flags(ALU_Flags)
    );
    reset_over_load #(M) rol_result(
        .D(ALU_Result),
        .Clk(Clk),
        .reset(reset),
        .load(updateRes),
        .Q(Hex_in)
    );  
    reset_over_load #(5) rol_flags(
        .D(ALU_Flags),
        .Clk(Clk),
        .reset(reset),
        .load(updateRes),
        //Salidas
        .Q(LEDs)
    );  
    
    S4_actividad1 hex_to_7seg(
        .clock(Clk_hex),
        .reset(reset),
        .HEX_in(Hex_in),
        
        //Salidas
        .segments(Segments),
        .anodes(Anodes)
    );
endmodule
