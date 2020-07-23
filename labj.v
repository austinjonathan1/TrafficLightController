`timescale 1ns / 1ps
module labj(clk_62, rst_62, i1_62, i2_62, b1_62, b2_62, b3_62, b4_62, r1_62, y1_62, g1_62, r2_62, y2_62, g2_62, w1_62, w2_62, w3_62, w4_62);
	input clk_62, rst_62, i1_62, i2_62, b1_62, b2_62, b3_62, b4_62;
	output reg r1_62, y1_62, g1_62, r2_62, y2_62, g2_62, w1_62, w2_62, w3_62, w4_62;
/*Declaration of inputs and outputs. clk, rst, i1 and i2 are inputs
and outputs which represent lights are r1,y1,g1,r2,y2,g2. clk is your
input clock, rst is reset to your circuit, which will help in
providing initial state.
PS and NS are Present state and Next state of the circuit. The values
to next state (NS) are assigned by determining the present state and
values of inputs i1 and i2 as per logic shown below*/
	reg [1:0] PS, NS;
	always@(*) begin
		case(PS)
			//main street car driving
			2'b00: begin
				//main street lights
				g1_62 = 1;
				r1_62 = 0;
				y1_62 = 0;
				//side street lights
				g2_62 = 0;
				r2_62 = 1;
				y2_62 = 0;
				//walking lights
				w1_62 = 0;
				w2_62 = 0;
				w3_62 = 0;
				w4_62 = 0;
				//west-east person walking
				if((b1_62 == 1)|(b3_62 == 1)) begin
					w2_62 = 1;
					w4_62 = 1;
				end
				//side street car waiting
				if(i2_62 == 1) NS = 2'b01;
				//north-south person waiting
				else if ((i1_62 == 0)&((b2_62 == 1)|(b4_62 == 1))) NS = 2'b01;
				//keep lights same
				else NS = PS;
			end
			//main street slowing down
			2'b01: begin
				//main street lights
				g1_62 = 0;
				r1_62 = 0;
				y1_62 = 1;
				//side street lights
				g2_62 = 0;
				r2_62 = 1;
				y2_62 = 0;
				//walking lights
				w1_62 = 0;
				w2_62 = 0;
				w3_62 = 0;
				w4_62 = 0;
				NS = 2'b10;
			end
			//side street car driving
			2'b10: begin
				//main street lights
				g1_62 = 0;
				r1_62 = 1;
				y1_62 = 0;
				//side street lights
				g2_62 = 1;
				r2_62 = 0;
				y2_62 = 0;
				//walking lights
				w1_62 = 0;
				w2_62 = 0;
				w3_62 = 0;
				w4_62 = 0;
				//north-south person walking
				if((b2_62 == 1)|(b4_62 == 1)) begin
					w1_62 = 1;
					w3_62 = 1;
				end
				//main street car waiting
				if(i1_62 == 1) NS = 2'b11;
				//west-east person waiting
				else if ((i2_62 == 0)&((b1_62 == 1)|(b3_62 == 1))) NS = 2'b11;
				//keep lights same
				else NS = PS;
			end
			//side street slowing down
			2'b11: begin
				//main street lights
				g1_62 = 0;
				r1_62 = 1;
				y1_62 = 0;
				//side street lights
				g2_62 = 0;
				r2_62 = 0;
				y2_62 = 1;
				//walking lights
				w1_62 = 0;
				w2_62 = 0;
				w3_62 = 0;
				w4_62 = 0;
				NS = 2'b00;
			end
		endcase
	end
/* We need to transfer the nextstate decided above, to the present
state on posedge of every clock, and also, provide an initial state
for circuit to start with. Logic for the same is as below*/
	always@(posedge clk_62 or posedge rst_62) begin
		if(rst_62) begin
			PS <= 0;
		end
		else begin
			PS <= NS;
		end
	end
endmodule
