function rough_distance_to_boundary = closet_dis_to_BS(Bs_coordinate,mobile_location,inter_side_distance)
    bs_coordinate = Bs_coordinate(:,1:2);
   if mobile_location(1) >= 0       
        if mobile_location(2) >= 0   %1
           A = [ bs_coordinate(1,:) ; bs_coordinate(2,:) ;bs_coordinate(3,:) ;bs_coordinate(8,:); bs_coordinate(9,:) ;bs_coordinate(10,:) ;bs_coordinate(11,:) ];
           a = (A - mobile_location).^2;
           disance_of_all = a(:,1) + a(:,2);
           [M I] = min(disance_of_all);
        else                         %4
           A = [ bs_coordinate(6,:); bs_coordinate(7,:) ;bs_coordinate(17,:); bs_coordinate(18,:); bs_coordinate(19,:) ] ;
           a = (A - mobile_location).^2;
           disance_of_all = a(:,1) + a(:,2);
           [M I] = min(disance_of_all);
        end
    else 
        if mobile_location(2) >= 0   %2
           A = [ bs_coordinate(4,:); bs_coordinate(12,:) ;bs_coordinate(13,:) ; bs_coordinate(14,:) ];
           a = (A - mobile_location).^2;
           disance_of_all = a(:,1) + a(:,2);
           [M I] = min(disance_of_all);
        else                         %3
           A = [ bs_coordinate(6,:) ; bs_coordinate(15,:); bs_coordinate(16,:) ];
           a = (A - mobile_location).^2;
           disance_of_all = a(:,1) + a(:,2);
           [M I] = min(disance_of_all);
        end       
    end
      rough_distance_to_boundary = (inter_side_distance/2) - M;

end