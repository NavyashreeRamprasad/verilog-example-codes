// gate level
module dff(d,clk,q,qb);
input d,clk;
output q,qb;
wire n1,n2,n3,n4,n5,n6,clkb,db,n4b;

not g9(db,d);
not g0(clkb,clk);
nand g1(n1,d,clkb);
nand g2(n2,clkb,db);
nand g3(n4,n1,n3);
nand g4(n3,n2,n4);
nand g5(n5,n4,clk);
not g(n4b,n4);
nand g6(n6,n4b,clk);
nand g7(q,n5,qb);
nand g8(qb,n6,q);
endmodule

module tb;
reg clk,d;
wire q,qb;
dff dut(d,clk,q,qb);
always #5 clk = ~clk;
initial begin
clk=0;
repeat(10) begin
d=$random();
#1;
end
#100;
$finish();
end
endmodule
