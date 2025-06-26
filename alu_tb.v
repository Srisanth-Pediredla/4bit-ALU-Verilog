`timescale 1ns/1ps

module alu_tb;

reg [3:0] A, B;
reg [2:0] sel;
wire [3:0] result;
wire carryout, zero;

// Instantiate ALU
alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .result(result),
    .carryout(carryout),
    .zero(zero)
);

// Dump to VCD for waveform viewing
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, alu_tb);
end

initial begin
    $display("A    B    SEL  | RESULT CARRY ZERO");
    $monitor("%b %b %b | %b     %b     %b", A, B, sel, result, carryout, zero);

    // Test case: A = 3, B = 1
    A = 4'b0011;
    B = 4'b0001;

    sel = 3'b000; #10; // A+B
    sel = 3'b001; #10; // A-B
    sel = 3'b010; #10; // A & B
    sel = 3'b011; #10; // A | B
    sel = 3'b100; #10; // A ^ B
    sel = 3'b101; #10; // ~A
    sel = 3'b110; #10; // A+1
    sel = 3'b111; #10; // A-1

    $stop;
end

endmodule
