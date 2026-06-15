`timescale 1ns/1ps

module alu_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire carry;
wire zero;
wire overflow;

alu_top uut (

    .A(A),
    .B(B),
    .opcode(opcode),

    .result(result),
    .carry(carry),
    .zero(zero),
    .overflow(overflow)

);

initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0,alu_tb);

    // ADD
    A = 15;
    B = 10;
    opcode = 3'b000;
    #10;

    // SUB
    A = 20;
    B = 5;
    opcode = 3'b001;
    #10;

    // AND
    A = 15;
    B = 3;
    opcode = 3'b010;
    #10;

    // OR
    A = 15;
    B = 3;
    opcode = 3'b011;
    #10;

    // XOR
    A = 15;
    B = 3;
    opcode = 3'b100;
    #10;

    // NOT
    A = 15;
    B = 0;
    opcode = 3'b101;
    #10;

    // SHIFT LEFT
    A = 15;
    opcode = 3'b110;
    #10;

    // SHIFT RIGHT
    A = 15;
    opcode = 3'b111;
    #10;

    $finish;

end

endmodule