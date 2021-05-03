// Tang Primer LED counter by yoshiki9636
/*
 * UART Loop Example
 *   LED Counter for Tang Primer
 *    Verilog code
 * @auther		Yoshiki Kurokawa <yoshiki.k963@gmail.com>
 * @copylight	2020 Yoshiki Kurokawa
 * @license		https://opensource.org/licenses/MIT     MIT license
 * @version		0.1
 */

module led
	(
		input clk,
		input rst_n,
		input next,
		output [2:0]rgb_led
	);

reg [2:0] led_value;

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)
        led_value <= 3'd0 ;
	else if ( next )
		led_value <= led_value + 3'd1 ;
end

assign rgb_led = led_value;

endmodule
