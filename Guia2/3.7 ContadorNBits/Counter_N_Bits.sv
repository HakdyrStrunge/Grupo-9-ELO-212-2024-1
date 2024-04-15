`timescale 1ns / 1ps
module Counter_N_Bits #(parameter WIDTH)
(
    input logic clk, reset,
    output logic [WIDTH:0] count
);

    always_ff @(posedge clk) begin
        if (reset)
           count <= {WIDTH{1'b0}};
        else
            count <= count + 1;
    end

endmodule
