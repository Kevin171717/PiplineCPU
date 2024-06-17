module HiLo( clk, multAns, HiOut, LoOut, reset );
input clk;
input reset ;
input [63:0] multAns ;
output [31:0] HiOut, LoOut ;

reg [31:0] HiReg, LoReg ;
wire [31:0] HiOut, LoOut;
parameter Hi = 6'd16;
parameter Lo = 6'd18;

always@( multAns or reset )
begin
  if ( reset )
  begin
    HiReg <= 32'b0;
    LoReg <= 32'b0;
  end
  else begin
      {HiReg, LoReg} <= multAns;
  end
end

assign HiOut = HiReg;
assign LoOut = LoReg;

endmodule