module model 
#(
	parameter SEQ_W = 5
)
(
  input clk,
  input resetn,
  input [SEQ_W-1:0] init,
  input             din,
  output logic      seen
);

reg  [SEQ_W-1:0] seq_q;
wire [SEQ_W-1:0] seq_next;

assign seq_next = { seq_q[SEQ_W-2:0] , din } ;

always @(posedge clk) 
begin
	if ( ~resetn ) begin
		seq_q <= '0;
	end else begin
		seq_q <= seq_next;
	end
end

assign seen = seq_q == init;

`ifdef FORMAL

always @(posedge clk)
begin
	if ( resetn ) begin
		// assert 
		sva_seen : assert ( seen == ( seq_q == init ));
	end
	// cover
	c_reset : cover ( resetn );
	c_nreset : cover ( ~resetn );
	c_seen : cover ( seen );
end
`endif 
endmodule
