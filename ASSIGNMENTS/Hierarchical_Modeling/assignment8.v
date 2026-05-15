//synchronous reset
/*module dff(clk,rst,d,q);
input clk,rst,d;
output reg q;

always @(posedge clk) begin
if(rst) 
	q<=0;
else 
	q<=d;
end

end
endmodule*/

//asynchronous reset
module dff(clk,rst,d,q);
input clk,rst,d;
output reg q;

always @(posedge clk or posedge rst) begin
if(rst) 
	q<=0;
else 
	q<=d;
end

end
endmodule


module tb;
reg clk,rst,d;
wire q;
dff dut(clk,rst,d,q);
always #5 clk = ~clk;
initial begin
clk=0;
rst=1;
@(posedge clk);
rst=0;
repeat(10) begin
d=$random();
#1;
end
#100;
$finish();
end
endmodule
