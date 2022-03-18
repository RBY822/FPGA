module bcd(
input sw_1,
input sw_3,
input sw_5,
input sw_7,
input sw_9,
input btn,
output led_1,
output led_3,
output led_5,
output led_7,
output led_9
);


assign {led_1,led_3,led_5,led_7,led_9} = {5{sw_1 && sw_3 && sw_5 && sw_7 && sw_9 && ~btn}};
/*
always@(*) begin

   if(sw_1 && sw_3 && sw_5 && sw_7 && sw_9 && ~btn) begin
	   
		led_1 = sw_1 && sw_3 && sw_5 && sw_7 && sw_9 && ~btn;
		led_3 = 1;
		led_5 = 1;
		led_7 = 1;
		led_9 = 1;
	end
	else begin
	
	   led_1 = 0;
		led_3 = 0;
		led_5 = 0;
		led_7 = 0;
		led_9 = 0;
	end
	
end
	*/
endmodule

	
	
   