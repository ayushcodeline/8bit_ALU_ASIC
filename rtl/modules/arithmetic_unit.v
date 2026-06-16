`timescale 1ns/1ps

module arithmetic_unit #(
    parameter WIDTH = 8
)
(
    input  [WIDTH-1:0] input_a,
    input  [WIDTH-1:0] input_b,
    input              operation,

    output reg [WIDTH-1:0] result,
    output reg             carry_flag,
    output reg             overflow_flag
);

reg [WIDTH:0] temp;

always @(*) begin

    if (operation == 1'b0) begin

        // Addition
        temp = input_a + input_b;
        result = temp[WIDTH-1:0];
        carry_flag = temp[WIDTH];

        overflow_flag =
            (~input_a[WIDTH-1] & ~input_b[WIDTH-1] & result[WIDTH-1]) |
            ( input_a[WIDTH-1] &  input_b[WIDTH-1] & ~result[WIDTH-1]);

    end
    else begin

        // Subtraction
        temp = input_a - input_b;
        result = temp[WIDTH-1:0];
        carry_flag = temp[WIDTH];

        overflow_flag =
            (~input_a[WIDTH-1] & input_b[WIDTH-1] & result[WIDTH-1]) |
            ( input_a[WIDTH-1] & ~input_b[WIDTH-1] & ~result[WIDTH-1]);

    end

end

endmodule