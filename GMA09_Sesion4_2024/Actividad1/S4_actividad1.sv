`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: Joaquin Aguilera, Marcelo Fernandez, Felipe Vega
// 
// Create Date: 19/04/2024
// Design Name: Guia 4
// Module Name: S4_actividad1
// Project Name: Actividad 1
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad1(
    input  logic        clock,
    input  logic        reset,
    input  logic [31:0] HEX_in,
    output logic [6:0]  segments,
    output logic [7:0]  anodes
);

    logic [3:0] mux_out, counter;
    
    counter_3bits count_3bits(
        .clk(clock),
        .reset(reset),
        .count(counter)
    );
    
    mux mux1(
        .input_data(HEX_in),
        .sel(counter),
        .output_data(mux_out)
    );
    
    bcd_to_7 bcd_out(
        .BCD_in(mux_out),
        .sevenSeg(segments)
    ); 
    
    decodificador_binario dec_bi(
        .d(counter),
        .result(anodes)
    );

endmodule
