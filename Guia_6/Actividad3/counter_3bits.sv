`timescale 1ns / 1ps
module counter_3bits(
    input logic clk,reset,     // Entrada de reloj
    output logic count  // Salida del contador de 2 bits
);

    // Registros para almacenar el valor del contador
    logic counter_reg;

    // Incremento del contador en cada flanco de subida del reloj
    always_ff @(posedge clk) begin
        if(reset)
            counter_reg <= 'd0;
        else
            counter_reg <= counter_reg + 1;
    end

    // Salida del contador
    assign count = counter_reg;

endmodule

