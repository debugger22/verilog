`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:45 01/30/2014 
// Design Name: 
// Module Name:    multiplexer 
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
module multiplexer(compIn, compOut, op, op2);
	 input [7:0] compIn;
    input [7:0] compOut;
    input op;
    output reg [7:0] op2;
	 
	 always@(compIn,compOut,op)
		 begin
			if(op)
				begin
					op2 = compIn;
				end
			else
				begin
					op2 = compOut;
				end
		 end
		 

endmodule
