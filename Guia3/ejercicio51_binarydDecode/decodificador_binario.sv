`timescale 1ns / 1ps


module decodificador_binario(
    input logic [1:0] d ,
    output logic q0,
    output logic q1,
    output logic q2,
    output logic q3
    );
    
    always_comb begin
        assign q0 = (d == 2'b00) ? 1'b1 : 1'b0; // si es vdd y 0 si es falso
        assign q1 = (d == 2'b01) ? 1'b1 : 1'b0;
        assign q2 = (d == 2'b10) ? 1'b1 : 1'b0;
        assign q3 = (d == 2'b11) ? 1'b1 : 1'b0;  
    end
endmodule
