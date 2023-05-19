/* Macros for exanding assertions into concurrent or immediate assertions
* based on parser support
*
* check if we have support for concurrent assertions, currently only verific
* does. */

`ifdef VERIFIC
	`define _HAS_CONCURRENT
`endif


`ifdef FORMAL
	/* define an sva concurrent assertions with an overlapping squence
	* A |-> B 
	*
	* supports clk and ignored on disable */
	`ifdef _HAS_CONCURRENT
		`define SVA_CO( NAME , CLK, DIS, PRE, IMP )\
			NAME : assert property ( @(posedge CLK) disable iff(DIS) \
				( PRE ) |-> ( IMP )); 
	`else
	`define SVA_CO( NAME, CLK, DIS, PRE, IMP ) \
		always @(posedge CLK) begin \
			if (~(DIS)) begin \
				NAME : \
				assert ( ~(PRE) | ( (PRE) & (IMP) )); \
			end \
		end	
	`endif 

	// no clk or disable
	`ifdef _HAS_CONCURRENT
		`define SVA_CO_NCD( NAME , PRE, IMP )\
			NAME : assert property ( ( PRE ) |-> ( IMP )); 
	`else
	`define SVA_CO_NCD( NAME,  PRE, IMP ) \
		always_comb begin \
			NAME: assert ( ~(PRE) | ( (PRE) & (IMP) )); \
		end	
	`endif
`endif
