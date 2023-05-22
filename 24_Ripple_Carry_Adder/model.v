// `include "full_adder.sv"
module model #(
	parameter DATA_WIDTH=8
)
(
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum,
    output logic [DATA_WIDTH-1:0] cout_int
);

logic [DATA_WIDTH:0] carry;
assign carry[0] = 1'b0;

genvar x;
generate
	for( x = 0; x < DATA_WIDTH; x++ ) begin
		// instanciate adder module
		full_adder m_adder(
			.a( a[x] ),
			.b( b[x] ),
			.cin( carry[x]),
			.sum( sum[x] ),
			.cout( carry[x+1] )
		);
	end
endgenerate
// output
assign sum[DATA_WIDTH] = carry[DATA_WIDTH];
assign cout_int        = carry[DATA_WIDTH-1:0];


`ifdef FORMAL

logic [DATA_WIDTH:0] res;
assign res = a + b;

always_comb begin
	// assert
	sva_adder : assert ( res == sum );
	// cover
	c_overflow : cover ( &cout_init );
	c_zero : cover ( ~|sum ); 
end

`endif
endmodule
