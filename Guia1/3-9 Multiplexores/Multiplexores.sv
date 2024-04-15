module Multiplexores(
    input [3:0] A,B,C,D, 
    input [1:0] sel,
    output reg [3:0] out
    );
    
    always @ (A,B,C,D,sel) begin
        case(sel)
           2'b00   :   out=A;
           2'b01   :   out=B;
           2'b10   :   out=C;
           2'b11   :   out=D;
           default :   out=x;
        endcase
    end
endmodule
