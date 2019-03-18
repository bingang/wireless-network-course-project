% Inital State without movement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Parameter configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_of_user = 5;
inter_side_distance = 500;
simulation_time = 100;
minSpeed = 0;
maxSpeed = 50;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of BS coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bs_coordinate = Construction_of_BS_coordinate(inter_side_distance);
num_of_bs = size(bs_coordinate,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of  moobile coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mobile_coordinate = Construction_of_mobile_coordinate(num_of_user,bs_coordinate,inter_side_distance);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
nothing = Show_Background(bs_coordinate,inter_side_distance);
for time = 1 :simulation_time
    mobile_coordinate = random_walk(num_of_user,inter_side_distance,mobile_coordinate,bs_coordinate,minSpeed,maxSpeed)
    for user_index = 1 : num_of_user
      comet(mobile_coordinate(user_index,1),mobile_coordinate(user_index,2));
    end    
end