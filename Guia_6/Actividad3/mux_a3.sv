`timescale 1ns / 1ps

module mux_a3(
    input logic [6:0] input_data,  // Entrada de 16 bits
    input logic sel,           // Selector de 2 bits
    output logic [3:0] output_data   // Salida de 4 bits
);
    logic [7:0] input_d; 
    assign input_d = input_data;
    assign input_d[7]= 'b0;
    // Declara registros para las cuatro entradas de 4 bits
    logic [3:0] data_0;
    logic [3:0] data_1;
    logic data_2;
    logic data_3;
    logic data_4;
    logic data_5;
    logic data_6;
    logic data_7;

    // Asigna los datos de entrada a los registros correspondientes
    assign data_0 = input_data[3:0];
    assign data_1 = {1'b0, input_data[6:4]};



    // Lógica para seleccionar la salida basada en el selector de 2 bits
    // Lógica para seleccionar la salida basada en el selector de 2 bits
    always_comb  begin
        case(sel)
            1'b0: output_data = data_0;
            1'b1: output_data = data_1;
           
            default: output_data = 1'b0;  // En caso de un selector no válido, salida en cero
        endcase
    end 
endmodule

