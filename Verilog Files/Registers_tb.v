`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:15:25 11/14/2021
// Design Name:   Registers
// Module Name:   D:/RISC/KGP-RISC/Registers_tb.v
// Project Name:  KGP-RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Registers_tb;

	// Inputs
	reg reset;
	reg [4:0] readreg1;
	reg [4:0] readreg2;
	reg [4:0] writereg;
	reg [31:0] writedata;
	reg regwrite;
	reg clk;

	// Outputs
	wire [31:0] readdata1;
	wire [31:0] readdata2;
	wire [31:0] result_reg;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.reset(reset), 
		.readreg1(readreg1), 
		.readreg2(readreg2), 
		.writereg(writereg), 
		.writedata(writedata), 
		.regwrite(regwrite), 
		.clk(clk), 
		.readdata1(readdata1), 
		.readdata2(readdata2), 
		.result_reg(result_reg)
	);
   
	
   initial begin
		clk = 0;
      forever begin
       #5 clk = ~clk;
       end
	end
	
		
	initial begin
		// Initialize Inputs
		reset = 1;
		readreg1 = 0;
		readreg2 = 0;
		writereg = 0;
		writedata = 0;
		regwrite = 0;

		#20;
       reset = 0;
		 regwrite = 1'b1;
		#10;
		writereg = 5'b00000;
		writedata = 25;
		#10;
		writereg = 5'b00010;
		writedata = 55;
		#10;
		writereg = 5'b01010;
		writedata = 100;
		#10;
		
		regwrite = 0'b0;
		readreg1 = 5'b00000;
		readreg2 = 5'b01010;
         
	end
      
endmodule

