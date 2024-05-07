`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 15:36:41
// Design Name: 
// Module Name: counter_3bits
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



module counter_3bits(
    input logic clk,reset,     // Entrada de reloj
    output logic [2:0] count  // Salida del contador de 2 bits
);

    // Registros para almacenar el valor del contador
    logic [2:0] counter_reg;

    // Incremento del contador en cada flanco de subida del reloj
    always_ff @(posedge clk) begin
        if(reset)
            counter_reg <= 'd0;
        else
            counter_reg <= counter_reg + 1;
    end

    // Salida del contador
    assign count = counter_reg;

endmodule
