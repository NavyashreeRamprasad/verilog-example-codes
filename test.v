module ha(a,b,sum,carry);
input [7:0]a,b;
output reg [7:0] sum;
  output reg [7:0] carry;

always @(*) begin
sum = a^b;
carry = a&b;
end

endmodule

module tb;
reg [7:0] a,b;
wire [7:0] sum;
wire [7:0] carry;

ha dut(.a(a),.b(b),.sum(sum),.carry(carry));

initial begin
repeat(10) begin
{a,b}=$random;
#1;
$display("a=%d , b=%d , sum=%d , carry=%d",a,b,sum,carry);
end
end

endmodule

