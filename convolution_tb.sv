`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2022 15:10:59
// Design Name: 
// Module Name: convo_tb
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


module convo_tb;

reg clock;
   reg reset;
    reg [7:0] in [6:0][6:0];
    reg [7:0] filter [2:0][2:0];
//    reg [3:0] stride;
    wire [7:0] out [2:0][2:0];
    
    assign filter[0][0]=7'h1;
    assign filter[0][1]=7'h2;
    assign filter[0][2]=7'h3;
    assign filter[1][0]=1;
    assign filter[1][1]=2;
    assign filter[1][2]=3;
    assign filter[2][0]=1;
    assign filter[2][1]=2;
    assign filter[2][2]=3;

    assign in[0][0]=1;
    assign in[0][1]=1;
    assign in[0][2]=1;
    assign in[0][3]=1;
    assign in[0][4]=1;
    assign in[0][5]=1;
    assign in[0][6]=1;
    assign in[1][0]=1;
    assign in[1][1]=1;
    assign in[1][2]=1;
    assign in[1][3]=1;
    assign in[1][4]=1;
    assign in[1][5]=1;
    assign in[1][6]=1;
    assign in[2][0]=1;
    assign in[2][1]=1;
    assign in[2][2]=1;
    assign in[2][3]=1;
    assign in[2][4]=1;
    assign in[2][5]=1;
    assign in[2][6]=1;
    assign in[3][0]=1;
    assign in[3][1]=1;
    assign in[3][2]=1;
    assign in[3][3]=1;
    assign in[3][4]=1;
    assign in[3][5]=1;
    assign in[3][6]=1;
    assign in[4][0]=1;
    assign in[4][1]=1;
    assign in[4][2]=1;
    assign in[4][3]=1;
    assign in[4][4]=1;
    assign in[4][5]=1;
    assign in[4][6]=1;
    assign in[5][0]=1;
    assign in[5][1]=1;
    assign in[5][2]=1;
    assign in[5][3]=1;
    assign in[5][4]=1;
    assign in[5][5]=1;
    assign in[5][6]=1;
    assign in[6]={1,1,1,1,1,1,1};
    assign in[7]={1,1,1,1,1,1,1};


    
    initial begin
    reset=1;
    #3 reset=0;
//    for (int i=0;i<=2;i+=1) begin
//        for (int j=0;j<=2;j+=1) begin
//            #2 filter[i][j]=j;
//            end
//            end
        
//     for (int i=0;i<=7;i+=1)
//        for (int j=0;j<=7;j+=1) begin
//            in[i][j]=j;
//$display ("tbtb filter is %d",in[i][j]);
//        end

    #50 $finish;
    end
    convo c1(clock,reset,in,filter,out);
    
endmodule
