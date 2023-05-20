module model #(
	parameter DATA_WIDTH=3
) 
(
  input  [DATA_WIDTH-1:0]       din,
  output logic [DATA_WIDTH-1:0] dout
);

genvar i;
generate;
	for (i=0; i<DATA_WIDTH; i++) begin
		assign dout[i] = din[DATA_WIDTH-i-1];
	end
endgenerate
`ifdef FORMAL

always_comb 
begin
	// assert 
	// rather hard to write an assert for something so trivial without
	// rewriting the code
	sva_rev : assert ( dout[0]  == din[DATA_WIDTH-1]);

	// cover
	c_nzero : cover( |din );
end
`endif

endmodule
