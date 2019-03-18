%輸入 
%     1. 基地台到基地台之間的中心距離(inter_side_distance)
%輸出 
%     1. 基地台位置
%       格式為 [X_coordinate_of_Base_Station Y_coordinate_of_Base_Station Number_Base_Station]
%       共有19個基地台根作業的圖示一樣
function bs_coordinate = Construction_of_BS_coordinate(inter_side_distance)
len_hex = inter_side_distance/sqrt(3);
num_first_tier = 6;
num_second_tier = 12;

angle = atan(sqrt(3)/3);
bs_coordinate = [0,0,1];
    
for i = 1:num_first_tier
 coordinate_of_each = [real(inter_side_distance*exp(j*angle)),imag(inter_side_distance*exp(j*angle)),i+1];
 bs_coordinate = [bs_coordinate;coordinate_of_each];
 angle = angle + (2*pi)/6;
end
angle = 0
for i = 1:num_second_tier
    if rem(i,2) == 0
        coordinate_of_each = [real(inter_side_distance*2*exp(j*angle)),imag(inter_side_distance*2*exp(j*angle)),i + num_first_tier+1];
    elseif rem(i,2) == 1
        coordinate_of_each = [real(len_hex*3*exp(j*angle)),imag(len_hex*3*exp(j*angle)),i + num_first_tier+1];
    end
 bs_coordinate = [bs_coordinate;coordinate_of_each];
 angle = angle + (2*pi)/12;
end
end

