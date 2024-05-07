`timescale 1ns / 1ps

module mux(
    input logic [31:0] input_data,  // Entrada de 32 bits
    input logic [2:0] sel,           // Selector de 3 bits
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
    assign data_4 = input_data[19:16];
    assign data_5 = input_data[23:20];
    assign data_6 = input_data[27:24];
    assign data_7 = input_data[31:28];


    // Lógica para seleccionar la salida basada en el selector de 2 bits
    // Lógica para seleccionar la salida basada en el selector de 2 bits
    always_comb  begin
        case(sel)
            3'b000: output_data = data_0;
            3'b001: output_data = data_1;
            3'b010: output_data = data_2;
            3'b011: output_data = data_3;
            3'b100: output_data = data_4;
            3'b101: output_data = data_5;
            3'b110: output_data = data_6;
            3'b111: output_data = data_7;
            default: output_data = 4'b0000;  // En caso de un selector no válido, salida en cero
        endcase
    end 
endmodule