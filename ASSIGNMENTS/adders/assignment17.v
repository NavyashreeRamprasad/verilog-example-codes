module comp(a,b,less,great,equ);
input a,b;
output less,great,equ;

/*always@(*) begin
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

end*/

/*assign great = (a>b)? 1'b1 : 1'b0;
assign equ = (a==b)? 1'b1 : 1'b0;
assign less = (a<b) ? 1'b1 : 1'b0; */

and g1(great,a,~b);
xnor g2(equ,a,b);
and g3(less,~a,b);

endmodule



module tb;
reg a,b;
wire less,great,equ;

comp dut(a,b,less,great,equ);

initial begin
$monitor("a = %0b , b = %0b , less = %0b , great = %0b , equ =%0b",a,b,less,great,equ);

repeat(10) begin
{a,b} = $random;
#1;
end

end

endmodule
