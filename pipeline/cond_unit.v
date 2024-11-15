module cond_unit(
	clk,
	reset,
	FlagWriteE,
	CondE,
	FlagsE,
	ALUFlags,
	Flags,
	CondExE,
);
	input wire [1:0] FlagWriteE;
	input wire [3:0] CondE;
	input wire FlagsE;
	input wire [3:0] ALUFlags;	
	output wire [3:0] Flags;
	output wire CondEx;

	wire [1:0] FlagWE;

	flopenr #(2) flagreg1(
		.clk(clk),
		.reset(reset),
		.en(FlagWE[1]),
		.d(ALUFlags[3:2]),
		.q(Flags[3:2])
	);
	flopenr #(2) flagreg0(
		.clk(clk),
		.reset(reset),
		.en(FlagWE[0]),
		.d(ALUFlags[1:0]),
		.q(Flags[1:0])
	);
	condcheck cc(
		.CondE(Cond),
		.Flags(Flags),
		.CondExE(CondEx)
	);
	assign FlagWE = FlagWriteE & {2 {CondEx}};
	

endmodule