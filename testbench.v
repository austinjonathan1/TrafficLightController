`timescale 1ns / 1ps
module testbench;

	// Inputs
	reg clk_62;
	reg rst_62;
	reg i1_62;
	reg i2_62;
	reg b1_62;
	reg b2_62;
	reg b3_62;
	reg b4_62;

	// Outputs
	wire r1_62;
	wire y1_62;
	wire g1_62;
	wire r2_62;
	wire y2_62;
	wire g2_62;
	wire w1_62;
	wire w2_62;
	wire w3_62;
	wire w4_62;

	// Instantiate the Unit Under Test (UUT)
	labj uut (
		// Inputs
		.clk_62(clk_62),
		.rst_62(rst_62),
		.i1_62(i1_62),
		.i2_62(i2_62),
		.b1_62(b1_62),
		.b2_62(b2_62),
		.b3_62(b3_62),
		.b4_62(b4_62),
		// Outputs
		.r1_62(r1_62),
		.y1_62(y1_62),
		.g1_62(g1_62),
		.r2_62(r2_62),
		.y2_62(y2_62),
		.g2_62(g2_62),
		.w1_62(w1_62),
		.w2_62(w2_62),
		.w3_62(w3_62),
		.w4_62(w4_62)
	);
	// Initialize Inputs
	initial begin
		clk_62 = 0;
		rst_62 = 0;
		i1_62 = 0; i2_62 = 0; b1_62 = 0; b2_62 = 0; b3_62 = 0; b4_62 = 0;
		forever begin
			#20 clk_62 = ~clk_62;
		end
	end
	initial begin
		#20 rst_62 = 1;
		#30 rst_62 = 0;
		#40 i1_62 = 1; i2_62 = 0; b1_62 = 0; b2_62 = 1; b3_62 = 0; b4_62 = 0;
		#100 i1_62 = 0; i2_62 = 1; b1_62 = 0; b2_62 = 1; b3_62 = 0; b4_62 = 1;
		#130 i1_62 = 1; i2_62 = 0; b1_62 = 0; b2_62 = 1; b3_62 = 0; b4_62 = 1;
		#140 i1_62 = 0; i2_62 = 0; b1_62 = 1; b2_62 = 0; b3_62 = 0; b4_62 = 0;
		#180 i1_62 = 0; i2_62 = 1; b1_62 = 1; b2_62 = 0; b3_62 = 1; b4_62 = 0;
		$finish;
	end
endmodule
