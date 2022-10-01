`timescale 1ns / 1ps


module Registers(   input reset,
                    input [4:0] readreg1, 
                    input [4:0] readreg2, 
						  input [4:0] writereg, 
						  input [31:0] writedata,  
						  input regwrite, 
						  input clk,
						  output reg [31:0] readdata1, 
						  output reg [31:0] readdata2,
						  output reg [31:0] result_reg					  
			
						);
	
		reg [31:0] registers [31:0];
		
	     
		always @(posedge clk) begin
		   if (reset)
			begin
				registers[0] <= 0;
				registers[1] <= 0;
				registers[2] <= 0;
				registers[3] <= 0;
				registers[4] <= 0;
				registers[5] <= 0;
				registers[6] <= 0;
				registers[7] <= 0;
				registers[8] <= 0;
				registers[9] <= 0;
				registers[10] <= 0;
				registers[11] <= 0;
				registers[12] <= 0;
				registers[13] <= 0;
				registers[14] <= 0;
				registers[15] <= 0;
				registers[16] <= 0;
				registers[17] <= 0;
				registers[18] <= 0;
				registers[19] <= 0;
				registers[20] <= 0;
				registers[21] <= 0;
				registers[22] <= 0;
				registers[23] <= 0;
				registers[24] <= 0;
				registers[25] <= 0;
				registers[26] <= 0;
				registers[27] <= 0;
				registers[28] <= 0;
				registers[29] <= 0;
				registers[30] <= 0;
				registers[31] <= 0;
			
			end
		
			else 
			begin
				#2;		
				readdata1 <= registers[readreg1];
				readdata2 <= registers[readreg2];
				result_reg <= registers[2];
				if(regwrite)
				begin
					#5;
					registers[writereg] <= writedata;
				end
				
			end
		
		end	

endmodule
