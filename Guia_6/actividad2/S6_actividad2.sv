`timescale 1ns / 1ps
////////////////x//////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: Aguilera, Fernandez, Vega
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad2
// Project Name: Actividad 2
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: Este modulo cumple la funcion de sumar o restar (dependiendo del valor de dec)
// 1 bit a un contador de N bits
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Para simular este modulo es necesario definir el valor de reset en 0 al inicio de la simulacion, de lo contrario el contador empieza indefinido
// 
//////////////////////////////////////////////////////////////////////////////////

module S6_actividad2 #(parameter N = 4)(
    input  logic        CLK100MHZ,
    input  logic        reset,
    input logic BTNC,BTNU,
    input  logic [15:0] SW, //numero de entrada cambiado a 16 bits
    //input  logic            clock, reset,
    output logic CA,CB,CC,CD,CE,CF,CG,DP,
    output logic [7:0]  AN,
    //output logic [6:0] Segments,
    output logic [15:0] LED
    //input  logic            dec, enable, load,
    //input  logic [N-1:0]    load_ref_value,
    //output logic [N-1:0]    counterN,
    //output logic            threshold
    );
    logic            dec, enable, load;
    logic [N-1:0]    load_ref_value;
    logic [N-1:0]    counterN;
    logic            threshold;
    logic [N-1:0] counter_next,counter_before;
    logic thresholdS;
    clockdivider #(100e6,1) clk_divide (
        .clk_in(CLK100MHZ),
        .reset(BTNC),
        //.fclkin_dado(fclkin_dadoo),
       //.fclkout_deseado(fclkout_deseadoo),
        .clk_out(Clk_hex)
    );
    bcd_to_7 bcd_instance(
        //Entradas
        .BCD_in(counterN),
        //Salidas
        .sevenSeg({CA,CB,CC,CD,CE,CF,CG})
    );
    always_comb begin
        counter_next = counterN + 1'b1;
        counter_before = counterN - 1'b1;
    end
    always_ff @(posedge Clk_hex) begin
        if (BTNC || BTNU)begin
           counterN <= 'h7;

        end
        else if (dec && enable)begin
            counterN <=  counter_before;
        end
        else if (!dec && enable)begin
            counterN <= counter_next;

        end
        if (load && !enable && !BTNC)begin
            counterN <= load_ref_value;
        end

   end
   always_comb begin
    threshold = (counterN > load_ref_value);
    LED = SW;
    if(threshold) begin
        LED[7]=1'b1;
        end else begin
        LED[7]=1'b0;
        end
   end
   assign dec = SW[0];
   assign enable = SW[1];
   assign load = SW[2];
   assign load_ref_value=SW [15:12];
   //assign reset=BTNC;
   assign AN= 8'b1111_1110;
endmodule
