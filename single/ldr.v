module ldr(
input wire [31:0] ALUResult,
input wire [31:0] ReadData,
input wire byte,
output reg rd
    );
wire [1:0] mod4;
assign mod4 = ALUResult[1:0];
always @(*)
begin
if (byte)
  case (mod4)
  2'b00: assign rd = {24'b0, ReadData[7:0]};
  2'b01: assign rd = {24'b0, ReadData[15:8]};
  2'b10: assign rd = {24'b0, ReadData[23:16]};
  2'b11: assign rd = {24'b0, ReadData[31:24]};
  endcase
else assign rd = ReadData;
end

endmodule
