module tb;
reg [15:0] data = 16'b0110001110010011;

initial begin 
 $display("first value of data = %0b ",data);
 data = (data & 16'hFF0F) | 16'h00F0;
 $display("masked value of data = %0b ",data);
 end
endmodule
