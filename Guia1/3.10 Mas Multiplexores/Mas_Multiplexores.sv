module Mas_Multiplexores(
    input [3:0] A,B,C,D,E,
    input [2:0] sel,
    output reg [3:0] out
    );
    
    always @ (A,B,C,D,sel) begin
        case(sel)
           3'b000   :   out=A;
           3'b001   :   out=B;
           3'b010   :   out=C;
           3'b011   :   out=D;
           3'b100   :   out=E;
           default :   out=x;
        endcase
    end
endmodule
