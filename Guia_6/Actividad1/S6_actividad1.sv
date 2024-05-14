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
// Description: Este modulo describe un controlador que despliega 8 displays
// a partir de una entrada de 32 bits, el cual cada display mostrara un grupo de 4 bits
// Segun lo indicado en la entrada, desde el grupo de 4 bits menos significativos
// Hasta los mas significativos
// 
// Dependencies: counter_3bits.sv, mux.sv, bcd_to_7.sv, decodificador_binario.sv
// 
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Implementacion modulos
// 
//////////////////////////////////////////////////////////////////////////////////
module S6_actividad1(
    input  logic        CLK100MHZ,CPU_RESETN,
    input  logic        reset,BTNU,
    input  logic [15:0] SW, //numero de entrada cambiado a 16 bits
    output logic CA,CB,CC,CD,CE,CF,CG,DP,
    output logic [7:0]  AN,
    //output logic [6:0] Segments,
    output logic [15:0] LED
    );
    logic [3:0] mux_out;
    logic [1:0] count_out;
    logic [15:0] num;
    logic [7:0] hhh;
    assign LED = SW;
    logic Clk_hex;
    clockdivider #(100e6,5000) clk_dividido (
        .clk_in(CLK100MHZ),
        .reset(BTNU),
        //.fclkin_dado(fclkin_dadoo),
       //.fclkout_deseado(fclkout_deseadoo),
        .clk_out(Clk_hex)
    );
    
    counter_2bits counter_instance(
        //Entradas
        .clk(Clk_hex),
        .reset(BTNU),
        //Salidas
        .count(count_out)
    );
    mux mux_instance(
        //Entradas
        .input_data(SW),
        .sel(count_out),
        //Salidas
        .output_data(mux_out)
    );
    bcd_to_7 bcd_instance(
        //Entradas
        .BCD_in(mux_out),
        //Salidas
        .sevenSeg({CA,CB,CC,CD,CE,CF,CG})
    );
    decodificador_binario dec_instance(
        //Entradas
        .d(count_out),
        //Salidas
        .result(hhh)
    );
    assign AN=hhh;
    assign num = SW[15:0];
        
    //ssign reset = SW[15];
    assign DP = ~(&SW);
endmodule
