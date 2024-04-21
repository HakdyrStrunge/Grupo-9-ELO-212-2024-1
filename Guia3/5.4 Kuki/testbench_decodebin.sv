`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
//////////////////////////////////////////////////////////////////////////////////


module testbench_decodebin();
    logic [1:0] d;
    logic q0,q1,q2,q3;
    
    decodificador_binario DUT (
    .d(d),
    .q0(q0),
    .q1(q1),
    .q2(q2),
    .q3(q3)
    );
    initial begin 
        d = 2'b00;
        #5
        d=2'b01;
        #5
        d=2'b10;
        #5
        d=2'b10;
        #5
        d=2'b11;
        #5
        d=2'b00;
     end
endmodule
