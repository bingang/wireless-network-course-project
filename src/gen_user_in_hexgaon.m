%輸入 
%     1. 使用者數目(num_of_user)  
%     2. 基地台位置(center) 
%     3. 基地台到基地台之間的中心距離(inter_side_distance)
%輸出 
%     1. 使用者位置
%       格式為 [X_coordinate_of_User1 Y_coordinate_of_User1]
%                               .
%                               .
%                               .

function output = gen_user_in_hexgaon(num_of_user,center,inter_side_distance)
len_hex = inter_side_distance/sqrt(3);
valid_num = 0;
coordinate = [];
while valid_num < num_of_user
   X_coordinate_of_each = -len_hex + (2*len_hex)*rand;
   Y_coordinate_of_each = -(inter_side_distance/2) + (2*(inter_side_distance/2))*rand;
   coordinate_of_each = [X_coordinate_of_each,Y_coordinate_of_each]
   if coordinate_of_each(1) > 0 & coordinate_of_each(2) > 0
       if coordinate_of_each(2) + sqrt(3)*coordinate_of_each(1) - sqrt(3) * len_hex <= 0
           coordinate = [coordinate;coordinate_of_each];
           valid_num = valid_num + 1;
       end
   elseif coordinate_of_each(1) < 0 & coordinate_of_each(2) > 0
       if coordinate_of_each(2) - sqrt(3)*coordinate_of_each(1) - sqrt(3) * len_hex <= 0
           coordinate = [coordinate;coordinate_of_each];
           valid_num = valid_num + 1;
       end
   elseif coordinate_of_each(1) < 0 & coordinate_of_each(2) < 0
       if coordinate_of_each(2) + sqrt(3)*coordinate_of_each(1) + sqrt(3) * len_hex >= 0
           coordinate = [coordinate;coordinate_of_each];
           valid_num = valid_num + 1;
       end
   elseif coordinate_of_each(1) > 0 & coordinate_of_each(2) < 0
       if coordinate_of_each(2) - sqrt(3)*coordinate_of_each(1) + sqrt(3) * len_hex >= 0
           coordinate = [coordinate;coordinate_of_each];
           valid_num = valid_num + 1;
       end
   end
   coordinate_of_each = []
end
center  = repmat(center,num_of_user,1);
output = coordinate + center;
X = output(:,1);
Y = output(:,2);
end

       
    
    


