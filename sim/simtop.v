// Tang Primer UART loopback simtop by yoshiki9636
/*
 * UART Loop Example
 *   Simulation Top Module
 *    Verilog code
 * @auther		Yoshiki Kurokawa <yoshiki.k963@gmail.com>
 * @copylight	2020 Yoshiki Kurokawa
 * @license		https://opensource.org/licenses/MIT     MIT license
 * @version		0.1
 */

module simtop;

reg clk;
reg rst_n;
wire rx; // input
wire tx; // output

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

initial clk = 0;

always #5 clk <= ~clk;

initial begin
	rst_n = 1'b1;
#10
	rst_n = 1'b0;
#20
	rst_n = 1'b1;
#500000
	$stop;
end

// data sender
reg [4:0] timer;

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)
        timer <= 5'd19 ;
    else if ( timer == 5'd0 )
        timer <= 5'd19 ;
    else
        timer <= timer - 5'd1 ;
end

wire trg = ( timer == 5'd0);


reg [39:0] data;
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)
        data <= { 1'b0, 8'h12, 2'b10, 8'h34, 2'b10, 8'h56, 2'b10, 8'h78, 1'b1 };
    else if ( trg )
		data <= { data[38:0], 1'b1};
end

assign rx = data[39];

wire [2:0] rgb_led;

uart_top uart_top (
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.tx(tx),
	.rgb_led(rgb_led)
	);

endmodule
