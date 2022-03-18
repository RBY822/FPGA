module adder(
btn_1,
btn_2,
btn_3,
sw_0,
sw_1,
sw_2,
sw_3,
sw_4,
sw_5,
sw_6,
sw_7,
sw_8,
sw_9,
equ_1,
equ_2,
equ_3,
equ_4,
equ_5,
equ_6
);

input          btn_1   /* synthesis altera_chip_pin_lc="Y16"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          btn_2   /* synthesis altera_chip_pin_lc="W15"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          btn_3   /* synthesis altera_chip_pin_lc="AA15"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_0    /* synthesis altera_chip_pin_lc="AB12"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_1    /* synthesis altera_chip_pin_lc="AC12"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_2    /* synthesis altera_chip_pin_lc="AF9"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_3    /* synthesis altera_chip_pin_lc="AF10"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_4    /* synthesis altera_chip_pin_lc="AD11"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_5    /* synthesis altera_chip_pin_lc="AD12"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_6    /* synthesis altera_chip_pin_lc="AE11"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_7    /* synthesis altera_chip_pin_lc="AC9"                                altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_8    /* synthesis altera_chip_pin_lc="AD10"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
input          sw_9    /* synthesis altera_chip_pin_lc="AE12"                               altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_1   /* synthesis altera_chip_pin_lc="AA25,AA26,AB26,AB27,Y27, AA28,V25"  altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_2   /* synthesis altera_chip_pin_lc="W25, V23, W24, W22, Y24, Y23, AA24" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_3   /* synthesis altera_chip_pin_lc="AB22,AB25,AB28,AC25,AD25,AC27,AD26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_4   /* synthesis altera_chip_pin_lc="AC30,AC29,AD30,AC28,AD29,AE29,AB23" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_5   /* synthesis altera_chip_pin_lc="AD27,AF30,AF29,AG30,AH30,AH29,AJ29" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;
output  [6:0]  equ_6   /* synthesis altera_chip_pin_lc="AH28,AG28,AF28,AG27,AE28,AE27,AE26" altera_attribute = "-name IO_STANDARD \"3.3-V LVTTL\" " */;


/*wire    [9:0]  sum2;*/
reg     [9:0]  num_0, num_1, num_2, num_3, num_4, num_5, num_6, num_7,num_8, num_9;
wire    [19:0] sum;
reg     [19:0] sum_1st = 20'd0;
reg     flag = 1'd0;
wire    [3:0]  onehunthousands;
wire    [3:0]  tenthousands;
wire    [3:0]  thousands;
wire    [3:0]  hundreds;
wire    [3:0]  tens;
wire    [3:0]  ones;


always@(*) begin
  if(sw_0)
    num_0 = 10'd1;
	 else
	 num_0 = 10'd0;
  if (sw_1)
    num_1 = 10'd2;
	 else
	 num_1 = 10'd0;
  if (sw_2)
    num_2 = 10'd4;
	 else
	 num_2 = 10'd0;
  if (sw_3)
    num_3 = 10'd8;
	 else
	 num_3 = 10'd0;
  if (sw_4)
    num_4 = 10'd16;
	 else
	 num_4 = 10'd0;
  if (sw_5)
    num_5 = 10'd32;
	 else
	 num_5 = 10'd0;
  if (sw_6)
    num_6 = 10'd64;
	 else
	 num_6 = 10'd0;
  if (sw_7)
    num_7 = 10'd128;
	 else
	 num_7 = 10'd0;
  if (sw_8)
    num_8 = 10'd256;
	 else
	 num_8 = 10'd0;
  if (sw_9)
    num_9 = 10'd512;
	 else
	 num_9 = 10'd0;
end

assign sum = num_0 + num_1 + num_2 + num_3 + num_4 + num_5 + num_6 + num_7 + num_8 + num_9;
/*assign sum2 = {sw_9, sw_8, sw_7, sw_6, sw_5, sw_4, sw_3, sw_2, sw_1, sw_0 };*/

BCD total ( sum_1st, onehunthousands, tenthousands, thousands, hundreds, tens, ones );

fgh aa ( onehunthousands, equ_1 );
fgh bb ( tenthousands, equ_2 ); 
fgh cc ( thousands, equ_3 );
fgh dd ( hundreds, equ_4 );
fgh ee ( tens, equ_5 );
fgh ff ( ones, equ_6 );

always@(*) begin
  if(~btn_1 && ~flag) begin
     sum_1st <= sum_1st + sum;
	  flag = 1;
	end  
	
	if(btn_1 && flag)
		flag = 0;
	if(~btn_2)
		sum_1st <= 20'd0;
	if(~btn_3)
		sum_1st <= 20'd999999;
end 

endmodule

module BCD(
binary,
onehunthousands,
tenthousands,
thousands,
hundreds,
tens,
ones
);

input [19:0] binary;
output reg [3:0] onehunthousands;
output reg [3:0] tenthousands;
output reg [3:0] thousands;
output reg [3:0] hundreds;
output reg [3:0] tens;
output reg [3:0] ones;

integer i;
always@(binary) begin
  //set 100's, 10's, and 1's to 0
  onehunthousands = 4'd0;
  tenthousands = 4'd0;
  thousands = 4'd0;
  hundreds = 4'd0;
  tens = 4'd0;
  ones = 4'd0;
  
  for (i=19; i>=0; i=i-1)
  begin
     //add 3 to columns >= 5
	  if (onehunthousands >= 5)
	     onehunthousands = onehunthousands + 3;
	  if (tenthousands >= 5)
	     tenthousands = tenthousands + 3;
	  if (thousands >= 5)
	     thousands = thousands + 3;
	  if (hundreds >= 5)
	     hundreds = hundreds + 3;
	  if (tens >= 5)
	     tens = tens + 3;
	  if (ones >= 5)
	     ones = ones + 3;
		  
	  //shift left one
	  onehunthousands = onehunthousands << 1;
	  onehunthousands[0] = tenthousands[3];
	  tenthousands = tenthousands << 1;
	  tenthousands[0] = thousands[3];
	  thousands = thousands << 1;
	  thousands[0] = hundreds[3];
	  hundreds = hundreds << 1;
	  hundreds[0] = tens[3];
	  tens = tens << 1;
	  tens[0] = ones[3];
	  ones = ones << 1;
	  ones[0] = binary[i];
  end
end

endmodule


module fgh(
num,
seven_seg
);

input       [3:0] num;
output reg  [6:0] seven_seg;


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



