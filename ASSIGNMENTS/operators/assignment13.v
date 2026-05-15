module cr;
  reg a = 1'b1;
  reg c = 1'b0;
  reg [2:0] b =3'b101;
  reg [8:0] catr;

  initial begin
    catr = {{4{a}},b,{2{c}}};   
	$display("catr = %b", catr);  
  end
endmodule

module validtb;
  reg a = 1'b1;
  reg [3:0] valid;

  assign valid = {4{a}};
  initial begin
   	$display("valid = %b", valid);  
  end
endmodule

module validtb2;
 parameter WIDTH =4;
 reg [WIDTH-1:0] valid;
  initial begin
   valid = {WIDTH{1'b1}};
   	$display("valid = %b", valid);  
  end
endmodule


module validtb3;
 parameter SIZE =4;
 reg [SIZE-1:0] valid;
 reg [SIZE-1:0] ready;
   initial begin
   valid = {SIZE{1'b1}};
   ready = {SIZE{1'b1}};
   	$display("valid = %b", valid);  
   	$display("ready = %b", ready);  
  end
endmodule



