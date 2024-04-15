`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 09.04.2024 16:02:28
// Design Name: grupo9
//////////////////////////////////////////////////////////////////////////////////


module BCD_to_7seg (
    input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg
    );

always_comb begin
    case (BCD_in) //ESTO ESTA EN POLARIDAD POSITIVA, HAY QUE NEGAR LA SALIDA PARA FPGA CON POLARIDAD NEGATIVA
        4'd0: sevenSeg = 7'b1111110; // output is abcdefg
        4'd1: sevenSeg = 7'b0110000;
        4'd2: sevenSeg = 7'b1101101;
        4'd3: sevenSeg = 7'b1111001;
        4'd4: sevenSeg = 7'b0110011;
        4'd5: sevenSeg = 7'b1011011;
        4'd6: sevenSeg = 7'b1011111;
        4'd7: sevenSeg = 7'b1110000;
        4'd8: sevenSeg = 7'b1111111;
        4'd9: sevenSeg = 7'b1110011;
       
        default: sevenSeg = 7'bxxxxxxx; // Manejar caso por defecto si es necesario
    endcase
end

endmodule
