module shift_mult;
integer a=2;
integer b=6;
integer result=0;
integer i;

initial begin
for(i=0;i<6;i=i+1) begin
	if(b[i]==1)
		result=result+(a<<i);
end
$display("a=%0d , b=%0d , a*b =%0d",a,b,result);
end
endmodule
