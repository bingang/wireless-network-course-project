function  [  Bs_of_mobile_coordinate drop_time num_handover num_reconnection] = Handoff(inter_side_distance,mobile_coordinate,bs_coordinate,drop_time,num_handover,num_reconnection,SINR_Other,Power_Other,delta_of_ping_pang,drop_threshold,delta_of_ping_pang_ON,metric_chosen,Bs_of_mobile_coordinate)
Location_of_mobile_coordinate = mobile_coordinate(:,1:2);
num_of_user = size(mobile_coordinate,1);
num_of_bs   = size(bs_coordinate,1);
if metric_chosen == 1
    metric = SINR_Other;
elseif metric_chosen == 0
    metric = Power_Other;
end
% -1 mean dropping
for mobile_index = 1: num_of_user
    [M,I] = max(metric( ( mobile_index -1 )*num_of_bs + 1 :mobile_index*num_of_bs));
            if M < drop_threshold  
                Bs_of_mobile_coordinate(mobile_index) = -1;
                drop_time(mobile_index) = drop_time(mobile_index) + 1;
            elseif   I ~= Bs_of_mobile_coordinate(mobile_index)
                if delta_of_ping_pang_ON == 1 
                    mobile_location = Location_of_mobile_coordinate(mobile_index,:);
                    rough_distance_to_boundary = closet_dis_to_BS(bs_coordinate,mobile_location,inter_side_distance);    
                  if rough_distance_to_boundary > delta_of_ping_pang
                    if  Bs_of_mobile_coordinate(mobile_index) ~= -1
                       num_handover(mobile_index) = num_handover(mobile_index) + 1;
                    elseif  Bs_of_mobile_coordinate(mobile_index) == -1
                       num_reconnection(mobile_index) = num_reconnection(mobile_index) + 1;
                    end
                    Bs_of_mobile_coordinate(mobile_index) = I;
                  end
                else   
                    if  Bs_of_mobile_coordinate(mobile_index) ~= -1
                       num_handover(mobile_index) = num_handover(mobile_index) + 1;
                    elseif  Bs_of_mobile_coordinate(mobile_index) == -1
                       
                       num_reconnection(mobile_index) = num_reconnection(mobile_index) + 1;
                    end
                    Bs_of_mobile_coordinate(mobile_index) = I;
                end
            else
                if Bs_of_mobile_coordinate(mobile_index) == -1
                  drop_time(mobile_index) = drop_time(mobile_index) + 1;
                end   
            end
            
              
            
        end
        
   
    



end