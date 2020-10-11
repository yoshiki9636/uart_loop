// Tang Premier UART loopback top by yoshiki9636

module uart_top (
	input clkin,
	input rst_n,
	input rx,
	output tx,
	output [2:0] rgb_led

	);


wire rx_fifo_dvalid;
wire rx_fifo_full;
wire rx_fifo_overrun;
wire rx_fifo_underrun;
wire rx_rden;
wire tx_fifo_full;
wire tx_fifo_overrun;
wire tx_fifo_underrun;
wire tx_wten;
wire [7:0] rx_rdata;
wire [7:0] tx_wdata;

wire clk;
wire clklock;
wire stdby = 1'b0 ;

pll pll (
	.refclk(clkin),
	.reset(~rst_n),
	.stdby(stdby),
	.extlock(clklock),
	.clk0_out(clk)
	);

led led (
	.clk(clk),
	.rst_n(rst_n),
	.next(tx_wten),
	.rgb_led(rgb_led)
	);

uart_if uart_if (
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.tx(tx),
	.rx_rden(rx_rden),
	.rx_rdata(rx_rdata),
	.rx_fifo_full(rx_fifo_full),
	.rx_fifo_dvalid(rx_fifo_dvalid),
	.rx_fifo_overrun(rx_fifo_overrun),
	.rx_fifo_underrun(rx_fifo_underrun),
	.tx_wdata(tx_wdata),
	.tx_wten(tx_wten),
	.tx_fifo_full(tx_fifo_full),
	.tx_fifo_overrun(tx_fifo_overrun),
	.tx_fifo_underrun(tx_fifo_underrun)
	);

uart_loop uart_loop (
	.clk(clk),
	.rst_n(rst_n),
	.rx_rden(rx_rden),
	.rx_rdata(rx_rdata),
	.rx_fifo_full(rx_fifo_full),
	.rx_fifo_dvalid(rx_fifo_dvalid),
	.rx_fifo_overrun(rx_fifo_overrun),
	.rx_fifo_underrun(rx_fifo_underrun),
	.tx_wdata(tx_wdata),
	.tx_wten(tx_wten),
	.tx_fifo_full(tx_fifo_full),
	.tx_fifo_overrun(tx_fifo_overrun),
	.tx_fifo_underrun(tx_fifo_underrun)
	);

endmodule
