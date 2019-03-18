% Inital State without movement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Parameter configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inter_side_distance = 500;
simulation_time = 100;
num_of_user = size(ALL_TRACE,1)/simulation_time;
user_index = 1;
mobile_show = [];
BS_of_specific_mobile = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of BS coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bs_coordinate = Construction_of_BS_coordinate(inter_side_distance);
num_of_bs = size(bs_coordinate,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of  moobile coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : simulation_time 
 mobile_show = [ mobile_show ; ALL_TRACE((i -1 )*num_of_user + user_index ,:) ] ;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  BS_of_specific_mobile %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for i = 1 : simulation_time 
 BS_of_specific_mobile = [ BS_of_specific_mobile ; ALL_BS_mobile_been_to((i -1 )*num_of_user + user_index ,:) ] ;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
nothing = Show_Background(bs_coordinate,inter_side_distance);
animate = animatedline('Marker' ,'o','MarkerSize',1);
for time = 1 :simulation_time  
 %comet(mobile_show(time,1),mobile_show(time,2));  
 addpoints(animate,mobile_show(time,1),mobile_show(time,2));
drawnow 
end