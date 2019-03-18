%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Parameter configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_of_user = 40;
inter_side_distance = 500;
simulation_time = 100;
minSpeed = 0;
maxSpeed = 500;
drop_threshold = 0.25; %How to choose proper value
delta_of_ping_pang = 20;
delta_of_ping_pang_ON = 0; % 1 : ON, 0 :OFF
metric_chosen = 1 % 1 : SINR_Other, 2 : Power_Other
drop_accum_time = zeros(num_of_user,1);
num_handover = zeros(num_of_user,1);
num_reconnection = zeros(num_of_user,1);
ALL_TRACE = [];
ALL_BS_mobile_been_to = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of BS coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bs_coordinate = Construction_of_BS_coordinate(inter_side_distance);
num_of_bs = size(bs_coordinate,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Construction of  moobile coordinate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coordinate_of_mobile = Construction_of_mobile_coordinate(num_of_user,bs_coordinate,inter_side_distance);
mobile_coordinate       = coordinate_of_mobile(:,1:2);
Bs_of_mobile_coordinate = coordinate_of_mobile(:,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Show_Backgrou b d(Base Station) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nothing = Show_Background(bs_coordinate,inter_side_distance);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  mobile move %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for time = 1: simulation_time
  mobile_coordinate = random_walk(num_of_user,inter_side_distance, mobile_coordinate, Bs_of_mobile_coordinate,bs_coordinate,minSpeed,maxSpeed);
  [Power_Itself Power_Other SINR_Itself SINR_Other Interference_Itself] = Calculate_Power_and_SINR(mobile_coordinate,Bs_of_mobile_coordinate,bs_coordinate)
  % Handoff  mechanism HERE!!!!!!!!!!!!!!!!!!! 
  [ Bs_of_mobile_coordinate drop_accum_time num_handover num_reconnection] = Handoff(inter_side_distance,mobile_coordinate,bs_coordinate,drop_accum_time,num_handover,num_reconnection,SINR_Other,Power_Other,delta_of_ping_pang,drop_threshold,delta_of_ping_pang_ON,metric_chosen,Bs_of_mobile_coordinate)
  ALL_TRACE = [ ALL_TRACE ; mobile_coordinate];
  ALL_BS_mobile_been_to = [ALL_BS_mobile_been_to ;  Bs_of_mobile_coordinate];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Measurement of handover  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 subplot(3,1,1)  
 plot(drop_accum_time/simulation_time,'Marker','o')
 title('RATIO of drop time during simulation time');
 subplot(3,1,2)  
 plot(num_handover/simulation_time,'Marker','o')
 title('RATIO of handover during simulation time');
 subplot(3,1,3)  
 plot(num_reconnection/simulation_time,'Marker','o');
 title('RATIO of reconnection during simulation time');

