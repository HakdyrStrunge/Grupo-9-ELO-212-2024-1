`timescale 1ns / 1ps


module decodificador_a3(
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
           // 2'b00 : result =8'b1111_1110;
            
           // 2'b01 : result =8'b1111_1101;
            //2'b10 : result =8'b1111_1011;
            //2'b11: result =8'b1111_0111;
            3'b000 : res =8'b1111_1110;
            3'b001 : res =8'b1111_1101;
            3'b010 : res =8'b1111_1011;
            3'b011 : res =8'b1111_0111;
            
            3'b100 : res =8'b1110_1111;
            3'b101 : res =8'b1101_1111;
            3'b110 : res =8'b1011_1111;
            3'b111 : res =8'b0111_1111;
            //default :result= 8'b1111_1111;
            default :res= 8'b1111_1110;
         //q0 = (d == 2'b00) ? 1'b1 : 1'b0; // si es vdd y 0 si es falso
         //q1 = (d == 2'b01) ? 1'b1 : 1'b0;
         //q2 = (d == 2'b10) ? 1'b1 : 1'b0;
         //q3 = (d == 2'b11) ? 1'b1 : 1'b0;  
         endcase
    end
    assign result=res;
endmodule