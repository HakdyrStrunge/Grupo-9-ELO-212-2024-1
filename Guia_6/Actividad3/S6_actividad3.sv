`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2024 03:12:08
// Design Name: 
// Module Name: S6_actividad3
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


module S6_actividad3(
    input  logic        CLK100MHZ,CPU_RESETN,
    input  logic        reset,BTNU,
    input  logic [15:0] SW, //numero de entrada cambiado a 16 bits
    output logic CA,CB,CC,CD,CE,CF,CG,DP,
    output logic [7:0]  AN,
    //output logic [6:0] Segments,
    output logic [15:0] LED
    );
    //assign LED = SW;
    logic Clk_hex;
    logic [6:0]result;
    logic [4:0]flags;
    
    logic [3:0] mux_out;
    logic count_out;
    clockdivider #(100e6,500) clk_dividido (
        .clk_in(CLK100MHZ),
        .reset(BTNU),
        //.fclkin_dado(fclkin_dadoo),
       //.fclkout_deseado(fclkout_deseadoo),
        .clk_out(Clk_hex)
    );
    
    ALU #(.M(7)) ALU_instance (
        .A(SW[15:9]),
        .B(SW[8:2]),
        .OpCode(SW[1:0]),
        
        .Result(result),
        .Flags(flags)
    );
    counter_3bits counter_instance(
        //Entradas
        .clk(Clk_hex),
        .reset(BTNU),
        //Salidas
        .count(count_out)
    );
    mux_a3 mux_instance(
        //Entradas
        .input_data(result),
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
    decodificador_a3 dec_instance(
        //Entradas
        .d(count_out),
        //Salidas
        .result(AN)
    );
    assign LED[4:0]=flags[4:0];
endmodule

