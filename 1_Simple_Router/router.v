`include "formal.vh"

module model #(
	parameter DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
);

// data should be forced to 0 when not driven 
assign dout0 = {DATA_WIDTH{din_en & ( addr == 2'd0 )}} & din; 
assign dout1 = {DATA_WIDTH{din_en & ( addr == 2'd1 )}} & din; 
assign dout2 = {DATA_WIDTH{din_en & ( addr == 2'd2 )}} & din; 
assign dout3 = {DATA_WIDTH{din_en & ( addr == 2'd3 )}} & din; 



`ifdef FORMAL

`SVA_CO_NCD( dout_zero_din_en_false, ~din_en, (dout0 == 0) & (dout1 == 0) & (dout2 == 0) & (dout3 == 0))
// output is correct
`SVA_CO_NCD( dout_addr0_match , din_en & (addr == 2'd0) , (dout0 == din) & (dout1 == 0) & (dout2 == 0) & (dout3 == 0))
`SVA_CO_NCD( dout_addr1_match , din_en & (addr == 2'd1) , (dout1 == din) & (dout0 == 0) & (dout2 == 0) & (dout3 == 0))
`SVA_CO_NCD( dout_addr2_match , din_en & (addr == 2'd2) , (dout2 == din) & (dout0 == 0) & (dout1 == 0) & (dout3 == 0))
`SVA_CO_NCD( dout_addr3_match , din_en & (addr == 2'd3) , (dout3 == din) & (dout0 == 0) & (dout1 == 0) & (dout2 == 0))

`endif // FORMAL
endmodule
