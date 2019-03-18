%輸入 
%     1. 每一個cell有的user數目(num_of_user_each_cell)
%     2. 基地台位置(bs_coordinate)
%     3. 基地台之間的中心距離(inter_side_distance)
%輸出 
%     1. user位置
%       格式為 [X_coordinate_of_user Y_coordinate_of_user user 所屬的基地台編號]
%說明
%      給定user數目以及所有基地台位置，按照uniform distribution把這user分配到基地台
function mobile_coordinate = Construction_of_mobile_coordinate(num_of_user,bs_coordinate,inter_side_distance)
location_at_bs = double(int16(1 + 18*rand(num_of_user,1)));
mobile_coordinate = [];
num_of_user_each_cell = 1
for i = 1:num_of_user
    bs_index = location_at_bs(i);
    each_cell_mobile_coordinate = [gen_user_in_hexgaon(num_of_user_each_cell,bs_coordinate(bs_index,1:2),inter_side_distance),bs_index];
    mobile_coordinate = [mobile_coordinate ; each_cell_mobile_coordinate];
end
end