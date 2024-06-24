`timescale 1ns / 1ps

module Display_selector(
    input logic [15:0] result, datain,
    input logic ToDisplaySel,
    output logic [31:0] ToDisplay
 );
    always_comb begin
        case(ToDisplaySel)
            1'b0: ToDisplay = {16'b0, datain}; // Concatenación de 16 ceros a la izquierda de datain
            1'b1: ToDisplay = {16'b0, result}; // Concatenación de 16 ceros a la izquierda de result
        endcase
    end    
endmodule
