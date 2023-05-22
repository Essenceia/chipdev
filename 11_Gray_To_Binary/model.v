module model #(
	parameter DATA_WIDTH = 3
) 
(
	input [DATA_WIDTH-1:0]        gray,
	output logic [DATA_WIDTH-1:0] bin
);

wire [DATA_WIDTH-1:0] tmp [DATA_WIDTH-1:1]; 
assign tmp[1] = ( gray >> 1 ) ^ gray;

genvar x;
generate
	for( x = 2; x < DATA_WIDTH ; x++) begin
		assign tmp[x] = ( gray >> x ) ^ tmp[x-1];
	end 
endgenerate

assign bin = tmp[DATA_WIDTH-1];
 

`ifdef FORMAL

wire [DATA_WIDTH-1:0] gray_f;

// In order to construct our gray code we converter the binary
// gray = bin ^ ( bin >> 1 ) 

assign gray_f = bin ^ ( bin >> 1 );

always_comb
begin
	// assert
	sva_inv_bin : assert( gray_f == gray );
	// cover
	c_zero : cover ( ~|gray );
	c_nzero : cover ( |gray );
end
`endif
endmodule
