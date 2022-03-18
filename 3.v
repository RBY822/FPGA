module cdf(
btn_1,
btn_2,
btn_3,          
year_T1,
year_T2,
month_T1,
month_T2,
day_T1,  
day_T2  
);

input            btn_1      /* synthesis altera_chip_pin_lc="Y16"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input            btn_2      /* synthesis altera_chip_pin_lc="W15"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input            btn_3      /* synthesis altera_chip_pin_lc="AA15"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] year_T1    /* synthesis altera_chip_pin_lc="AA25,AA26,AB26,AB27,Y27, AA28,V25"  altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] year_T2    /* synthesis altera_chip_pin_lc="W25, V23, W24, W22, Y24, Y23, AA24" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] month_T1   /* synthesis altera_chip_pin_lc="AB22,AB25,AB28,AC25,AD25,AC27,AD26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] month_T2   /* synthesis altera_chip_pin_lc="AC30,AC29,AD30,AC28,AD29,AE29,AB23" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] day_T1     /* synthesis altera_chip_pin_lc="AD27,AF30,AF29,AG30,AH30,AH29,AJ29" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output     [6:0] day_T2     /* synthesis altera_chip_pin_lc="AH28,AG28,AF28,AG27,AE28,AE27,AE26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;


reg  [3:0]  year_1; 
reg  [3:0]  year_2; 
reg  [3:0]  month_1;
reg  [3:0]  month_2;
reg  [3:0]  day_1;  
reg  [3:0]  day_2;  


always@(*) begin
   if(~btn_1) begin
	year_1  = 4'd8;
	year_2  = 4'd6;
	month_1 = 4'd0;
	month_2 = 4'd8;
	day_1   = 4'd2;
	day_2   = 4'd2;
	end
	else if(~btn_2) begin
	year_1  = 4'd8;
	year_2  = 4'd0;
   month_1 = 4'd0;
   month_2 = 4'd7;
   day_1   = 4'd2;
   day_2   = 4'd6;
	end
	else if(~btn_3) begin
	year_1  = 4'd8;
	year_2  = 4'd0;
   month_1 = 4'd0;
   month_2 = 4'd8;
   day_1   = 4'd1;
   day_2   = 4'd7;
	end
	else begin
	year_1  = 7'b0000000;
   year_2  = 7'b0000000;
   month_1 = 7'b0000000;
   month_2 = 7'b0000000;
   day_1   = 7'b0000000;
   day_2   = 7'b0000000;
	end
	
end

fgh_aa  y1 ( year_1, year_T1 );
fgh_aa  y2 ( year_2, year_T2 );
fgh_aa  m1 ( month_1, month_T1 );
fgh_aa  m2 ( month_2, month_T2 );
fgh_aa  d1 ( day_1, day_T1 );
fgh_aa  d2 ( day_2, day_T2 );

endmodule

module fgh_aa(
num_a,
seven_seg_a
);

input       [3:0] num_a;
output reg  [6:0] seven_seg_a;


always@(*) begin
    case(num_a)
	 4'b0000 : seven_seg_a = 7'b1000000;
	 4'b0001 : seven_seg_a = 7'b1111001;
	 4'b0010 : seven_seg_a = 7'b0100100;
	 4'b0011 : seven_seg_a = 7'b0110000;
	 4'b0100 : seven_seg_a = 7'b0011001;
	 4'b0101 : seven_seg_a = 7'b0010010;
	 4'b0110 : seven_seg_a = 7'b0000010;
	 4'b0111 : seven_seg_a = 7'b1111000;
	 4'b1000 : seven_seg_a = 7'b0000000;
	 4'b1001 : seven_seg_a = 7'b0010000;
	 endcase
end
			

endmodule	
