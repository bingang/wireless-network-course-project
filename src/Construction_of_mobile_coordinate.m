%��J 
%     1. �C�@��cell����user�ƥ�(num_of_user_each_cell)
%     2. ��a�x��m(bs_coordinate)
%     3. ��a�x���������߶Z��(inter_side_distance)
%��X 
%     1. user��m
%       �榡�� [X_coordinate_of_user Y_coordinate_of_user user ���ݪ���a�x�s��]
%����
%      ���wuser�ƥإH�ΩҦ���a�x��m�A����uniform distribution��ouser���t���a�x
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