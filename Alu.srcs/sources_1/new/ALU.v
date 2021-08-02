`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2020 10:11:21 PM
// Design Name: 
// Module Name: AUL
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [3:0] opreation,
    output reg carryout,
    output reg zero,
    output reg overflow,  
    output reg [31:0] result
    );
    always@(opreation or operand1 or operand2)
    begin
    overflow<=0;
    case(opreation)
    //AND
    4'b0000:{overflow, result}<=operand1 & operand2;
    //OR
    4'b0001:{overflow, result}<=operand1 | operand2;
    // +
    4'b0010:{overflow, result}<=operand1 + operand2;
    // -
    4'b0110:result<=(operand1 - operand2);
    // SET LESS THAN
    4'b0111:result<=(operand1<operand2)?32'b1:32'b0;
    // SET Bigger THAN
    4'b1110:result<=(operand1>operand2)?32'b1:32'b0;
    //NOR
    4'b1100:result<=~(operand1 | operand2);
    //NAND
    4'b1111:result<=~(operand1 & operand2);
    //shift left
    4'b1000:{overflow, result}<=operand1 << operand2;
    //shift right
    4'b0100:{overflow, result}<=operand1 >> operand2;
    //multiplication
    4'b0101:{overflow, result}<=operand1 * operand2;
    endcase
  
    end
    always @*
    begin 
    if(result==0)
    begin zero<=1; end else begin zero<=0; end
    end
endmodule
