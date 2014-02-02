`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:14 01/23/2014 
// Design Name: 
// Module Name:    D_FF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D_FF(clk, reset, d,q);
		output reg q;
		input wire clk, reset, d;
	 	always @(~clk)
			begin
				if(reset)
					begin
						q = 1'b0;
					end
				else
					begin
						q = d;
					end
			end
endmodule
