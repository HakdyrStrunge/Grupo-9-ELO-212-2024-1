module Fib_Rec(
    input a,b,c,d,
    output reg  out
    );
    reg comp1,comp2,comp3;
    always @ (a,b,c,d) begin
        comp1 = ~a & ~c;
        comp2 = ~b & ~c;
        comp3 = ~b & ~d;
        out = comp1 | comp2 | comp3;
    end
endmodule

