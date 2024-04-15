`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 21:37:58
// Design Name: 
// Module Name: Fib_Rec
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


module Fib_Rec(
    input logic [3:0] number,
    output reg  out
    );
    reg comp1,comp2,comp3;
    always_comb begin
        
        comp1 = ~number[0] & ~number[2];
        comp2 = ~number[1] & ~number[2];
        comp3 = ~number[1] & ~number[3];
        out = comp1 | comp2 | comp3;
    end
endmodule