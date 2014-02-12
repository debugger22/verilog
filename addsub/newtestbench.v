`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:36 02/06/2014 
// Design Name: 
// Module Name:    newtestbench 
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
module newtestbench(
    );
	
	reg clk;
	reg reset;
	reg regWrite;
	reg [3:0] srcRegA;
	reg [3:0] srcRegB;
	reg [3:0] destReg;
	reg [15:0] writeData;
	wire [15:0] outBusA;
	wire [15:0] outBusB;
	
	registerFile uut (
		.clk(clk),
		.reset(reset),
		.regWrite(regWrite),
		.srcRegA(srcRegA),
		.srcRegB(srcRegB),
		.destReg(destReg),
		.writeData(writeData),
		.outBusA(outBusA),
		.outBusB(outBusB)
	);

	always
		#5 clk = ~clk;
		initial begin
			clk = 0;
			reset = 1;
			regWrite = 0;
			srcRegA = 0;
			srcRegB = 0;
			writeData = 0;
			destReg = 0;
			
			#5;
			regWrite = 1;
			reset = 0;
			destReg = 2;
			writeData = 2;
			#10;
			destReg = 4;
			writeData = 4;
			#10;
			destReg = 6;
			writeData = 6;
			#10;
			destReg = 8;
			writeData = 8;
			
			#10;
			regWrite = 0;
			srcRegA = 1;
			srcRegB = 2;
			
			#10
			srcRegA = 3;
			srcRegB = 4;
			
			#10;
			srcRegA = 5;
			srcRegB = 6;
			
			#10;
			srcRegA = 7;
			srcRegB = 8;
			
			
			#100;
			
			
		$finish;
		end

endmodule
