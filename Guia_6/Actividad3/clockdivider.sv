`timescale 1ns / 1ps

module clockdivider #(
    parameter fclkin_dado = 50,
    parameter fclkout_deseado = 50
)(
    input logic clk_in,
    input logic reset,
    output logic clk_out
);

    // Parámetro local para definir constantes internas al módulo mediante expresiones matemáticas
    // El signo $ especifica una llamada al sistema y estas expresiones no son sintetizables
    localparam COUNTER_MAX = int'($ceil(fclkin_dado /(fclkout_deseado*2))); 
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    // Contador de cuenta regresiva
    logic [DELAY_WIDTH-1:0] counter = 'd0;

    // Reset del contador y cambio de salida de reloj cada vez que el contador alcanza su valor máximo
    always_ff @(posedge clk_in or posedge reset) begin
        if (reset == 1'b1) begin
            // Reset sincrónico, establece el contador y la salida a un valor conocido
            counter <= 'd0;
            clk_out <= 0;
        end else if (counter == COUNTER_MAX-1) begin
            // Se resetea el contador y se invierte la salida
            counter <= 'd0;
            clk_out <= ~clk_out;
        end else begin
            // Se incrementa el contador y se mantiene la salida con su valor anterior
            counter <= counter + 'd1;
            clk_out <= clk_out;
        end
    end

endmodule
