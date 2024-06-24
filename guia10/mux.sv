`timescale 1ns / 1ps

module mux(
    input logic [31:0] input_data,  // Entrada de 16 bits
    input logic [2:0] sel,           // Selector de 2 bits
    output logic [3:0] output_data   // Salida de 4 bits
);

    // Declara registros para las cuatro entradas de 4 bits
    logic [3:0] data_0;
    logic [3:0] data_1;
    logic [3:0] data_2;
    logic [3:0] data_3;
    logic [3:0] data_4;
    logic [3:0] data_5;
    logic [3:0] data_6;
    logic [3:0] data_7;

    // Asigna los datos de entrada a los registros correspondientes
    assign data_0 = input_data[3:0];
    assign data_1 = input_data[7:4];
    assign data_2 = input_data[11:8];
    assign data_3 = input_data[15:12];
    assign data_0 = input_data[19:16];
    assign data_1 = input_data[23:20];
    assign data_2 = input_data[27:24];
    assign data_3 = input_data[31:28];
    // L�gica para seleccionar la salida basada en el selector de 2 bits
    // L�gica para seleccionar la salida basada en el selector de 2 bits
    always_comb  begin
        case(sel)
            2'b00: output_data = data_0;
            2'b01: output_data = data_1;
            2'b10: output_data = data_2;
            2'b11: output_data = data_3;
            default: output_data = 4'b0000;  // En caso de un selector no v�lido, salida en cero
        endcase
    end 
endmodule
