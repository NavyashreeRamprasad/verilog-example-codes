module ADDR_GEN (input i1,i2,i3,output o1,o2,o3);
endmodule

module TIMING_CTRL(input i1,i2,i3,i4,output o1,o2,o3,o4);
endmodule

module DATA_GEN(input i1,i2,output o1,o2,o3);
endmodule

module MEM_CTRL(input p1,p2,p3,p4,p5, output q1,q2,q3,q4,q5,q6);
wire n1,n2,n3,n4;

//connection using name
ADDR_GEN u1(.i1(p1),.i2(p2),.i3(n3),.o1(q1),.o2(n1),.o3(n2));

DATA_GEN u2(.i1(p3),.i2(p4),.o1(n3),.o2(q6),.o3(n4));

TIMING_CTRL u3(.i1(n1),.i2(n2),.i3(n4),.i4(p5),.o1(q2),.o2(q4),.o3(q3),.o4(q5));

//connection by position

ADDR_GEN u1(p1,p2,n3,q1,n1,n2);

DATA_GEN u2(p3,p4,n3,q6,n4);

TIMING_CTRL u3(n1,n2,n4,p5,q2,q4,q3,q5);

endmodule


d) Connection by name is preferred because the ports are connected explicitly using port names.
	->Easier to read and understand
	->Reduces chances of wrong connections
	->Safer when module port order changes
	->Better for large modules having many ports
	->Easier debugging and maintenance
	->Improves code reliability

e) Default connection refers to Verilog automatically creating an undeclared net as a 1-bit wire if it is used without declaration
	->Example: assign y = a & b;
	If y is not declared, Verilog automatically assumes:
	wire y;
	This is called an implicit or default net connection.
	->Similarly, in module instantiation:
	my_module u1(.*);
	.* is also called default port connection, where signals having the same names as module ports are connected automatically.
