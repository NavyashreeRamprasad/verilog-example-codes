module comp(a,b,great,equ,less);
input a,b;
output less,great,equ;
assign great = (a>b)? 1'b1 : 1'b0;
assign equ = (a==b)? 1'b1 : 1'b0;
assign less = (a<b) ? 1'b1 : 1'b0;
endmodule

module comp2(a,b,great,equ,less);
input [1:0] a,b;
output less,great,equ;
wire n1,n2,n3,n4,n5,n6,n7,n8;

comp i1(a[0],b[0],n1,n2,n3);
comp i2(a[1],b[1],n4,n5,n6);
and g1(equ,n2,n5);
and g2(n7,n1,n5);
or g3(great,n7,n4);
and g4(n8,n5,n3);
or g5(less,n8,n6);

//wire n1,n2,n3,n4,n5,n6,n7,n8;
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

/*and g1(n1,a[1],~b[1]);
and g2(n2,a[0],~b[1],~b[0]);
and g3(n3,a[1],a[0],~b[0]);
or g4(great,n1,n2,n3);
xnor g5(n4,a[0],b[0]);
xnor g6(n5,a[1],b[1]);
and g7(equ,n4,n5);
and g8(n6,~a[1],b[1]);
and g9(n7,~a[0],b[1],b[0]);
and g11(n8,~a[1],~a[0],b[0]);
or g12(less,n6,n7,n8);*/

endmodule



module tb;
reg [1:0] a,b;
wire less,great,equ;

comp2 dut(a,b,great,equ,less);

initial begin
$monitor("a = %0b , b = %0b , less = %0b , great = %0b , equ =%0b",a,b,less,great,equ);

repeat(10) begin
{a,b} = $random;

#1;
end

end

endmodule
