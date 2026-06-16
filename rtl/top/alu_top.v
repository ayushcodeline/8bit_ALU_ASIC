`timescale 1ns/1ps

module alu_top #(
    parameter WIDTH = 8
)
(
    input  [WIDTH-1:0] input_a,
    input  [WIDTH-1:0] input_b,
    input  [2:0]       opcode,

    output reg [WIDTH-1:0] result,
    output                 carry_flag,
    output                 overflow_flag,
    output                 zero_flag,
    output                 negative_flag
);

    //====================================================
    // Internal wires
    //====================================================

    wire [WIDTH-1:0] arithmetic_result;
    wire [WIDTH-1:0] logic_result;
    wire [WIDTH-1:0] shift_result;

    //====================================================
    // Arithmetic Flags
    //====================================================

    wire arithmetic_carry;
    wire arithmetic_overflow;

    //====================================================
    // Arithmetic Unit
    // operation:
    // 0 -> ADD
    // 1 -> SUB
    //====================================================

    arithmetic_unit #(
        .WIDTH(WIDTH)
    ) arithmetic_inst (

        .input_a(input_a),
        .input_b(input_b),
        .operation(opcode[0]),

        .result(arithmetic_result),
        .carry_flag(arithmetic_carry),
        .overflow_flag(arithmetic_overflow)

    );

    //====================================================
    // Logic Unit
    //
    // 00 -> AND
    // 01 -> OR
    // 10 -> XOR
    // 11 -> NOT
    //====================================================

    logic_unit #(
        .WIDTH(WIDTH)
    ) logic_inst (

        .input_a(input_a),
        .input_b(input_b),
        .logic_select(opcode[1:0]),

        .result(logic_result)

    );

    //====================================================
    // Shift Unit
    //
    // 0 -> LEFT
    // 1 -> RIGHT
    //====================================================

    shift_unit #(
        .WIDTH(WIDTH)
    ) shift_inst (

        .input_a(input_a),
        .shift_select(opcode[0]),

        .result(shift_result)

    );

    //====================================================
    // Result Multiplexer
    //====================================================

    always @(*) begin

        case(opcode)

            3'b000,
            3'b001:
                result = arithmetic_result;

            3'b010,
            3'b011,
            3'b100,
            3'b101:
                result = logic_result;

            3'b110,
            3'b111:
                result = shift_result;

            default:
                result = {WIDTH{1'b0}};

        endcase

    end

    //====================================================
    // Flag Generator
    //====================================================

    flag_generator #(
        .WIDTH(WIDTH)
    ) flag_inst (

        .result(result),

        .zero_flag(zero_flag),
        .negative_flag(negative_flag)

    );

    //====================================================
    // Carry and Overflow
    // Valid only for arithmetic operations
    //====================================================

    assign carry_flag =
            (opcode == 3'b000 || opcode == 3'b001)
            ? arithmetic_carry
            : 1'b0;

    assign overflow_flag =
            (opcode == 3'b000 || opcode == 3'b001)
            ? arithmetic_overflow
            : 1'b0;

endmodule