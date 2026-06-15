`timescale 1ns/1ps

module flag_generator #(
    parameter WIDTH = 8
)
(
    input  [WIDTH-1:0] result,

    output zero_flag,
    output negative_flag
);

assign zero_flag = (result == {WIDTH{1'b0}});

assign negative_flag = result[WIDTH-1];

endmodule