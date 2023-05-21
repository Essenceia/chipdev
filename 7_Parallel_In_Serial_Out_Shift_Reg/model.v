module model #(
	parameter DATA_WIDTH = 16
) 
(
	input clk,
	input resetn,
	input [DATA_WIDTH-1:0] din,
	input                  din_en,
	output logic           dout
);

reg  [DATA_WIDTH-1:0] data_q;
wire [DATA_WIDTH-1:0] data_next;

assign data_next = din_en ? din : data_q >> 1;

always @(posedge clk)
begin
	if( ~resetn) begin
		data_q <= '0;
	end else begin
		data_q <= data_next;
	end
end

assign dout = data_q[0]; 

`ifdef FORMAL


`endif
endmodule
