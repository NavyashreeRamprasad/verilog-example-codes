module ha(input a,b,output sum,carry);

assign sum = a^b;
assign carry = a&b;

endmodule

module tb;
reg a,b;
wire sum,carry;

ha dut(.*);

initial begin
repeat(10) begin
{a,b}=$random();
#1;
$display("a=%b ,b=%b , sum =%b , carry = %b",a,b,sum,carry);
end
end
endmodule


module fa(a,b,cin,carry,sum);
input a,b,cin;
output carry,sum;

ha u1(a,b,i1,i2);
ha u2(i1,cin,sum,i3);
or g1(carry,i2,i3);

endmodule

module fa_tb;
reg a,b,cin;
wire sum,carry;

fa dut(.*);

initial begin
repeat(10) begin
{a,b,cin}=$random();
#1;
$display("a=%b ,b=%b , cin=%b , sum =%b , carry = %b",a,b,cin,sum,carry);
end
end
endmodule

