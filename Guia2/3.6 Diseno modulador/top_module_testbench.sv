`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2024 18:58:54
// Design Name: 
// Module Name: top_module_testbench
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


module top_module_testbench();

    logic clk, reset;
    //logic [3:0] count;
    logic [6:0] bcd_out;
    logic fib_out;
    logic ON_OFF;
    top_module DUT(
        .clock(clk),
        .reset(reset),
        //.count(count),
        .bcd_out(bcd_out),
        .fib_out(fib_out),
        .ON_OFF(ON_OFF)
    );
    
      // Señales de salida del módulo bajo prueba

    always #5 clk = ~clk; // Generación de señal de reloj

    initial begin
        ON_OFF=1;
        clk = 0;
        reset = 1;
        #20 reset = 0;
        
        //#20 reset = 1;
        
        //#20 reset = 0;
        
        //#20 reset = 1;
        
        //#20 reset = 0;
        
        //#20 reset = 1;
        
       // #20 reset = 0;
        
        //#20 reset = 1;
        
        //#20 reset = 0;
        //#40 reset = 1;
        
        #160 reset = 1;
        #20 ON_OFF=0;
        
    end

endmodule

