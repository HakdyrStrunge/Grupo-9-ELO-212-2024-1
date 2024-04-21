`timescale 1ns / 1ps


module testimplementacion();

    logic clk_in, reset=1,
          clk_out50, clk_out30, clk_out10, clk_out1 ;
    
    implementacionreloj #(
        .fclkin_dado(100e6),
        .fclkout_deseado(50e6)
                        
    ) divider50 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out50)
    );
    implementacionreloj #(
        .fclkin_dado(100e6),
        .fclkout_deseado(30e6)
                        
    ) divider30 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out30)
    );
    implementacionreloj #(
        .fclkin_dado(100e6),
        .fclkout_deseado(10e6)
                        
    ) divider10 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out10)
    );
    implementacionreloj #(
        .fclkin_dado(100e6),
        .fclkout_deseado(1e6)
                        
    ) divider1 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out1)
    );
    
    always #5 clk_in = ~clk_in; // Generación de señal de reloj
    always #100 reset = ~reset;
    initial begin
        clk_in= 1'b0;
   
    end
endmodule
