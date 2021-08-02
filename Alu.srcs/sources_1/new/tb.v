`timescale 1ns / 1ps


module tb();
reg [31:0]in1;
reg[31:0]in2;
reg[3:0]op;
wire [31:0]res;
wire zero;
wire overflow,carryout;
ALU A(in1,in2,op,carryout,zero,overflow,res);
initial begin

in1=32'd5;
in2=32'd10;

//checking &
op=4'b0000;

//checking |
#5
op=4'b0001;

//checking +
#5
op=4'b0010;

//checking -
#5
op=4'b0110;

//checking lessthan
#5
op=4'b0111;

//checking Bigger THAN
#5
op=4'b1110;

//checking Nor
#5
op=4'b1100;

//checking Nand
#5
op=4'b1111;

//checking shift left
#5
op=4'b1000;

//checking shift right
#5
op=4'b0100;

//checking multiplication
#5
op=4'b0101;

//checking overflow
#5
in1=32'b11111111111111111111111111111111;
in2=32'b11111111111111111111111111111111;
op=4'b0010;

end
endmodule 