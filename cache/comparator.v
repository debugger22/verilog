`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:48 03/06/2014 
// Design Name: 
// Module Name:    comparator 
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
module comparator(
    input [1:0] cnt,
    input [1:0] refCnt,
    output reg decFlag,
    output reg zeroFlag
    );
	
	always@(cnt,refCnt)
		begin
			if(cnt>refCnt)decFlag = 1;
			else decFlag = 0;
			if(cnt==2'b00)	zeroFlag = 1;
			else zeroFlag=0;
		end

endmodule
