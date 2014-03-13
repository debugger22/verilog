`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:24 03/06/2014 
// Design Name: 
// Module Name:    lruCounterReplacement 
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
module lruCounterReplacement(
    input clk,
    input reset,
    input hit,
    input [1:0] lineIndex,
    output [1:0] lruLine
    );

	wire [1:0] cacheLine;
	wire [3:0] dectocnt;
	wire [1:0] cnt0tomux;
	wire [1:0] cnt1tomux;
	wire [1:0] cnt2tomux;
	wire [1:0] cnt3tomux;
	wire [1:0] refCount;
	wire [3:0] dcrFlag;
	wire [3:0] zeroFlag;
	//wire [1:0] lru;
	
	mux2to1 _mux2to1(lineIndex,lruLine,hit,cacheLine);
	decoder _decoder(cacheLine,dectocnt);
	counterReg2b counter0(clk, reset, dectocnt[0], dcrFlag[0] & ~dectocnt[0], cnt0tomux);
	counterReg2b counter1(clk, reset, dectocnt[1], dcrFlag[1] & ~dectocnt[1], cnt1tomux);
	counterReg2b counter2(clk, reset, dectocnt[2], dcrFlag[2] & ~dectocnt[2], cnt2tomux);
	counterReg2b counter3(clk, reset, dectocnt[3], dcrFlag[3] & ~dectocnt[3], cnt3tomux);
	mux4to1 _mux4to1(cnt0tomux,cnt1tomux,cnt2tomux,cnt3tomux,cacheLine, refCount);
	comparator _cmp0(cnt0tomux,refCount,dcrFlag[0],zeroFlag[0]);
	comparator _cmp1(cnt1tomux,refCount,dcrFlag[1],zeroFlag[1]);
	comparator _cmp2(cnt2tomux,refCount,dcrFlag[2],zeroFlag[2]);
	comparator _cmp3(cnt3tomux,refCount,dcrFlag[3],zeroFlag[3]);
	priorityEncoder _priorityEncoder(zeroFlag[0],zeroFlag[1],zeroFlag[2],zeroFlag[3],lruLine);
	//always@(*)
	//lruLine = lru;
endmodule
