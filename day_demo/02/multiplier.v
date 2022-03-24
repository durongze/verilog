`timescale 1ps / 1ps

module multiplier
	(
		input		[7:0]		mula,
		input		[7:0]		mulb,
		input					clk,
		input					reset,
		output reg  [15:0]		result
		// output		[15:0]		temp
	);
	wire			[15:0]		sto0,
								sto1,
								sto2,
								sto3,
								sto4,
								sto5,
								sto6,
								sto7;
	
	assign sto0 = mulb[0]? mula : 16'd0;
	assign sto1 = mulb[1]? (mula << 1) : 16'd0;
	assign sto2 = mulb[2]? (mula << 2) : 16'd0;
	assign sto3 = mulb[3]? (mula << 3) : 16'd0;
	assign sto4 = mulb[4]? (mula << 4) : 16'd0;
	assign sto5 = mulb[5]? (mula << 5) : 16'd0;
	assign sto6 = mulb[6]? (mula << 6) : 16'd0;
	assign sto7 = mulb[7]? (mula << 7) : 16'd0;

	always@(posedge clk or negedge reset)
	begin
		if (!reset)begin
			result <= 16'd0;
	 	end
		else begin
	  		result <= sto0 + sto1 + sto2 + sto3 + sto4 + sto5 + sto6 + sto7;
	    end
	end
	  
endmodule
