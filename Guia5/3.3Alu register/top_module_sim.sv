`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 22:37:57
// Design Name: 
// Module Name: top_module_sim
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

module top_module_sim;
    logic [15:0] data_in;
    logic load_A, load_B, load_Op, updateRes;
    logic Clkk = 1'b0; // Inicializa Clk
    logic Clkk_hex = 1'b0; // Inicializa Clk_hex
    logic reset = 1'b1; // Inicializa reset
    logic [4:0] LEDs;
    logic [6:0] Segments;
    logic [7:0] Anodes;
    
    top_module #(.M(16)) Register_ALU(
        .data_in(data_in),
        .load_A(load_A),
        .load_B(load_B),
        .load_Op(load_Op),
        .updateRes(updateRes),
        .Clk(Clkk),
        .Clk_hex(Clkk_hex),
        .reset(reset),
        .LEDs(LEDs),
        .Segments(Segments),
        .Anodes(Anodes)
    );
    
    // Genera Clk y Clk_hex
    always #5 Clkk = ~Clkk;
    always #40 Clkk_hex = ~Clkk_hex;
    
    initial begin
        reset = 1'b0;
        #5;
        reset = 1'b1; // Activa reset nuevamente para simular un flanco positivo de reset
        #45;
        reset = 1'b0;
        
        // Simula operaciones de carga
        data_in = 16'd4;
        load_A = 1'b1;
        #10;
        load_A = 1'b0;
        #5;
        
        data_in = 16'd17;
        load_B = 1'b1;
        load_Op = 1'b1;
        #10;
        load_B = 1'b0;
        load_Op = 1'b0;
        
        #40;
        updateRes='b1;
        #10;
        //updateRes='b0;
    end
endmodule
