module model (
	input  clk,
	input  resetn,
	input  din,
	output dout
);

// trigger a pulse within the same cycle 
reg  pulse_seen_q;
wire pulse_seen_next;

assign dout = din & ~pulse_seen_q & resetn;

assign pulse_seen_next = din; 
 
always @(posedge clk)
begin
	if ( ~resetn ) begin
		pulse_seen_q <= 1'b0;
	end else begin
		pulse_seen_q <= pulse_seen_next;
	end
end


`ifdef FORMAL
// din used in formal, doesn't rise on reset
wire din_f;
assign din_f = din & resetn;

initial begin
	// assume
	a_reset : assume( ~resetn );
	a_dout_zero : assume ( ~dout );
end


always @(posedge clk)
begin
	// assert
	// dout has to be set to zero during reset
	sva_dout_reset  : assert( resetn | ( ~resetn & ~dout ));
	if (resetn) begin
		
		sva_pulse : assert( $rose(din_f) == dout );
			
		// cover
		c_dout : cover ( dout );  
		c_ndout : cover ( ~dout );  
	end
	c_nreset : cover ( ~resetn );
end
`endif
endmodule
