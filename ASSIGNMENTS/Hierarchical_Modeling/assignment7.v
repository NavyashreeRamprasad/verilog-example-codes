module mux21(i0,i1,s,y);
input [31:0]i0,i1;
input s;
output [31:0] y;
assign y=(s==0)?i0:i1;
endmodule

module mux31(i0,i1,i2,s,y);
input [31:0]i0,i1,i2;
input [1:0]s;
output [31:0] y;

assign y=(s==2'b00)?i0:(s==2'b01)?i1:(s==2'b10)?i2:32'b0;
endmodule

module alu(a,b,f,r);
input [31:0] a,b;
input [2:0] f;
output [31:0] r;
reg [31:0] x=32'd1;
wire [31:0] n1,n2,n3;
wire [31:0]y1,y2;

mux21 i1(b,x,f[0],y1);
mux21 i2(b,x,f[0],y2);
assign n1 = a+y1;
assign n2 = a-y2;
assign n3 = a*b;
mux31 i3(n1,n2,n3,f[2:1],r);
endmodule

module tb;
reg [31:0] a,b;
reg [2:0] f;
wire [31:0] r;

alu dut(a,b,f,r);

initial 
begin
$monitor("time -> %0t : a=%0d , b= %0d , f= %0d , r = %0d", $time,a,b,f,r);

repeat(20)
begin
a=$urandom_range(10,20);
b=$urandom_range(10,20);
f=$random;
#1;
end

end

endmodule
