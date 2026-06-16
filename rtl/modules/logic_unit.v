`timescale 1ns/1ps

module logic_unit #(
    parameter WIDTH = 8
)
(
    input  [WIDTH-1:0] input_a,
    input  [WIDTH-1:0] input_b,
    input  [1:0] logic_select,

    output reg [WIDTH-1:0] result
);

always @(*) begin

    case(logic_select)

        2'b00:
            result = input_a & input_b;

        2'b01:
            result = input_a | input_b;

        2'b10:
            result = input_a ^ input_b;

        2'b11:
            result = ~input_a;

        default:
            result = {WIDTH{1'b0}};

    endcase

end

endmodule