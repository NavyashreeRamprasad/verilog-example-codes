module power_calc;

    integer num1, num2;
    integer result;

    initial begin
        if (!$value$plusargs("num1=%d", num1)) begin
            $display("num1 not provided");
            $finish;
        end

        if (!$value$plusargs("num2=%d", num2)) begin
            $display("num2 not provided");
            $finish;
        end

        result = num1 ** num2;

        $display("num1 = %0d, num2 = %0d", num1, num2);
        $display("Result (num1**num2) = %0d", result);
    end

endmodule


module division_demo;

    integer a = 100;
    integer b = 3;

    integer int_result;
    real real_result;

    initial begin
        int_result  = a / b;          // Integer division
        real_result = a / (b * 1.0);  // Real division

        $display("Integer Division (100/3) = %0d", int_result);
        $display("Real Division (100/3)    = %0f", real_result);
    end

endmodule
