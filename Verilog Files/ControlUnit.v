`timescale 1ns / 1ps


module ControlUnit( input [5:0] opcode,
						  input [9:0] functioncode,
						  output reg branchType,
						  output reg [1:0] extendType,
						  output reg memWrite,
						  output reg [3:0] ALUop,
						  output reg memToReg,
						  output reg ALUsrc,
						  output reg memRead,
						  output reg regwrite,
						  output reg brNotEq,
						  output reg branch,
						  output reg goToReg,
						  output reg [1:0] destReg, 
						  output reg [1:0] flag			  
    );


always @(*) begin
   
	case(opcode)
	 6'b000000:	begin
				branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b1;
				brNotEq    = 1'b0;
				branch     = 1'b0;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b00;
				destReg    = 2'b00;
			
			case(functioncode)
				10'b0000000000: begin        // Addition operation 
						            ALUop      = 4'b0000;
						            ALUsrc     = 1'b0;	
									 end
				
				10'b0000000001: begin        // 2's compliment operation 
						            ALUop      = 4'b0001;
						            ALUsrc     = 1'b0;										
									 end
									 
				10'b0000000010: begin        // XOR operation 
						            ALUop      = 4'b0010;
						            ALUsrc     = 1'b0;									
									 end
									 
				10'b0000000011: begin        // AND compliment operation
						            ALUop      = 4'b0011;
						            ALUsrc     = 1'b0;										
									 end
									 
				10'b0000000110: begin        // shllv 
						            ALUop      = 4'b0100;
						            ALUsrc     = 1'b0;									
									 end
									 
				10'b0000000111: begin        // shrlv 
						            ALUop      = 4'b0101;
						            ALUsrc     = 1'b0;										
									 end
									 
            10'b0000001001: begin        // shrav 
						            ALUop      = 4'b0110;
						            ALUsrc     = 1'b0;										
									 end	

				10'b0000000100: begin        // shll 
						            ALUop      = 4'b0111;
						            ALUsrc     = 1'b0;										
									 end
									 
				10'b0000000101: begin        // shrl
						            ALUop      = 4'b1000;
						            ALUsrc     = 1'b0;										
									 end
				
				10'b0000001000: begin        // shra
						            ALUop      = 4'b1001;
						            ALUsrc     = 1'b0;									
									 end
						default: begin        // shra
						            ALUop      = 4'b0000;
						            ALUsrc     = 1'b0;									
									 end
				endcase
			end					 
									 
	   

	 6'b000011: begin       // addi
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b1;
				brNotEq    = 1'b0;
				branch     = 1'b0;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b00;
				destReg    = 2'b00;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;				
	 end
	 
	 6'b000100: begin     // compi
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b1;
				brNotEq    = 1'b0;
				branch     = 1'b0;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b00;
				destReg    = 2'b00;
            ALUop      = 4'b0001;
				ALUsrc     = 1'b1;				
	 end
	
	 6'b000001: begin     // Load Word
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b1;
				memRead    = 1'b1;
				regwrite   = 1'b1;
				brNotEq    = 1'b0;
				branch     = 1'b0;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b00;
				destReg    = 2'b01;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;				
	 end
	 
	 6'b000010: begin     // Store Word
	         branchType = 1'b0;
				memWrite   = 2'b1;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b0;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b00;
				destReg    = 2'b00;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;				
	 end
	 
	 6'b000101: begin     // b L instruction
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b10;
				destReg    = 2'b00;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;					
	 end
	 
	 6'b000110: begin     // bl L instruction
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b10;
				destReg    = 2'b10;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;					
	 end
	 
	 6'b000111: begin     // bcy L instruction
	         branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b10;
				destReg    = 2'b00;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;					
	 end
	 
	 6'b001000: begin     // bncy L instruction
	         branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b1;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b00;
				extendType = 2'b10;
				destReg    = 2'b10;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;					
	 end
	 
	 6'b001001: begin     // br rs instruction
	         branchType = 1'b0;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b1;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b1;
				flag	     = 2'b00;
				extendType = 2'b01;
				destReg    = 2'b00;
            ALUop      = 4'b0000;
				ALUsrc     = 1'b1;					
	 end
	 
	 6'b001010: begin     // bltz rs, L instruction
	         branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b10;
				extendType = 2'b01;
				destReg    = 2'b10;
            ALUop      = 4'b1010;
				ALUsrc     = 1'b0;					
	 end
	 
	 6'b001011: begin     // bz rs, L instruction
	         branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b0;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b01;
				extendType = 2'b01;
				destReg    = 2'b10;
            ALUop      = 4'b1011;
				ALUsrc     = 1'b0;					
	 end
	 
	 6'b001011: begin     // bnz rs, L instruction
	         branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b1;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b01;
				extendType = 2'b01;
				destReg    = 2'b10;
            ALUop      = 4'b1011;
				ALUsrc     = 1'b0;					
	 end
	 default: begin
				branchType = 1'b1;
				memWrite   = 2'b0;
				memToReg   = 1'b0;
				memRead    = 1'b0;
				regwrite   = 1'b0;
				brNotEq    = 1'b1;
				branch     = 1'b1;
				goToReg    = 1'b0;
				flag	     = 2'b01;
				extendType = 2'b01;
				destReg    = 2'b10;
            ALUop      = 4'b1011;
				ALUsrc     = 1'b0;	
	 end

	endcase

end

endmodule
