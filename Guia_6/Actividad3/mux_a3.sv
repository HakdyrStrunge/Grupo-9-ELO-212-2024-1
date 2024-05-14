`timescale 1ns / 1ps

module mux_a3(
    input logic [7:0] input_data,  // Entrada de 16 bits
    input logic [2:0] sel,           // Selector de 2 bits
    output logic output_data   // Salida de 4 bits
);

    // Declara registros para las cuatro entradas de 4 bits
    logic data_0;
    logic data_1;
    logic data_2;
    logic data_3;
    logic data_4;
    logic data_5;
    logic data_6;
    logic data_7;

    // Asigna los datos de entrada a los registros correspondientes
    assign data_0 = input_data[0];
    assign data_1 = input_data[1];
    assign data_2 = input_data[2];
    assign data_3 = input_data[3];
    assign data_4 = input_data[4];
    assign data_5 = input_data[5];
    assign data_6 = input_data[6];
    assign data_7 = 'b0;



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
            default: output_data = 7'b00000000;  // En caso de un selector no válido, salida en cero
        endcase
    end 
endmodule
