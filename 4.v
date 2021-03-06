module dfg(
btn,          
year_1, 
year_2, 
month_1,
month_2,
day_1,  
day_2  
);

input  btn /* synthesis altera_chip_pin_lc="W15"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] year_1 /* synthesis altera_chip_pin_lc="AA25,AA26,AB26,AB27,Y27,AA28,V25" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] year_2 /* synthesis altera_chip_pin_lc="W25,V23,W24,W22,Y24,Y23,AA24"  altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] month_1/* synthesis altera_chip_pin_lc="AB22,AB25,AB28,AC25,AD25,AC27,AD26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] month_2/* synthesis altera_chip_pin_lc="AC30,AC29,AD30,AC28,AD29,AE29,AB23" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] day_1  /* synthesis altera_chip_pin_lc="AD27,AF30,AF29,AG30,AH30,AH29,AJ29" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output [6:0] day_2  /* synthesis altera_chip_pin_lc="AH28,AG28,AF28,AG27,AE28,AE27,AE26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;

assign year_1  = 7'b0000000;
assign year_2  = 7'b1000000;
assign month_1 = 7'b1000000;
assign month_2 = 7'b0000000;
assign day_1   = 7'b1111001;
assign day_2   = 7'b1111000;


endmodule