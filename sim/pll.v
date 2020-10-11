// Tang Premier pll dummy module for simulation by yoshiki9636]

pll pll (
        .refclk(clkin),
        .reset(~rst_n),
        .stdby(stdby),
        .extlock(clklock),
        .clk0_out(clk)
        );


module pll
	(
		input refclk,
		input reset,
		input stdby,
		output extlock,
		output clk0_out
	);

assign extlock = 1'b0;
assign clk0_out = refclk;

endmodule
