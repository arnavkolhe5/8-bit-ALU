	module ALU_8bit (
    input  [7:0] A, B,
    input  [3:0] ALU_SEL,
    output reg [7:0] ALU_OUT,
    output reg Carryout,
    output reg zero
);
    always @(*) begin
        Carryout = 0;
        case (ALU_SEL)
            4'b0000: ALU_OUT = A + B;                  // Addition
            4'b0001: ALU_OUT = A - B;                    // Subtraction
          4'b0010: {Carryout, ALU_OUT} = A + B; // Addition with CarryOut
            4'b0011: ALU_OUT = A & B;  	         // AND
            4'b0100: ALU_OUT = A | B;  			// OR
            4'b0101: ALU_OUT = A ^ B;             // XOR
            4'b0110: ALU_OUT = ~(A | B);           // NOR
            4'b0111: ALU_OUT = A << 1;           // Logical left shift
            4'b1000: ALU_OUT = A >> 1;                  // Logical right shift
            4'b1001: ALU_OUT = (A == B) ? 8'b1 : 8'b0;    // Equality
            4'b1010: ALU_OUT = (A > B) ? A : B;          // Max of A, B
            4'b1011: ALU_OUT = (A < B) ? A : B;       	   // Min of A, B
            4'b1100: ALU_OUT = ~A;                       // Bitwise NOT
            default: ALU_OUT = 8'b00000000;
        endcase

        zero = (ALU_OUT == 8'b00000000) ? 1'b1 : 1'b0;
    end
endmodule
