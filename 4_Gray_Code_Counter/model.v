module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

reg  [DATA_WIDTH-1:0] bin_q;	
wire [DATA_WIDTH-1:0] bin_nxt;	
wire                  unused_bin_inc;
reg  [DATA_WIDTH-1:0] gray_q;	
wire [DATA_WIDTH-1:0] gray_nxt;	

always @(posedge clk)
begin
	if(~resetn) begin
		bin_q  <= DATA_WIDTH'd1;
		gray_q <= DATA_WIDTH'd0;
	end else begin
		bin_q <= bin_next;
		gray_q <= gray_next;
	end
end

assign { unused_bin_inc, bin_next } = bin_q + DATA_WIDTH'd1;
assign gray_next = gray_q ^ bin_q;

assign out = gray_q;

endmodule
