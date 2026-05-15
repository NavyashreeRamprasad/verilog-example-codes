module tb;
reg [3:0] a = 4'b1000;
reg [3:0]b = 4'b1101;
reg [3:0]c;

initial 
begin
c=a&b;
$display("a= %0b , b=%0b ,(a&b) c=%0b ",a,b,c);
c=a|b;
$display("a= %0b , b=%0b , (a|b) c=%0b ",a,b,c);
c=~a;
$display("a= %0b , b=%0b , (~a) c=%0b ",a,b,c);
c=a^b;
$display("a= %0b , b=%0b , (a^b) c=%0b ",a,b,c);
c=a~^b;
$display("a= %0b , b=%0b , (a~^b) c=%0b ",a,b,c);

end

endmodule
