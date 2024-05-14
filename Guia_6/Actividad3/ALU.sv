`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: Aguilera, Fernandez, Vega
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad3
// Project Name:  Actividad 3
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: Se codifica el accionar de una ALU, donde mediante 2 entradas (A y B)
// realizaremos distintas operaciones aritmeticas (Suma, Resta, Or y And)
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU #(parameter M = 7)(
    input  logic [M-1:0]    A, B,
    input  logic [1:0]      OpCode,       
    output logic [M-1:0]    Result,
    output logic [4:0]      Flags // N Z C V P 
                                    //4 3 2 1 0
   );
 
    always_comb begin
        logic [M:0] res,B_comp2;
        int contador ;
        foreach(Flags[i])
             Flags[i] = 'x; //Para evitar latches

        B_comp2 = (~B + 1); //calculamos el complemento a2 de B
        if(OpCode == 2'b00) begin
        //Resta
            Result = A + B_comp2;
            //Bloque condicional que se encarga de obtener la FLAG C
            //Si A es mayor que B no se genera C
            if (A >= B) begin
                Flags[2] = 0;
            end else begin
                Flags[2] = 1;
            end
            //Considera resultado de complemento 2
            //Verifica si hay overflow en suma
            //Flag V
            
            if (A[M-1] && !B[M-1] && !Result[M-1])
                Flags[1] = 1;
            else if(!A[M-1] && B[M-1] && Result[M-1])
                Flags[1] = 1;
            else
                Flags[1] = 0;
        end;
        if(OpCode == 2'b01) begin
        

            res = A+B; // Verifica si existe carry out en suma
            Result = A+B; //Resultado sin signo
            
            //Considera resultado de complemento 2
            //Verifica si hay overflow
            //Flag V
            //Solo en caso de la suma
            if (!A[M-1] && !B[M-1] && Result[M-1])
                Flags[1] = 1;
            else if(A[M-1] && B[M-1] && !Result[M-1])
                Flags[1] = 1;
            else
                Flags[1] = 0;
                
            //Verifica si hay carry out
            //Considera resultado sin signo (numero binario)
            //Flag C
            if (res[M])
                Flags[2]=1;
            else
                Flags[2]=0;
            //Alternativamente funciona verificar bits mas significativos de A y B si ambos tienen valor alto, tiene carry out
        end;     
        if(OpCode == 2'b10) begin
            Result = A|B; //Resultado sin signo
            Flags[1] = 0;
            Flags[2]=0;
        end;
         if (OpCode == 2'b11) begin
            Result = A & B; // Resultado sin signo
            Flags[1] = 0;
            Flags[2] = 0;
        end;
        //Verifica si el numero es negativo
        //Flag N
        if (Result[M-1])
            Flags[4] = 1;
        else
            Flags[4] = 0;
            
        //Verifica si resultado es 0
        //Flag Z
        //Considera el resultado sin signo (numero binario)
        if (Result == 'd0) 
            Flags[3] = 1;
        else
            Flags[3] = 0; 
            
        // Verificar si el número de unos es impar
        //Considera el resultado de sin signo (numero binario)
        //Flag P
        if (^(Result))
            Flags[0] = 1; 
        else 
            Flags[0] = 0;
    end
    
endmodule