`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:50 04/10/2014 
// Design Name: 
// Module Name:    IS2012C6PS470G 
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


//D Flip flop

module D_FF(input clk,input reset,input regWrite,input decOut,input d,output reg q);
	always @ (negedge clk)
	begin
		if(reset==1)
			q=0;
		else
			if(regWrite == 1 && decOut==1)
			begin
				q=d;
			end
	end
endmodule


/*
	module IR
*/
module IR(input clk,input reset,input [15:0] InstructionIn,output reg [15:0] InstructionOut);

	always@(negedge clk)
	begin
		if(reset == 1) InstructionOut = 16'b0;
		else InstructionOut = InstructionIn;
	end

endmodule


/*
	Control Unit
*/
module controlUnit(input [2:0] opcode,output reg regDst,output reg regWrite,output reg [1:0] aluSrc,output reg [1:0] aluOp);

	always@(*)
	begin
		if(opcode == 3'b000)
			begin
				regDst = 1;
				regWrite = 1;
				aluSrc = 0;
				aluOp = 0;
			end
		else if(opcode == 3'b001)
			begin
				regDst = 1;
				regWrite = 1;
				aluSrc = 0;
				aluOp = 1;
			end
		else if(opcode == 3'b010)
			begin
				regDst = 0;
				regWrite = 1;
				aluSrc = 1;
				aluOp = 0;
			end
		else if(opcode == 3'b011)
			begin
				regDst = 0;
				regWrite = 1;
				aluSrc = 2;
				aluOp = 2;
			end
		else if(opcode == 3'b100)
			begin
				regDst = 0;
				regWrite = 1;
				aluSrc = 2;
				aluOp = 3;
			end
	end
endmodule


/*
	RegFile
*/
module regFile(input clk,input reset,input [2:0] rs,input [2:0] rt,input [2:0] destinationRegister,input regWrite,input [7:0] writeData,output [7:0] regRs,output [7:0] regRt);
	wire [7:0] decOut;
	
	wire [7:0] regOut0;
	wire [7:0] regOut1;
	wire [7:0] regOut2;
	wire [7:0] regOut3;
	wire [7:0] regOut4;
	wire [7:0] regOut5;
	wire [7:0] regOut6;
	wire [7:0] regOut7;
	
	
	decoder3to8 dec3to8(destinationRegister, decOut);
	
	reg8bits reg0(clk, reset, regWrite, decOut[0], writeData, regOut0);
	reg8bits reg1(clk, reset, regWrite, decOut[1], writeData, regOut1);
	reg8bits reg2(clk, reset, regWrite, decOut[2], writeData, regOut2);
	reg8bits reg3(clk, reset, regWrite, decOut[3], writeData, regOut3);
	reg8bits reg4(clk, reset, regWrite, decOut[4], writeData, regOut4);
	reg8bits reg5(clk, reset, regWrite, decOut[5], writeData, regOut5);
	reg8bits reg6(clk, reset, regWrite, decOut[6], writeData, regOut6);
	reg8bits reg7(clk, reset, regWrite, decOut[7], writeData, regOut7);
	
	mux8to1 mto1_1(regOut0, regOut1, regOut2, regOut3, regOut4, regOut5, regOut6, regOut7, rs, regRs);
	mux8to1 mto1_2(regOut0, regOut1, regOut2, regOut3, regOut4, regOut5, regOut6, regOut7, rt, regRt);
	
endmodule


/*
	3 to 8 Decoder
*/
module decoder3to8(input [2:0] decIn,output reg [7:0] decOut);

	always@(*)
	begin
		decOut = 0;
		case(decIn)
			3'd0 : decOut = 8'h001;
			3'd1 : decOut = 8'h002;
			3'd2 : decOut = 8'h004;
			3'd3 : decOut = 8'h005;
			3'd4 : decOut = 8'h010;
			3'd5 : decOut = 8'h020;
			3'd6 : decOut = 8'h040;
			3'd7 : decOut = 8'h080;
		endcase
	end
endmodule


/*
	8Bit Register
*/
module reg8bits(input clk,input reset,input regWrite,input decOut,input [7:0] regIn,output [7:0] regOut);

	D_FF dff0(clk, reset, regWrite, decOut, regIn[0], regOut[0]);
	D_FF dff1(clk, reset, regWrite, decOut, regIn[1], regOut[1]);
	D_FF dff2(clk, reset, regWrite, decOut, regIn[2], regOut[2]);
	D_FF dff3(clk, reset, regWrite, decOut, regIn[3], regOut[3]);
	D_FF dff4(clk, reset, regWrite, decOut, regIn[4], regOut[4]);
	D_FF dff5(clk, reset, regWrite, decOut, regIn[5], regOut[5]);
	D_FF dff6(clk, reset, regWrite, decOut, regIn[6], regOut[6]);
	D_FF dff7(clk, reset, regWrite, decOut, regIn[7], regOut[7]);
	
endmodule


/*
	8to1 Mux
*/
module mux8to1(input [7:0] regOut0,input [7:0] regOut1,input [7:0] regOut2,input [7:0] regOut3,input [7:0] regOut4,input [7:0] regOut5,input [7:0] regOut6,input [7:0] regOut7,input [2:0] sel,output reg [7:0] outBus);
always @ (*)
		begin
		outBus = 0;
			case (sel)
				3'h0 : outBus = regOut0;
				3'h1 : outBus = regOut1;
				3'h2 : outBus = regOut2;
				3'h3 : outBus = regOut3;
				3'h4 : outBus = regOut4;
				3'h5 : outBus = regOut5;
				3'h6 : outBus = regOut6;
				3'h7 : outBus = regOut7;
			endcase
		end
endmodule


/*
	sExt
*/
module sExt(input [5:0] instr5_0,output reg [7:0] sExt);

	always@(*)
	begin
		sExt[5:0] = instr5_0;
		sExt[6] = instr5_0[5];
		sExt[7] = instr5_0[5];
	end

endmodule


/*
	zExt
*/
module zExt(input [5:0] instr5_0,output reg [7:0] zExt);

	always@(*)
	begin
		zExt[5:0] = instr5_0;
		zExt[6] = 0;
		zExt[7] = 0;
	end

endmodule


/*
	2to1 Mux
*/
module mux2to1(input [2:0] rt,input [2:0] rd,input regDst,output reg [2:0] destinationReg);

	always@(rt, rd, regDst)
	begin
		if(regDst == 0)destinationReg = rt;
		else if(regDst == 1)destinationReg = rd;
	end

endmodule


/*
	4to1 Mux
*/
module mux4to1(input [7:0] regRt,input [7:0] sExt,input [7:0] zExt,input [1:0] aluSrc,output reg [7:0] aluIn2);

	always@(regRt, sExt, zExt, aluSrc)
	begin
		if(aluSrc == 2'b00) aluIn2 = regRt;
		else if(aluSrc == 2'b01) aluIn2 = sExt;
		else if(aluSrc == 2'b10) aluIn2 = zExt;
	end
endmodule


/*
	ALU
*/
module alu( input [7:0] aluIn1,input [7:0] aluIn2,input [1:0] aluOp, output reg [7:0] aluOut);

	always@(*)
	begin
		if(aluOp == 0)aluOut = aluIn1 + aluIn2;
		else if(aluOp == 1)aluOut = aluIn1 - aluIn2;
		else if(aluOp == 2)aluOut = aluIn1 & aluIn2;
		else if(aluOp == 3)aluOut = aluIn1 | aluIn2;
	end

endmodule


/*
	Instruction Processing
*/
module instructionProcessing(input clk,input reset,input [15:0] instruction,output [7:0] aluOut);
	
	wire [15:0] IROut;
	
	wire regDst;
	wire regWrite;
	wire [1:0] aluSrc;
	wire [1:0] aluOp;
	
	wire [2:0] m2to1out;
	
	wire [7:0] sextout;
	wire [7:0] zextout;
	
	wire [7:0] regRs;
	wire [7:0] regRt;
	
	wire [7:0] aluIn2;
	
	IR ir(clk, reset, instruction, IROut);
	controlUnit cu(IROut[15:13], regDst, regWrite, aluSrc, aluOp);
	mux2to1 m2to1(IROut[9:7], IROut[6:4], regDst, m2to1out);
	
	sExt sext(IROut[5:0], sextout);
	zExt zext(IROut[5:0], zextout);
	
	regFile regfile(clk, reset, IROut[12:10], IROut[9:7], m2to1out, regWrite, aluOut, regRs, regRt);
	
	mux4to1 m4to1(regRt, sextout, zextout, aluSrc, aluIn2);
	
	alu _alu(regRs, aluIn2, aluOp, aluOut);
	
endmodule



/*
	TestBench
*/
module testBench();
// Inputs
reg clk;
reg reset;
reg [15:0] instruction;

// Outputs
wire [7:0] aluOut;
// Instantiate the Unit Under Test (UUT)
instructionProcessing uut (
	.clk(clk),
	.reset(reset),
	.instruction(instruction),
	.aluOut(aluOut)
);

always
	#5 clk = ~clk;
	initial begin

	//$monitor(" instruction %h aluOut %d", instruction,aluOut);
	$monitor("aluOut %d",aluOut);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	instruction = 0;
	#5
	reset = 0;
	instruction = 16'h4006; //R0<- 6
	#10
	instruction = 16'h40BF; //R1<- 5
	#10
	instruction = 16'h8904; //R2<- 4
	#10
	instruction = 16'h8BBF; //R7<- 63 <-0011 1111
	#10
	instruction = 16'h20D0; //R5 <- 1
	#10
	instruction = 16'h16C0; //R4 <- 2
	#10
	instruction = 16'h6183; //R3 <- 2

	#10
	instruction = 16'h4D81; //R3 <- 3
	#10
	instruction = 16'h7F3B; //R6 <- 59 <- 0011 1011
	#20;
	$finish;
end

endmodule
