// Tang Primer UART loopback by yoshiki9636
/*
 * UART Loop Example
 *   UART Loop Module for Tang Primer
 *    Verilog code
 * @auther		Yoshiki Kurokawa <yoshiki.k963@gmail.com>
 * @copylight	2020 Yoshiki Kurokawa
 * @license		https://opensource.org/licenses/MIT     MIT license
 * @version		0.1
 */

module uart_loop (
    input clk,
    input rst_n,

	output rx_rden,
	input [7:0] rx_rdata,
	input rx_fifo_full,
	input rx_fifo_dvalid,
	input rx_fifo_overrun,
	input rx_fifo_underrun,

	output [7:0] tx_wdata,
	output reg tx_wten,
	input tx_fifo_full,
	input tx_fifo_overrun,
	input tx_fifo_underrun

);

// loopback

assign rx_rden = rx_fifo_dvalid;

// rx data latch
reg [7:0] rx_data_l;
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)
        rx_data_l <= 8'd0 ;
    else if (rx_fifo_dvalid)
        rx_data_l <= rx_rdata ;
end

// tx write enable

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)
        tx_wten <= 1'b0 ;
    else
        tx_wten <= rx_fifo_dvalid ;
end

assign tx_wdata = rx_data_l;


endmodule
