// Preditor --,-,+,++
module pred_table ( clk, line,  din, dout , reset);
input clk;
input [6:0] line;
input [1:0] din;
output [1:0] dout;
input reset;


reg [1:0] memory[0:127];


always @(posedge clk )
  begin
      memory[line] <= din; 
  end

assign dout = memory[line];


always @( posedge reset) 
			if(reset) // inicia  para testes
				begin
				  memory[0] <= 2'h3;
				  memory[1] <= 2'h2;
				  memory[2] <= 2'h1;
				  memory[3] <= 2'h0;
				end


endmodule


