`timescale 1ns / 1ps


module Processor( input clk,
						input reset,
						output [31:0] result						
                  );
	 	 
	 
wire [31:0] pc_to_instr; // PC output <> instr mem input 
wire [31:0] instr_to_decoder; // instr memory output <> decoder output

/// Instruction Decoder output signals 
wire [4:0] reg1; // reg 1
wire [4:0] reg2; // reg 1
wire [25:0] to_signextend; // sign extend input
wire [5:0] opcode; // control unit input
wire [9:0] functioncode;
wire [5:0] shamt;

// Regiser module outputs
wire [31:0] out_reg1; 
wire [31:0] out_reg2;

// SignExtend Moduel outputs
wire [31:0] signextended;


/// ALU output signals
wire carryflag;
wire zflag;
wire signflag;
wire [31:0] ALUresult;

//// Control Signals
wire branchType;
wire [1:0] extendType;
wire memWrite;
wire [3:0] ALUop;
wire memToReg;
wire ALUsrc;
wire memRead;
wire regwrite;
wire brNotEq;
wire branch;
wire goToReg;
wire [1:0]destReg;
wire [1:0]flag;


// Register Module inputs
wire [4:0] writeReg;
wire [31:0] writeData;
//wire [31:0] branchtype;

// Program Counter logic outputs
wire [31:0] pc_plus_4;
wire [31:0] next_pc;


// Intermediate signals 

wire [31:0] aluInput2;
wire [31:0] label_address;
wire [31:0] temp_pc;
wire [31:0] memOut;
wire [31:0] toReg;




reg slowclk1;
reg slowclk2;
parameter  four = 32'b00000000000000000000000000000100;
initial begin
	slowclk1 = 0;
	slowclk2 = 0;
end
always @(clk) begin
	#1;
	slowclk1 = clk;
	#3;
	slowclk2 = clk;
end


////// MUX modules

MUX_2_1 mux_ALUsrc(.in_0(out_reg2), .in_1(signextended), .res(ALUsrc), .out(aluInput2));

MUX_2_1 mux_branch_logic(.in_0(pc_plus_4), .in_1(label_address), .res(brType), .out(temp_pc));

MUX_2_1 mux_next_pc (.in_0(temp_pc), .in_1(signextended), .res(goToReg), .out(next_pc));

MUX_2_1 mux_memToReg (.in_0(ALUresult), .in_1(memOut), .res(memToReg), .out(toReg));

MUX_2_1 mux_writeData(.in_0(toReg), .in_1(pc_plus_4), .res(branch), .out(writeData));


MUX_4_1_5bit mux_destReg(.in_0(reg1), .in_1(reg2), .in_2(5'b11111), .in_3(5'b00000), .flag(destReg), .out(writeReg));

/////// ADD ALUs

ADD pc_plus_four( .in_0(pc_to_instr), .in_1(four), .out(pc_plus_4));

ADD branch_logic( .in_0(pc_plus_4), .in_1(signextended <<< 2), .out(label_address));


////// Module1 Program Counter

ProgramCounter Module1(.clk(clk), .reset(reset), .next(next_pc), .address(pc_to_instr) );


////// Module2 Instruction Memory

InstructionMemory Module2(.clka(slowclk1), .addra(pc_to_instr), .douta(instr_to_decoder));


////// Module3 Instruction Decoder

InstructionDecoder Module3(.instruction(instr_to_decoder), .opcode(opcode), .functioncode(functioncode), .toSignExtend(to_signextend), .reg1(reg1), .reg2(reg2), .shamt(shamt));


////// Module4 Registers Module

Registers Module4(.reset(reset), .result_reg(result),.readreg1(reg1), .readreg2(reg2), .writedata(writeData), .writereg(writeReg), .regwrite(regwrite), .clk(clk), .readdata1(out_reg1), .readdata2(out_reg2) );

 

////// Module5  SignExtend


SignExtend Module5 (.in(to_signextend), .out(signextended), .extendType(extendType));


////// Module6 ALU

ALU Module6(.ALUop(ALUop), .x(out_reg1) , .y(aluInput2), .shamt(shamt), .out(ALUresult), .carryflag(carryflag), .zflag(zflag), .signflag(signflag));



////// Module7 Control Unit

ControlUnit Module7( .opcode(opcode), .functioncode(functioncode), .branchType(branchType), .extendType(extendType), .memWrite(memWrite), .ALUop(ALUop), .memToReg(memToReg), .ALUsrc(ALUsrc), .memRead(memRead), .regwrite(regwrite), .brNotEq(brNotEq), .branch(branch), .goToReg(goToReg), .destReg(destReg), .flag(flag));


////// Module8 Branch

Branch Module8 ( .carry(carryflag), .zero(zflag), .sign(signflag), .flag(flag), .branch(branch), .branchType(branchType), .brNotEq(brNotEq), .brType(brType));



////// Module9 Data Memory
or (ena, memRead, memWrite);

DataMemory Module9 ( .clka(slowclk2), .ena(ena), .wea({3'b000, memWrite}), .addra(ALUresult), .dina(out_reg2), .douta(memOut));


endmodule

