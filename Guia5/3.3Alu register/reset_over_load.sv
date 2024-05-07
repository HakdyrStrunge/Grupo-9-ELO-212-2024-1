`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2024 18:34:34
// Design Name: 
// Module Name: reset_over_load
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


module reset_over_load #(parameter M = 16)(
    input logic [M-1:0] D,
    input logic Clk,
    input logic reset,
    input logic load,
    output logic [M-1:0] Q
);
    always_ff @(posedge Clk) begin
        if (reset) begin
            //Q <= 4'b0;
            Q <= 4'b0;
        end else if (load) begin
            Q <= D;
        end
    end
endmodule