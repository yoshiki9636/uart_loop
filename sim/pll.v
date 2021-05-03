// Tang Primer pll dummy module for simulation by yoshiki9636]
/*
 * UART Loop Example
 *   PLL Dummy for Simulation
 *    Verilog code
 * @auther		Yoshiki Kurokawa <yoshiki.k963@gmail.com>
 * @copylight	2020 Yoshiki Kurokawa
 * @license		https://opensource.org/licenses/MIT     MIT license
 * @version		0.1
 */

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
