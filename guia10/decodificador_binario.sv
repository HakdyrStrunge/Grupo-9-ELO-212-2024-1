`timescale 1ns / 1ps


module decodificador_binario(
    input logic [2:0] d ,
    //output logic q0,
    //output logic q1,
    //output logic q2,
    //output logic q3,
    output logic [7:0] result
    );
    logic [7:0] res;
    always_comb begin
        case(d)
            3'b000 : res =8'b1111_1110;     
            3'b001 : res =8'b1111_1101;
            3'b010 : res =8'b1111_1011;
            3'b011: res =8'b1111_0111;
            3'b100 : res =8'b1110_1110;
            3'b101 : res =8'b1101_1101;
            3'b110 : res =8'b1011_1011;
            3'b111: res =8'b0111_0111;
            //default :result= 8'b1111_1111;
            default :res= 8'b1111_1110;

         endcase
    end
    assign result=res;
endmodule