`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 21:43:22
// Design Name: 
// Module Name: S4_actividad2_Testbench
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


module S4_actividad2_Testbench;
    logic            clock=0, reset=0;
    logic            dec, enable, load;
    logic threshold;
    //logic [N-1:0]    load_ref_value;
    //logic [N-1:0]    counterN;
    logic [3:0] load_ref_value_4;
    logic [3:0] counter4;
    S4_actividad2 #(.N(4)) count_4(
        .clock(clock),
        .reset(reset),
        .dec(dec),
        .enable(enable),
        .load(load),
        .threshold(threshold),
        .load_ref_value(load_ref_value_4),
        .counterN(counter4)
        
    );
    always #5 clock = ~clock; // Generación de señal de reloj
    initial begin
        clock = 0;
        reset = 1;
        dec = 0;
        enable = 0;
        load = 0;
        load_ref_value_4 = 0;
        #10;
        
        // Desactivar el reset
        reset = 0;
                // Probar el contador en modo incremental
                
        enable = 1;
        #10;
        enable = 0;
        #10;
        load=1;
        load_ref_value_4= 4'd7;
        #5
        load=0;
        
        #5
        
        enable = 1;
        #10;
        enable = 0;
        
        #10
        dec=1;
        enable = 1;
        #10;
        enable = 0;
        
        #10;
    end
endmodule
