`timescale 1ns/1ps

module alu_top(

    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,

    output reg [7:0] result,
    output reg carry,
    output reg zero,
    output reg overflow

);

reg [8:0] temp;

always @(*) begin

    carry = 0;
    overflow = 0;

    case(opcode)

        3'b000: begin
            temp = A + B;
            result = temp[7:0];
            carry = temp[8];
        end

        3'b001: begin
            temp = A - B;
            result = temp[7:0];
            carry = temp[8];
        end

        3'b010:
            result = A & B;

        3'b011:
            result = A | B;

        3'b100:
            result = A ^ B;

        3'b101:
            result = ~A;

        3'b110:
            result = A << 1;

        3'b111:
            result = A >> 1;

    endcase

    if(result == 8'b00000000)
        zero = 1;
    else
        zero = 0;

end

endmodule