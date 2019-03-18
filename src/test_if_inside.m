function IN = test_if_inside(center,inter_side_distance,test_point)
     len_hex = inter_side_distance/sqrt(3);
     A = center(1);
     B = center(2);
     X = test_point(1);
     Y = test_point(2);
     difference_1 =  sqrt(3)*A + B ; 
     difference_2 = -sqrt(3)*A + B ;
     UP_boundary = inter_side_distance/2 + B;                                      %               <=                                                                 
     DOWN_boundary = -inter_side_distance/2 + B;                                   %               >=
     IN = 0;
     if Y <= UP_boundary & Y >= DOWN_boundary
        if Y + sqrt(3)*X - sqrt(3) * len_hex - difference_1 <= 0     % First_Quadrant_boundary   <= 
            if  Y - sqrt(3)*X - sqrt(3) * len_hex - difference_2 <= 0     % Second_Quadrant_boundary   <=
                if Y + sqrt(3)*X + sqrt(3) * len_hex - difference_1 >= 0     % Third_Quadrant_boundary   >=
                    if Y - sqrt(3)*X + sqrt(3) * len_hex - difference_2 >= 0     % Fourth_Quadrant_boundary   >=
                        IN = 1;
                    end    
                end     
            end
        end
     end
end
