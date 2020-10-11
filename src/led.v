// Tang Premier LED counter by yoshiki9636

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
