`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 15:39:18
// Design Name: 
// Module Name: decodificador_binario
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


module decodificador_binario(
    input logic [2:0] d ,
    output logic [7:0] result
    );
    logic AN7;
    logic AN6;
    logic AN5;
    logic AN4;
    logic AN3;
    logic AN2;
    logic AN1;
    logic AN0;
    always_comb begin
         AN7 = (d == 3'b000) ? 1'b0 : 1'b1; // 1 si es vdd y 0 si es falso
         AN6 = (d == 3'b001) ? 1'b0 : 1'b1;
         AN5 = (d == 3'b010) ? 1'b0 : 1'b1;
         AN4 = (d == 3'b011) ? 1'b0 : 1'b1;  
         AN3 = (d == 3'b100) ? 1'b0 : 1'b1;
         AN2 = (d == 3'b101) ? 1'b0 : 1'b1;
         AN1 = (d == 3'b110) ? 1'b0 : 1'b1;
         AN0 = (d == 3'b111) ? 1'b0 : 1'b1;
    end
    always_comb begin
        result = {AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0};
    end
endmodule