module flop_mw(
	clk,
	PCSrcM,
	RegWriteM,
	MemtoRegM,
	PCSrcW,
	RegWriteW,
	MemtoRegW,
);
	input wire PCSrcM;
	input wire RegWriteM;
	input wire MemtoRegM;
	output reg PCSrcW;
	output reg RegWriteW;
	output reg MemtoRegW;

	always @ (posedge clk or posedge reset)
	begin
		if (reset)
		begin
			PCSrcW <= 0;
			RegWriteW <= 0;
			MemtoRegW <= 0;
		end
		else
		begin
			PCSrcW <= PCSrcM;
			RegWriteW <= RegWriteM;
			MemtoRegW <= MemtoRegM;
		end
	end
	
endmodule