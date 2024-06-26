//S4_actividad2
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: 
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad2
// Project Name: 
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


module S4_actividad2 #(parameter N = 32)(
    input  logic            clock, reset,
    input  logic            dec, enable, load,
    input  logic [N-1:0]    load_ref_value,
    output logic [N-1:0]    counterN,
    output logic            threshold
    );
    
    always_ff @(posedge clock) begin
        if (reset)
           counterN <= 'd0;
        else if (dec && enable)
            counterN <= counterN - 1;
        else if (!dec && enable)
            counterN <= counterN + 1;
             
        if (load && !enable)
            counterN <= load_ref_value;
        
        if (counterN > load_ref_value)
            threshold = 1'b1;
        else
            threshold = 1'b0;
            
    end
   
    
endmodule