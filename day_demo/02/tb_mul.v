`timescale 1ns / 1ns

module tb_mul;
	reg	 [7:0]	 mula,
				 mulb;
	reg 		 clk,
				 reset;
	wire [15:0]	 result;

	multiplier m(mula, mulb, clk, reset, result);
	initial begin
		reset = 0;
		clk = 0;
		#5 reset = 1;
		#5 mula = 8'b0011_1100;
		   mulb = 8'b0000_0000; 
		#5 mula = 8'b0000_0000;
		   mulb = 8'b1100_0011;//对某一乘数是0的情况进行测试
		#5 mula = 8'b0011_1100;
		   mulb = 8'b0000_1101;//常规测试
		#5 mula = 8'b1111_1111;
		   mulb = 8'b1111_1111;//2个乘数均为最大值的情况下的测试
	end

	initial begin
		#1000;
		$finish;
	end

	always begin
		#1 clk = ~clk;
	end
	
	initial begin
		// $shm_open("multiplier_test.shm");
		// $shm_probe("AC");
		$dumpfile("wave.vcd");
		$dumpvars(0, tb_mul);
	end

endmodule

