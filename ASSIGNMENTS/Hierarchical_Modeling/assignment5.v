module fa(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire n1,n2,n3;

xor g1(sum,a,b,cin);
and g2(n1,a,b);
and g3(n2,b,cin);
and g4(n3,cin,a);
or g5(carry,n1,n2,n3);

endmodule

module param_full_adder #(
    parameter N = 4
)(
    input  [N-1:0] a,
    input  [N-1:0] b,
    input  cin,
    output [N-1:0] sum,
    output carry
);

wire [N:0] c;
assign c[0] = cin;

genvar i;
generate
    for(i = 0; i < N; i = i + 1)
    begin 
	fa u1 (
            .a(a[i]),
            .b(b[i]),
            .cin(c[i]),
            .sum(sum[i]),
            .carry(c[i+1])
        );
    end
endgenerate

assign carry = c[N];

endmodule


module tb;
parameter N =12;
reg [N-1:0]a,b;
reg cin;
wire [N-1:0]sum;
wire carry;
param_full_adder #(.N(N)) dut(a,b,cin,sum,carry);
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


/*Parameterization is useful wherever the size, width, depth, or count may change. Common examples in Verilog/SystemVerilog are:

Multiplexers (2:1, 4:1, 8:1 …)
Demultiplexers
Encoders and priority encoders
Decoders
Adders (Ripple carry, Carry look-ahead, Carry save)
Subtractors
ALU
Comparators
Barrel shifters
Counters (mod-N counters)
Shift registers
Ring counters
Johnson counters
Registers/Register banks
Memory blocks (RAM/ROM/FIFO)
FIFO depth and width
Stack implementation
Parity generator/checker
CRC generator
LFSR
Magnitude comparator
MAC unit (Multiply-Accumulate)
Array multiplier
Wallace tree multiplier
Booth multiplier
Clock divider
PWM generator
UART transmitter/receiver
SPI controller
I2C controller
Timer modules
Synchronizers
Crossbar switches
Arbiter circuits
Pipeline stages
Cache memory structures
Matrix operations
Neural network accelerators
Systolic arrays

Typical things parameterized are:

Bus width
Number of stages
Number of inputs
Counter modulus
FIFO depth
Address width
Data width
Memory size
Pipeline depth
Number of processing elements */
