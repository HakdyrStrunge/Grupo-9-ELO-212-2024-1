`timescale 1ns / 1ps

module mux_test;
    logic [1:0] sel;
    logic [15:0] in;
    logic [3:0] out;
    mux DUT(
        .input_data(in),
        .sel(sel),
        .output_data(out)
    );

    initial begin
        in = 16'd3600;
        sel = 2'b00;
        #5;
        sel = 2'b01;
        #5;
        sel = 2'b10;
        #5;
        sel = 2'b11;
        #10;
        in = 16'd1200;
        sel = 2'b00;
        #5;
        sel = 2'b01;
        #5;
        sel = 2'b10;
        #5;
        sel = 2'b11;
        #10;
        
    end
endmodule
