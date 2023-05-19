module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

reg  [DATA_WIDTH-1:0] max_q;
wire [DATA_WIDTH-1:0] max_q;
reg  [DATA_WIDTH-1:0] max2_q; // second largest
wire [DATA_WIDTH-1:0] max2_next;

wire new_max;

assign new_max   = ( max_q < din);
assign max_next  = new_max ? din : max_q;
assign max2_next = new_max ? max_q : max2_q; 

always @(posedge clk)
begin
	if(~resetn) begin
		max_q  <= DATA_WIDTH'b0; 
		max2_q <= DATA_WIDTH'b0; 
	end
	else begin
		max_q  <= max_next;
		max2_q <= max2_next;
	end
end

// output 
assign dout = max2_q;

endmodule
