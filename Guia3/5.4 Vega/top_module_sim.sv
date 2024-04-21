`timescale 1ns / 1ps


module top_module_sim;
     logic clk,clk_2bit,reset;
     logic display1,display2,display3,display4;
     logic bcd_out;
     //Pruebas
     //logic [3:0] muxxx_out;
     //logic [1:0] twooo_out;
     top_module DUT(
        .clock(clk),
        .clock_2bit(clk_2bit),
        .reset(reset),
        .d1(display1),
        .d2(display2),
        .d3(display3),
        .d4(display4),
        .bcd_out(bcd_out)
        //.muxxx(muxxx_out),
        //.twooo(twooo_out)
     );
    //always #5 clk = ~clk; // Generación de señal de reloj
    //always #5 clk_2bit = ~clk_2bit; //HAY QUE CAMBIAR ESTE VALOR SEGUN LO QUE PIDE EN LA GUIA!!!!!
    always #5 clk_2bit = (clk_2bit == 20) ? 1'b0 : clk_2bit + 1; 
    initial begin
        clk=0;
        clk_2bit=0;
        
        reset = 1;
        #5 clk=1;
        #5 clk=0;
        //#10 reset = 0;
        reset = 0;
        for (int i = 0; i < 50; i++) begin
            //$display("Iteración %0d", i);
            #35 clk=1;
            #5 clk=0;
            
        end
    end
endmodule
