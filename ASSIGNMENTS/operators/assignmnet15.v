// 4:1 Multiplexer using Conditional Operator
module mux4to1 (
    input [3:0] in,
    input [1:0] sel,
    output out
);
    assign out = (sel == 2'b00) ? in[0] :
                 (sel == 2'b01) ? in[1] :
                 (sel == 2'b10) ? in[2] : in[3];
endmodule

// 8:1 Multiplexer using Conditional Operator
module mux8to1 (
    input [7:0] in,
    input [2:0] sel,
    output out
);
    assign out = (sel == 3'b000) ? in[0] :
                 (sel == 3'b001) ? in[1] :
                 (sel == 3'b010) ? in[2] :
                 (sel == 3'b011) ? in[3] :
                 (sel == 3'b100) ? in[4] :
                 (sel == 3'b101) ? in[5] :
                 (sel == 3'b110) ? in[6] : in[7];
endmodule


//4:1 mux tb
module tb_mux4to1;
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    // Instantiate the 4:1 Mux
    mux4to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("--- Starting 4:1 Mux Randomized Test ---");
        $display("Time | Input | Sel | Out | Expected");
        
        repeat (10) begin
            in  = $random; // Truncated to 4 bits
            sel = $random; // Truncated to 2 bits
            
            #10; // Delay for combinational logic
            
            $display("%4t | %b  | %b  |  %b  |    %b", 
                     $time, in, sel, out, in[sel]);
        end
        $finish;
    end
endmodule


//8:1 mux tb

module tb_mux8to1;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the 8:1 Mux
    mux8to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("--- Starting 8:1 Mux Randomized Test ---");
        $display("Time |   Input  | Sel | Out | Expected");
        
        repeat (10) begin
            in  = $random; // Truncated to 8 bits
            sel = $random; // Truncated to 3 bits
            
            #10;
            
            $display("%4t | %b | %b |  %b  |    %b", 
                     $time, in, sel, out, in[sel]);
        end
        $finish;
    end
endmodule
