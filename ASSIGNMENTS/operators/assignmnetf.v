module tb;
  reg [3:0] a;
  initial begin
    a = 4'b1010;

    $display("a       = %b", a);
    $display("!a      = %b", !a);
    $display("~a      = %b", ~a);
  end
endmodule

// a       = 1010
// !a      = 0 (logical inversion)
// ~a      = 0101 (bitwise inversion)
