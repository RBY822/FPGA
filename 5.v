module fgh(
num,
seven_seg
);

input       [3:0] num        /* synthesis altera_chip_pin_lc="AE12,AD10,AC9, AE11"                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output reg  [6:0] seven_seg  /* synthesis altera_chip_pin_lc="AA25,AA26,AB26,AB27,Y27, AA28,V25"  altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
//reg [6:0] year_2     /* synthesis altera_chip_pin_lc="W25, V23, W24, W22, Y24, Y23, AA24" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
//reg [6:0] month_1    /* synthesis altera_chip_pin_lc="AB22,AB25,AB28,AC25,AD25,AC27,AD26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
//reg [6:0] month_2    /* synthesis altera_chip_pin_lc="AC30,AC29,AD30,AC28,AD29,AE29,AB23" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
//reg [6:0] day_1      /* synthesis altera_chip_pin_lc="AD27,AF30,AF29,AG30,AH30,AH29,AJ29" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
//reg [6:0] day_2      /* synthesis altera_chip_pin_lc="AH28,AG28,AF28,AG27,AE28,AE27,AE26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;



always@(*) begin
    case(num)
	 4'b0000 : seven_seg = 7'b1000000;
	 4'b0001 : seven_seg = 7'b1111001;
	 4'b0010 : seven_seg = 7'b0100100;
	 4'b0011 : seven_seg = 7'b0110000;
	 4'b0100 : seven_seg = 7'b0011001;
	 4'b0101 : seven_seg = 7'b0010010;
	 4'b0110 : seven_seg = 7'b0000010;
	 4'b0111 : seven_seg = 7'b1111000;
	 4'b1000 : seven_seg = 7'b0000000;
	 4'b1001 : seven_seg = 7'b0010000;
	 endcase
end
			

endmodule	
	 