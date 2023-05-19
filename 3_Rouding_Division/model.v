module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);

assign unused_res;
assign [OUT_WIDTH-1:0] log2;
assign [DIV_LOG2-1:0]  rnd;
assign [OUT_WIDTH-1:0] res;

assign { log2, rnd } = din;

assign { unused_res, res } = log2  + { {OUT_WIDTH-1{1'b0}} , |rnd };
assign dout = res;
endmodule
