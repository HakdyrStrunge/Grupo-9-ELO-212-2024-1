`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 01:28:09
// Design Name: 
// Module Name: S4_actividad3_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad3_Testbench;
        logic [3:0]    A, B;
        logic [1:0]      OpCode;       
        logic [3:0]    Result;
        logic [4:0]      Flags;
        logic signed [3:0] A_signed, B_signed,result_signed;
        S4_actividad3 #(.M(4)) count_2(
            .A(A),
            .B(B),
            .OpCode(OpCode),
            .Result(Result),
            .Flags(Flags),
            
            //Pruebas
            .A_signed(A_signed), 
            .B_signed(B_signed),
            .result_signed(result_signed)
        );
        
        initial begin
            //Suma;
            OpCode= 2'b01;
                        
            A = 4'b0000;
            B = 4'b0000;
            #10;
            
            A = 4'b0000;
            B = 4'b0001;
            #10;
            
            A = 4'b0000;
            B = 4'b0010;
            #10;
            
            A = 4'b0000;
            B = 4'b0100;
            #10;
            
            A = 4'b0000;
            B = 4'b1000;
            #10;
            
            A = 4'b0001;
            B = 4'b1111;
            #10;
            
            A = 4'b0010;
            B = 4'b1100;
            #10;
            
            A = 4'b0100;
            B = 4'b1010;
            #10;
            
            A = 4'b1000;
            B = 4'b0110;
            #10;
            
            A = 4'b1111;
            B = 4'b1111;
            #10;
            
            
                        //Resta;
            OpCode= 2'b00;
            A = 4'b0000;
            B = 4'b0000;
            #10;
            
            A = 4'b0000;
            B = 4'b0001;
            #10;
            
            A = 4'b0000;
            B = 4'b0010;
            #10;
            
            A = 4'b0000;
            B = 4'b0100;
            #10;
            
            A = 4'b0000;
            B = 4'b1000;
            #10;
            
            A = 4'b0001;
            B = 4'b1111;
            #10;
            
            A = 4'b0010;
            B = 4'b1100;
            #10;
            
            A = 4'b0100;
            B = 4'b1010;
            #10;
            
            A = 4'b1000;
            B = 4'b0110;
            #10;
            
            A = 4'b1111;
            B = 4'b1111;
            #10;

            
            OpCode= 2'b10;
            A = 4'b0000;
            B = 4'b0000;
            #10;
            
            A = 4'b0000;
            B = 4'b0001;
            #10;
            
            A = 4'b0000;
            B = 4'b0010;
            #10;
            
            A = 4'b0000;
            B = 4'b0100;
            #10;
            
            A = 4'b0000;
            B = 4'b1000;
            #10;
            
            A = 4'b0001;
            B = 4'b1111;
            #10;
            
            A = 4'b0010;
            B = 4'b1100;
            #10;
            
            A = 4'b0100;
            B = 4'b1010;
            #10;
            
            A = 4'b1000;
            B = 4'b0110;
            #10;
            
            A = 4'b1111;
            B = 4'b1111;
            #10;

                        
            OpCode= 2'b11;
            A = 4'b0000;
            B = 4'b0000;
            #10;
            
            A = 4'b0000;
            B = 4'b0001;
            #10;
            
            A = 4'b0000;
            B = 4'b0010;
            #10;
            
            A = 4'b0000;
            B = 4'b0100;
            #10;
            
            A = 4'b0000;
            B = 4'b1000;
            #10;
            
            A = 4'b0001;
            B = 4'b1111;
            #10;
            
            A = 4'b0010;
            B = 4'b1100;
            #10;
            
            A = 4'b0100;
            B = 4'b1010;
            #10;
            
            A = 4'b1000;
            B = 4'b0110;
            #10;
            
            A = 4'b1111;
            B = 4'b1111;
            #10;

        end
endmodule
