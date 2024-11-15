module control_unit (
	clk,
	reset,
	Instr,
	PCSrcD,
	RegWriteD,
	MemtoRegD,
	MemWriteD,
	ALUControlD,
	BranchD,
	ALUSrcD,
	FlagWriteD,
	ImmSrcD,
	RegSrcD,
);
	input wire clk;
	input wire reset;
	input wire [27:12] Instr;
	output wire PCSrcD;
	output wire RegWriteD;
	output wire MemtoRegD;
	output wire MemWriteD;
	output wire [1:0] ALUControlD;
	output wire BranchD;
	output wire ALUSrcD;
	output wire [1:0] FlagWriteD;
	output wire [1:0] ImmSrcD;
	output wire [1:0] RegSrcD;


///////////////////////////////////
FALTA CAMBIAR LA LOGICA
///////////////////////////////////

	decode dec(
		.Op(Instr[27:26]),
		.Funct(Instr[25:20]),
		.Rd(Instr[15:12]),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.MemtoReg(MemtoReg),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegSrc(RegSrc),
		.ALUControl(ALUControl),
		.byte(byte)
	);
	//Se agrega el output para byte
	condlogic cl(
		.clk(clk),
		.reset(reset),
		.Cond(Instr[31:28]),
		.ALUFlags(ALUFlags),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.PCSrc(PCSrc),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite)
	);
endmodule