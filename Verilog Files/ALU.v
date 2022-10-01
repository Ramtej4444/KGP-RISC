`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ALU 
//////////////////////////////////////////////////////////////////////////////////
module ALU( input [3:0] ALUop, 
				input signed [31:0] x,
				input signed [31:0] y,
				input [5:0] shamt,
				output reg [31:0] out,
				output reg carryflag,
				output reg zflag,
				output reg signflag
			);
		


always@(*)
begin
	case(ALUop)
		4'b0000 : begin 	//Add
						{carryflag,out} = x + y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0001 : begin 	//Comp
						out = ~y+1'b1;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0010 : begin 	//And
						out = x & y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0011 : begin		//Xor
						out = x ^ y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0111 : begin		//shll
						out = x << shamt;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b1000 : begin		//shrl
						out = x >> shamt;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0100 : begin		//shllv
						out = x << y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0101 : begin		//shrlv
						out = x >> y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b1001 : begin		//shra
						out = x >>> shamt;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b0110 : begin 	//shrav
						out = x >>> y;
						zflag = 1'b0;
						signflag = 1'b0;
					end
		4'b1010 : begin    // output sign flag
		            signflag = x[31];
						out = 32'b00000000000000000000000000000000; 
						zflag = 1'b0;
					end
		4'b1011 : begin    // output zero flag
						out = 32'b00000000000000000000000000000000;
						zflag = (x == 32'b0)? 1'b1 : 1'b0;
						signflag = 1'b0;
					end
					
		default : begin 
						out = 32'b00000000000000000000000000000000;
		            zflag = 1'b0;
						signflag = 1'b0;
						carryflag = 1'b0;
					end
		endcase
end
	


endmodule