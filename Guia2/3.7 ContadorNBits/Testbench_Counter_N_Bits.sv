`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 15:24:22
// Design Name: 
// Module Name: Testbench_Counter_N_Bits
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


module Testbench_Counter_N_Bits;
  // Parámetros de simulación

    // Señales de control del testbench
    logic clk = 0;
    logic reset = 0;

    // Instancias de Counter_N_Bits con diferentes anchos
    Counter_N_Bits #(.WIDTH(4)) counter_4 (
        .clk(clk),
        .reset(reset),
        .count(count_4)
    );
    Counter_N_Bits #(.WIDTH(5)) counter_5 (
        .clk(clk),
        .reset(reset),
        .count(count_5)
    );
    Counter_N_Bits #(.WIDTH(8)) counter_8 (
        .clk(clk),
        .reset(reset),
        .count(count_8)
    );

    // Señales de salida de los contadores
    logic [3:0] count_4;
    logic [4:0] count_5;
    logic [7:0] count_8;

    // Generación del reloj
   always #5 clk = ~clk; // Generación de señal de reloj

    // Reset inicial
    initial begin
        reset = 1;
        #20; // Espera un tiempo
        reset = 0;
        // Espera un tiempo suficiente para la simulación
        #100;

        // Aserciones de salida
        $display("count_4 = %h, count_5 = %h, count_8 = %h", count_4, count_5, count_8);

        // Terminar la simulación
        #100;
        
        #100;
        $finish;
    end

endmodule