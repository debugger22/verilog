`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:34 01/30/2014 
// Design Name: 
// Module Name:    adder 
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
module adder(op1,op2,result,ofFlag);
    input [7:0] op1;
    input [7:0] op2;
    output reg [7:0] result;
    output reg ofFlag;

	always@(op1,op2)
		begin
			{ofFlag,result} = op1 + op2;
			
			if(result[7]==!op1[7] && op1[7]==op2[7])
				begin
					ofFlag =  1'b1;
				end
			else
				begin
					ofFlag = 1'b0;
				end
		end

endmodule
