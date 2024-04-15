`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2024 15:45:13
// Design Name: 
// Module Name: test_counter
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


module test_counter();

    logic clk, reset;
    logic [3:0] count;

    counter4bit DUT (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    always #5 clk = ~clk; // Generación de señal de reloj

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
        
        #20 reset = 1;
        
        #20 reset = 0;
        
        #20 reset = 1;
        
        #20 reset = 0;
        
        #20 reset = 1;
        
        #20 reset = 0;
        
        #20 reset = 1;
        
        #20 reset = 0;
        #40 reset = 1;
        
        #20 reset = 0;
        
    end

endmodule

