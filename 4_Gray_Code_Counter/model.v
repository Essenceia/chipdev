module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

reg  [DATA_WIDTH-1:0] bin_q;	
wire [DATA_WIDTH-1:0] bin_next;	
wire                  unused_bin_inc;
reg  [DATA_WIDTH-1:0] gray_q;	
wire [DATA_WIDTH-1:0] gray_next;	

always @(posedge clk)
begin
	if(~resetn) begin
		bin_q  <= DATA_WIDTH'd1;
		gray_q <= DATA_WIDTH'd0;
	end else begin
		bin_q  <= bin_next;
		gray_q <= gray_next;
	end
end

assign { unused_bin_inc, bin_next } = bin_q + DATA_WIDTH'd1;
assign gray_next = gray_q ^ bin_q;

assign out = gray_q;

`ifdef FORMAL

initial 
begin
	// assume 
	a_reset : assume ( ~resetn );
end

always @(posedge clk)
begin
	if (resetn)
	begin

		// assert 
		// there is only 1 bit difference between 2 consequtive gray code's
		// or we have overflown
		sva_gray_1_bit_diff : assert ( unused_bin_inc |  $onehot( gray_next ^ gray_q ) );	
		// cover
		c_bin_overflow : cover ( unused_bin_inc );
	end
	c_reset: cover(~resetn );
end
`endif // FORMAL 
endmodule
