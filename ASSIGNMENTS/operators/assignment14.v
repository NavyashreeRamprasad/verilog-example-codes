module relational_test;
  reg [3:0] a;
  reg [3:0] b;
  reg result;

  initial begin
    a = 4'b101x; 
	b = 4'b1010;
    
    result = (a > b); 
    $display("Value of A: %b, B: %b", a, b);
    $display("Result of (A > B): %b", result); // Output will be 'x'
  end
endmodule


module case_equality_test;
  reg [3:0] a, b;
  reg c_logical, c_case;

  initial begin
    a = 4'b10zx;
    b = 4'b10zx;

    c_logical = (a == b);  // Logical Equality
    c_case    = (a === b); // Case Equality

    $display("Logical Equality (A == B): %b", c_logical); // Results in x
    $display("Case Equality    (A === B): %b", c_case);    // Results in 1 (True)
  end
endmodule
