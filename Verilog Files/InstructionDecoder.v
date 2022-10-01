`timescale 1ns / 1ps


module InstructionDecoder( input [31:0] instruction,
									output [31:26] opcode,
									output [9:0] functioncode,
									output [25:0] toSignExtend,
									output [4:0] reg1,
									output [4:0] reg2,
									output [5:0] shamt
    );

assign opcode = instruction[31:26];
assign functioncode = instruction[9:0];
assign toSignExtend  = instruction[25:0];
assign reg1 = instruction[25:21];
assign reg2 = instruction[20:16];
assign shamt = instruction[15:10];

endmodule
