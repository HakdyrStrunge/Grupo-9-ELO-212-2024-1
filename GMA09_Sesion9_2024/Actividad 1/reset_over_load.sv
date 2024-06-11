`timescale 1ns / 1ps

module reset_over_load #(parameter M = 16)(
    input logic [M-1:0] D,
    input logic clk,
    input logic reset,
    input logic load,
    output logic [M-1:0] Q
);
    always_ff @(posedge clk) begin
        if (reset) begin
            //Q <= 4'b0;
            Q <= 4'b0;
        end else if (load) begin
            Q <= D;
        end
    end
endmodule
