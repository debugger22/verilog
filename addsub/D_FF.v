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
module D_FF(input clk, input reset, input regWrite, input d, input decOut1b, output reg q);
	always @ (negedge clk)
	begin
		if(reset==1)
			q=0;
		else
			if(regWrite == 1 && decOut1b==1)
			begin
				q=d;
			end
		end
endmodule
