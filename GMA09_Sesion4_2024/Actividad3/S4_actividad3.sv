`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: 
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad3
// Project Name: 
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad3 #(parameter M = 8)(
    input  logic [M-1:0]    A, B,
    input  logic [1:0]      OpCode,       
    output logic [M-1:0]    Result,
    output logic [4:0]      Flags, // N Z C V P 
                                    //4 3 2 1 0
    output logic signed [M-1:0] A_signed, B_signed,result_signed
    );
 
    always_comb begin
        logic [M:0] res;
        int contador ;
        //logic signed [M-1:0] A_signed, B_signed;
        
        A_signed = (A[M-1]) ? (~A + 1) : A; // Si el bit más significativo de A es 1, toma el complemento a dos; de lo contrario, simplemente asigna A
        // Verificar que pasa si A se sale de los cvalores posibles en complemento2 
        B_signed = (B[M-1]) ? (~B + 1) : B; // Si el bit más significativo de A es 1, toma el complemento a dos; de lo contrario, simplemente asigna A
        if(OpCode == 2'b00)
        //Resta
            result_signed = A_signed - B_signed;
            res = A-B; // Verifica si existe carry out en suma
            if (A >= B) begin
                Result = A - B; // Resultado sin signo
                Flags[2] = 0;
            end else begin
                Result = B - A; // Resultado sin signo
                Flags[2] = 1;
            end
            //Considera resultado de complemento 2
            //Verifica si hay overflow
            //Flag V
            
            if (A_signed[M-1] && !B_signed[M-1] && !result_signed[M-1])
                Flags[1] = 1;
            else if(!A_signed[M-1] && B_signed[M-1] && result_signed[M-1])
                Flags[1] = 1;
            else
                Flags[1] = 0;

        if(OpCode == 2'b01)
        
            result_signed = A_signed + B_signed;
            res = A+B; // Verifica si existe carry out en suma
            Result = A+B; //Resultado sin signo
            
            //Considera resultado de complemento 2
            //Verifica si hay overflow
            //Flag V
            //Solo en caso de la suma
            if (!A_signed[M-1] && !B_signed[M-1] && result_signed[M-1])
                Flags[1] = 1;
            else if(A_signed[M-1] && B_signed[M-1] && !result_signed[M-1])
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
                
        if(OpCode == 2'b10) begin
            result_signed = A_signed | B_signed;
            res = A|B; // Verifica si existe carry out en suma
            Result = A|B; //Resultado sin signo
            Flags[1] = 0;
            Flags[2]=0;
        end;
         if (OpCode == 2'b11) begin
            result_signed = A_signed & B_signed;
            res = A & B; // Verifica si existe carry out en suma
            Result = A & B; // Resultado sin signo
            Flags[1] = 0;
            Flags[2] = 0;
        end;
        //Verifica si el numero es negativo
        //Flag N
        if (result_signed[M-1])
            Flags[4] = 1;
        else
            Flags[4] = 0;
            



        //Verifica si resultado es 0
        //Flag Z
        //Considera el resultado sin signo (numero binario)
        if (Result == 'd0) // Utiliza '==' para comparar, no '='
            Flags[3] = 1; // Utiliza '=' para la asignación, no '<='
        else
            Flags[3] = 0; 
            
        // Verificar si el número de unos es impar
        //Considera el resultado de sin signo (numero binario)
        //Flag P
        contador=0;
        for (int i = 0; i < M; i++) begin
            if (Result[i] == 1)
                contador++;
            end

        if (contador % 2 != 0)
            Flags[0] = 1; 
        else
            Flags[0] = 0;
    end
    
endmodule
