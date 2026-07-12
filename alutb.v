`timescale 1ns/1ps

module alu_tb;

    // Inputs
    reg clk;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;

    // Outputs
    wire [3:0] result;
    wire carry;
    wire zero;

    // Instantiate the ALU
    alu uut (
        .clk(clk),
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin

        // Generate VCD file
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        // Display values on terminal
        $monitor("Time=%0t | Opcode=%b | A=%d | B=%d | Result=%d | Carry=%b | Zero=%b",
                 $time, opcode, A, B, result, carry, zero);

        // Test 1 : Addition
        A = 4'd5;
        B = 4'd3;
        opcode = 3'b000;
        #10;

        // Test 2 : Subtraction
        A = 4'd9;
        B = 4'd2;
        opcode = 3'b001;
        #10;

        // Test 3 : AND
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b010;
        #10;

        // Test 4 : OR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b011;
        #10;

        // Test 5 : XOR
        A = 4'b1100;
        B = 4'b1010;
        opcode = 3'b100;
        #10;

        // Test 6 : NOT
        A = 4'b1100;
        B = 4'b0000;
        opcode = 3'b101;
        #10;

        // Test 7 : Left Shift
        A = 4'b0011;
        B = 4'b0000;
        opcode = 3'b110;
        #10;

        // Test 8 : Right Shift
        A = 4'b1000;
        B = 4'b0000;
        opcode = 3'b111;
        #10;

        $finish;
    end

endmodule
