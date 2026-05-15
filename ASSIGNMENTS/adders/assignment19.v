module comp2(a,b,great,equ,less);
parameter N=8;
input [N-1:0] a,b;
output reg less,great,equ;
//wire n1,n2,n3,n4,n5,n6,n7,n8;

always@(*) begin
if(a>b)
begin 
great =1'b1;
less=1'b0;
equ = 1'b0;
end

else if (a==b) begin
great =1'b0;
less=1'b0;
equ = 1'b1;
end

else begin
great =1'b0;
less=1'b1;
equ = 1'b0;
end

end

/*assign great = (a>b)? 1'b1 : 1'b0;
assign equ = (a==b)? 1'b1 : 1'b0;
assign less = (a<b) ? 1'b1 : 1'b0; */



endmodule



module tb;
parameter N=8;
reg [N-1:0] a,b;
wire less,great,equ;

comp2 dut(a,b,great,equ,less);

initial begin
$monitor("a = %0d , b = %0d , less = %0b , great = %0b , equ =%0b",a,b,less,great,equ);

repeat(10) begin
{a,b} = $random;

#1;
end

end

endmodule
