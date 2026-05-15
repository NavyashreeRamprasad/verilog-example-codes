module nested_cond_test;
  integer a, b, c, d, e, f, g, h, i, j, k;
  wire [31:0] y;

  // ii. Put y in an assign statement
 /* assign y = (a == b) ? c : 
             (d > 20) ? e : 
             (f > 40) ? g : 
             (h == i) ? j : k;*/
reg [31:0] y_reg;

always @(*) begin
  if (a == b)
    y_reg = c;
  else if (d > 20)
    y_reg = e;
  else if (f > 40)
    y_reg = g;
  else if (h == i)
    y_reg = j;
  else
    y_reg = k;
end

  initial begin
    // iii. Print using $monitor
    $monitor("Time=%0t | a=%0d b=%0d c=%0d d=%0d e=%0d f=%0d g=%0d h=%0d i=%0d j=%0d k=%0d | y_reg=%0d", 
              $time, a, b,c, d, e, f,g, h, i,j,k, y_reg);


    // i. Randomly generate values 10 times
    repeat (10) begin
      a = $urandom_range(0, 5); 
	  b = $urandom_range(0, 5);
      c = $urandom_range(0, 5);               
	  d = $urandom_range(10, 30);
      e = $urandom_range(0, 5);                  
	  f = $urandom_range(30, 50);
      g = $urandom_range(30, 50);             
	  h = $urandom_range(0, 2);
      i = $urandom_range(0, 2);  
	  j = $urandom_range(0, 2);
      k = $urandom_range(0, 2);
      #10; // Wait for simulation step
    end
  end
endmodule
