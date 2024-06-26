`timescale 1ns / 1ps

module mux(
    input logic [16:0] input_data,  // Entrada de 16 bits
    input logic [2:0] sel,           // Selector de 3 bits
    output logic [3:0] output_data   // Salida de 4 bits
);

    // Declara registros para las cuatro entradas de 4 bits
    logic [3:0] data_0;
    logic [3:0] data_1;
    logic [3:0] data_2;
    logic [3:0] data_3;

    // Asigna los datos de entrada a los registros correspondientes
    assign data_0 = input_data[3:0];
    assign data_1 = input_data[7:4];
    assign data_2 = input_data[11:8];
    assign data_3 = input_data[15:12];


    // L�gica para seleccionar la salida basada en el selector de 2 bits
    // L�gica para seleccionar la salida basada en el selector de 2 bits
    always_comb  begin
        case(sel)
            3'b000: output_data = data_0;
            3'b001: output_data = data_1;
            3'b010: output_data = data_2;
            3'b011: output_data = data_3;
            default: output_data = 4'b0000;  // En caso de un selector no v�lido, salida en cero
        endcase
    end 
endmodule
