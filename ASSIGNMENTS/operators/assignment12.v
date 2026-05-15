//RHS bigger than LHS (Truncation)
module concat_truncation;
  reg [1:0] a = 2'b10;
  reg [1:0] b = 2'b11;
  reg [2:0] x;

  initial begin
    x = {a, b};   // {10,11} = 1011 (4 bits)
                  // x is only 3 bits → stores 011
    $display("x = %b", x);  // Output: 011
  end
endmodule


//Concatenation to concatenation
module concat_to_concat;
  reg [1:0] a = 2'b10;
  reg [3:0] b = 4'b0111;
  reg [3:0] c = 4'b1111;

  reg [2:0] p;
  reg [2:0] q;
  reg [2:0] r;

  initial begin

    {p, q, r} = {a, b, c};  
    // RHS = 10 0111 1111 → 10 bits
    // LHS = 9 bits → takes last 9 bits → 0 0111 1111

    $display("a = %b, b = %b , c=%b", a, b, c); 
    $display("p = %b, q = %b , r=%b", p, q, r); // p=001, q=111, r=111
  end
endmodule



//Different sized vectors
module diff_sizes;
  reg [0:0] a = 1'b1;
  reg [2:0] b = 3'b010;
  reg [1:0] c = 2'b11;

  reg [5:0] result;

  initial begin
    result = {a, b, c};  
    // {1, 010, 11} = 101011

    $display("result = %b", result); // 101011
  end
endmodule



//Concatenating integer
module concat_integer;
  integer f;
  reg [2:0] catd;

  initial begin
    f = 32'h00000005;   // 32-bit value: ...00000101
    catd = {1'b1, 1'b0, f};  
    // total bits = 1 + 1 + 32 = 34 bits
    // catd is 3 bits → takes last 3 bits of f → 101

    $display("catd = %b", catd); // 101
  end
endmodule



//Padding (RHS smaller than LHS)
module padding_case;
  reg [1:0] a = 2'b10;
  reg [4:0] x;

  initial begin
    x = {a};  
    // RHS = 2 bits → LHS = 5 bits
    // padded with zeros → 00010

    $display("x = %b", x); // 00010
  end
endmodule
