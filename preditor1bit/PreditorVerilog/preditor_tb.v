// iverilog -o my_design fsm_pred.v preditor_table.v preditor_tb.v
/*pred_table ( clk, line,  din, dout , reset);
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  reg [6:0] address = 7'h0;
  reg p = 0;

  initial begin
     $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 2 reset = 1;
     # 2 reset = 0;
     # 2 address = 6'h2;
     # 10 p = 1;
     # 10 address = 6'h2;
     # 10 p = 0;
     # 10 p = 1;
     # 10 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [1:0] dout;
  wire [1:0] din;

fsm_table_cc  CC( .din(dout), .dout(din),.p(p) );
pred_table tab( .clk(clk), .line(address),  .din(din), .dout(dout) , .reset(reset));

  initial
     $monitor("At time %t, address = %0d  dout = %0d",
              $time, address, dout);
endmodule // test
