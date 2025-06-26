module alu (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,
    output reg [3:0] result,
    output reg carryout,
    output reg zero
);

always @(*) begin
    carryout = 0;
    case (sel)
        3'b000: {carryout, result} = A + B;
        3'b001: {carryout, result} = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        3'b100: result = A ^ B;
        3'b101: result = ~A;
        3'b110: {carryout, result} = A + 1;
        3'b111: {carryout, result} = A - 1;
        default: result = 4'b0000;
    endcase
    zero = (result == 4'b0000) ? 1 : 0;
end

endmodule
