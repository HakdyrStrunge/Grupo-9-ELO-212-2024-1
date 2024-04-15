`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 21:49:15
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


module top_module(
        input wire clock,
        input wire reset,
        output reg [6:0] bcd_out,
        output reg fib_out,
        output reg ON_OFF
    );
    
wire [3:0] counter_output;
wire [6:0] bcd_exit;
wire fib_exit;


counter4bit counter_instance (
    .clk(clock),
    .reset(reset),
    .count(counter_output)
);
Fib_Rec fib_instance(
    .number(counter_output),
    .out(fib_exit)
);
BCD_to_7seg bcd_instance (
    .BCD_in(counter_output),
    .sevenSeg(bcd_exit)
);
always_comb begin
    if (ON_OFF) begin
        bcd_out = bcd_exit;
        fib_out=fib_exit; 
    end else begin
        bcd_out = 7'bxxxxxxx;
        fib_out = 1'bx;  
    end
end


//    assign bcd_out = bcd_exit;
//    assign fib_out=fib_exit;

endmodule
