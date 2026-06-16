`timescale 1ns/1ps

module shift_unit #(
    parameter WIDTH = 8
)
(
    input  [WIDTH-1:0] input_a,
    input              shift_select,

    output reg [WIDTH-1:0] result
);

always @(*) begin

    case(shift_select)

        1'b0:
            result = input_a << 1;

        1'b1:
            result = input_a >> 1;

        default:
            result = {WIDTH{1'b0}};

    endcase

end

endmodule