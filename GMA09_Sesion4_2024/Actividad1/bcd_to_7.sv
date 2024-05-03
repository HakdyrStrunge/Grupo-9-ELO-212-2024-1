`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 15:33:48
// Design Name: 
// Module Name: bcd_to_7
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



module bcd_to_7 (
    input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg);

always_comb begin
    case (BCD_in) //ESTO ESTA EN POLARIDAD POSITIVA, HAY QUE NEGAR LA SALIDA PARA FPGA CON POLARIDAD NEGATIVA
        4'd0: sevenSeg = 7'b0000001; // output is abcdefg
        4'd1: sevenSeg = 7'b1001111;
        4'd2: sevenSeg = 7'b0010010;
        4'd3: sevenSeg = 7'b0000110;
        4'd4: sevenSeg = 7'b1001100;
        4'd5: sevenSeg = 7'b0100100;
        4'd6: sevenSeg = 7'b0100000;
        4'd7: sevenSeg = 7'b0001111;
        4'd8: sevenSeg = 7'b0000000;
        4'd9: sevenSeg = 7'b0000100;
        4'd10: sevenSeg = 7'b0001000;
        4'd11: sevenSeg = 7'b1100000;
        4'd12: sevenSeg = 7'b0110001;
        4'd13: sevenSeg = 7'b1000010;
        4'd14: sevenSeg = 7'b0110000;
        4'd15: sevenSeg = 7'b0111000;
        default: sevenSeg = 7'bxxxxxxx; // en caso de valor no esperado
    endcase
end

endmodule
