module full_adder #(parameter WIDTH =8 ) (a,b,cin,sum,carry);
input [WIDTH-1:0]a,b;
input cin;
output reg [WIDTH-1:0]sum;
output reg carry;

always@(*) begin
{carry,sum} = a+b+cin;
end

endmodule

module tb;
parameter WIDTH =12;
reg [WIDTH-1:0]a,b;
reg cin;
wire [WIDTH-1:0]sum;
wire carry;
full_adder #(.WIDTH(WIDTH)) dut(a,b,cin,sum,carry);
initial 
begin
$monitor("time -> %0t : a=%b , b= %b , c= %b , sum = %b , carry = %b", $time,a,b,cin,sum,carry);

repeat(10)
begin
{a,b,cin}=$random;
#1;
end

end

endmodule
