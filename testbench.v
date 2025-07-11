
module ALU_8bit_tb;

    reg  [7:0] A, B;
    reg  [3:0] ALU_SEL;
    wire [7:0] ALU_OUT;
    wire Carryout,zero;

    ALU_8bit uut (
        .A(A), .B(B),
        .ALU_SEL(ALU_SEL),
        .ALU_OUT(ALU_OUT),
      .Carryout(Carryout),
      .zero(zero)
    );
  initial begin
    $dumpfile("dump.vcd");
	$dumpvars(1, uut);
  end

    initial begin
      $display("A       B       ALU_SEL  OUT      Carry Zero");
        A = 8'h0A; B = 8'h05;

        for (ALU_SEL = 0; ALU_SEL < 15; ALU_SEL = ALU_SEL + 1) begin
            #10;
          $display("%h  %h    %b     %h    %b     %b", A, B, ALU_SEL, ALU_OUT, Carryout, zero);
          
        end

        $finish;
    end

endmodule
