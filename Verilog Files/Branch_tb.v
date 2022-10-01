`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:53:59 11/10/2021
// Design Name:   Branch
// Module Name:   D:/RISC/KGP-RISC/Branch_tb.v
// Project Name:  KGP-RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Branch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Branch_tb;

	// Inputs
	reg carry;
	reg zero;
	reg sign;
	reg [1:0] flag;
	reg branch;
	reg branchType;
	reg brNotEq;

	// Outputs
	wire brType;

	// Instantiate the Unit Under Test (UUT)
	Branch uut (
		.carry(carry), 
		.zero(zero), 
		.sign(sign), 
		.flag(flag), 
		.branch(branch), 
		.branchType(branchType), 
		.brNotEq(brNotEq), 
		.brType(brType)
	);

	initial begin
		// Initialize Inputs
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 0;
		branch = 0;
		branchType = 0;
		brNotEq = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		carry = 1;
		zero = 0;
		sign = 0;
		flag = 2'b00;
		branch = 1;
		branchType = 1;
		brNotEq = 0;
        
		// Add stimulus here
		#10;
				
		carry = 0;
		zero = 1;
		sign = 0;
		flag = 2'b01;
		branch = 1;
		branchType = 1;
		brNotEq = 0;

      #10;
		
		carry = 0;
		zero = 0;
		sign = 1;
		flag = 2'b10;
		branch = 1;
		branchType = 1;
		brNotEq = 0;

      #10;
		
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 2'b00;
		branch = 1;
		branchType = 1;
		brNotEq = 1;

      #10;
   		
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 2'b01;
		branch = 1;
		branchType = 1;
		brNotEq = 1;

      #10;
		
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 2'b10;
		branch = 1;
		branchType = 1;
		brNotEq = 1;

      #10;
		
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 2'b00;
		branch = 0;
		branchType = 0;
		brNotEq = 1;

      #10;
		
		carry = 0;
		zero = 0;
		sign = 0;
		flag = 2'b00;
		branch = 1;
		branchType = 0;
		brNotEq = 0;


	end
      
endmodule

