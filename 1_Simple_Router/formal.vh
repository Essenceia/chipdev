// Macros for exanding assertions into concurrent or immediate assertions
// based on parser support

// check if we have support for concurrent assertions, currently only verific
// does
`ifdef VERIFIC
	`define _HAS_CONCURRENT SUPPORTED
`else
	`define _HAS_CONCURRENT UNSUPPORTED
`endif


`ifdef FORMAL
	/* define an sva concurrent assertions with an overlapping squence
	* A |-> B 
	*
	* supports clk and ignored on disable */
	`ifdef VERIFIC
		`define _SVA_CO_SUPPORTED( NAME , CLK, DIS, PRE, IMP )\
			NAME : assert property ( @(posedge CLK) disable iff(DIS) \
				( PRE ) |-> ( IMP )); 
	`endif
	`define _SVA_CO_UNSUPPORTED( NAME, CLK, DIS, PRE, IMP ) \
		always @(posedge CLK) begin \
			if (~(DIS)) begin \
				NAME : \
				assert ( ~(PRE) | ( (PRE) & (IMP) )); \
			end \
		end	
	// no clk or disable
	`ifdef VERIFIC
	`define _SVA_CO_NCD_SUPPORTED( NAME , PRE, IMP )\
		always begin \
		NAME : assert property ( ( PRE ) |-> ( IMP )); \
		end
	`endif
	`define _SVA_CO_NCD_UNSUPPORTED( NAME,  PRE, IMP ) \
		always begin \
		NAME : assert ( ~(PRE) | ( (PRE) & (IMP) ); 	
	
	// define macro's to be used
	`define SVA_CO( NAME , CLK, DIS, PRE, IMP ) `_SVA_CO_"_HAS_CONCURRENT( NAME , CLK, DIS, PRE, IMP )
	`define SVA_CO_NCD( NAME, PRE, IMP ) `_SVA_CO_NCD_"_HAS_CONCURRENT( NAME, PRE, IMP )
`endif
