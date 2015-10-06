`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:04 09/04/2015 
// Design Name: 
// Module Name:    up_count 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module up_count(
	mode,
	clk_out,
	rst_n,
	in0,
	in1,
	in2,
	in3
    );

input [2:0] mode;
input clk_out,rst_n;
output reg [3:0] in0,in1,in2,in3;

reg [3:0] D,hr24_1,hr24_2,AorP,M,hr12_1,hr12_2,min1,min2,s1,s2,mon1,mon2,day1,day2;

reg [3:0] hr24_1_temp,hr24_2_temp,AorP_temp,hr12_1_temp,hr12_2_temp,min1_temp,min2_temp;
reg [3:0] s1_temp,s2_temp,mon1_temp,mon2_temp,day1_temp,day2_temp;
reg day_index,year_index,montotal;

reg [3:0] year1,year2,year3,year4,year1_temp,year2_temp,year3_temp,year4_temp;


always@(*)begin
	case(mode)
		3'b000:begin       //分秒
				in0=min1;
				in1=min2;
				in2=s1;
				in3=s2; end
		3'b001:begin       //AM PM
				in0=AorP;
				in1=M;
				in2=hr12_1;
				in3=hr12_2; end
		3'b010:begin      //24小時
				in0=D;
				in1=D;
				in2=hr24_1;
				in3=hr24_2; end
		3'b011:begin		 //月 日
				in0=mon1;
				in1=mon2;
				in2=day1;
				in3=day2; end
		3'b100:begin		 //年
				in0=year1;
				in1=year2;
				in2=year3;
				in3=year4; end
	endcase
	
	 if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd1&&hr12_1==4'd1)begin
		hr24_1_temp=0;
		hr24_2_temp=0;
		AorP_temp=4'd10;
		hr12_1_temp=0;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=1'b1;
	
		
		end	

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1+1'b1;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end	



	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd7)begin
		hr24_1_temp=hr24_1+1'b1;
		hr24_2_temp=0;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end	

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2<4'd7)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end	
		
	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2<4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2==4'd1&&hr12_1==4'd1&&hr12_2==hr24_2)begin  //59:59//11AM
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=4'd11;
		hr12_1_temp=0;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2<4'd1&&hr12_1==4'd1&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end
		

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2==4'd9&&hr12_1==0&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1+1'b1;
		hr24_2_temp=0;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1+1'b1;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end
		
	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=4'd9&&hr12_1==0&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1!=4'd5)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1+1'b1;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end

	else if (s2==4'd9&&s1==4'd5&&min2!=4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2+1'b1;
		s1_temp=0;
		s2_temp=0;
		day_index=0;end


	else if (s2==4'd9&&s1!=4'd5)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2;
		s1_temp=s1+1'b1;
		s2_temp=0;
		day_index=0;end


		
	else begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2;
		s1_temp=s1;
		s2_temp=s2+1'b1; 
		day_index=0;end	
		
	

//montotal=mon1+mon2;

	case({mon1,mon2})
	8'd1:begin 
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd2;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd2:begin 
			year_index=0;
			if(day_index&&day1==4'd2&&day2==4'd8) begin
				mon1_temp=0;
				mon2_temp=4'd3;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if (day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd3:begin
			year_index=0;
			if(day_index&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd4;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd4:begin 
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd0) begin
				mon1_temp=0;
				mon2_temp=4'd5;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd5:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd6;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd6:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd0;
				mon2_temp=4'd7;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd7:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd8;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd8:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd9;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd9:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd1;
				mon2_temp=4'd0;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd16:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=4'd1;
				mon2_temp=4'd1;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd17:begin
			year_index=0;
			if(day_index&&day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd1;
				mon2_temp=4'd2;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
			
	8'd18:begin
			if(day_index&&day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd1;
				day1_temp=0;
				day2_temp=4'd1;
				year_index=1'b1;
			end
			else if(day_index&&day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
				year_index=0;
			end
			else if(day_index) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
				year_index=0;
			end 
			else  begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2;
			end  end
	endcase

	if(year_index==1'b1&&year3==4'd9&&year4==4'd9)begin
		year1_temp=year1;
		year2_temp=year2+1'b1;
		year3_temp=0;
		year4_temp=0;
		end
	
	else if  (year_index==1'b1&&year4==4'd9)begin
		year1_temp=year1;
		year2_temp=year2;
		year3_temp=year3+1'b1;
		year4_temp=0;
		end
	else if(year_index) begin
		year1_temp=year1;
		year2_temp=year2;
		year3_temp=year3;
		year4_temp=year4+1'b1;
		end
	else begin
		year1_temp=year1;
		year2_temp=year2;
		year3_temp=year3;
		year4_temp=year4;
		end
end

always@(posedge clk_out or negedge rst_n)
	if(~rst_n) begin
		mon1<=0;
		mon2<=4'd1;
		day1<=4'd3;
		day2<=4'd1;
		D<=4'd0;    //不變
		hr24_1<=4'd2;
		hr24_2<=4'd3;
		AorP<=4'd11;   //reset 變A
		M<=4'd15;    //不變
		hr12_1<=4'd1;
		hr12_2<=4'd1;
		min1<=4'd5;
		min2<=4'd9;  
		s1<=0;
		s2<=0;
		year1<=4'd2;
		year2<=0;
		year3<=0;
		year4<=0;		end

	else begin
		mon1<=mon1_temp;
		mon2<=mon2_temp;
		day1<=day1_temp;
		day2<=day2_temp;
		D<=4'd0;     //不變
		hr24_1<=hr24_1_temp;
		hr24_2<=hr24_2_temp;
		AorP<=AorP_temp;
		M<=4'd15;     //不變
		hr12_1<=hr12_1_temp;
		hr12_2<=hr12_2_temp;
		min1<=min1_temp;
		min2<=min2_temp;
		s1<=s1_temp;
		s2<=s2_temp;
		year1<=year1_temp;
		year2<=year2_temp;
		year3<=year3_temp;
		year4<=year4_temp;		end

endmodule
