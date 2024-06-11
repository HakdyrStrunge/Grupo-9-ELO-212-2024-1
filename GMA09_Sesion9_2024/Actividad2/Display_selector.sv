`timescale 1ns / 1ps

module Display_selector(
    input logic [15:0] result, datain,
    input logic ToDisplaySel,
    output logic [15:0] ToDisplay
 );
    always_comb begin
        case(ToDisplaySel)
            1'b0: ToDisplay = datain;
            1'b1: ToDisplay = result;
        endcase
    end    
endmodule

