`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 17:21:39
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
        input logic clock,clock_2bit,reset,
        
        //Pruebas outputs
        //output logic [3:0] muxxx, 
        //output logic [1:0] twooo
        output logic bcd_out,
        output logic d1,d2,d3,d4
    );
    logic [15:0] sixteen_out;
    logic [3:0] mux_out;
    logic [1:0] two_out;
    contador16bits sixteen_instance(
        //Entradas
        .clk(clock),
        .reset(reset),
        //Salidas
        .count(sixteen_out)
    );
    
    mux mux_instance(
        //Entradas
        .input_data(sixteen_out),
        .sel(two_out),
        //Salidas
        .output_data(mux_out)
    );
    
    counter_2bits two_instance(
        //Entradas
        .clk(clock_2bit),
        .reset(reset),
        //Salidas
        .count(two_out)
    );
    decodificador_binario dec_instance(
        //Entradas
        .d(two_out),
        .q0(d1),
        .q1(d2),
        .q2(d3),
        .q3(d4)
    );
    bcd_to_7 bcd_instance(
        .BCD_in(mux_out),
        .sevenSeg(bcd_out)
    );
    always_comb begin
        //Viendo si funciona
        //muxxx=mux_out;
        //twooo=two_out;
    end
endmodule
