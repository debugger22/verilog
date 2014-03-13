`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:02 01/23/2014 
// Design Name: 
// Module Name:    reg8bit 
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
module reg8bit( clk, reset, inData,outData);
    input wire clk;
    input wire reset;
    input [7:0] inData;
    output [7:0] outData;
	
	D_FF ff0 (clk,reset,inData[0],outData[0]);
	D_FF ff1 (clk,reset,inData[1],outData[1]);
	D_FF ff2 (clk,reset,inData[2],outData[2]);
	D_FF ff3 (clk,reset,inData[3],outData[3]);
	D_FF ff4 (clk,reset,inData[4],outData[4]);
	D_FF ff5 (clk,reset,inData[5],outData[5]);
	D_FF ff6 (clk,reset,inData[6],outData[6]);
	D_FF ff7 (clk,reset,inData[7],outData[7]);
	

endmodule
