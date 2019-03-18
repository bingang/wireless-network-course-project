%產生基地台之間邊界位置
function boundary = gen_boundary_in_hexgaon(center,inter_side_distance)
len_hex = inter_side_distance/(sqrt(3)*2);
X = [len_hex*2 len_hex -len_hex -len_hex*2 -len_hex len_hex len_hex*2];
Y = [0 inter_side_distance/2 inter_side_distance/2 0 -inter_side_distance/2 -inter_side_distance/2 0];
X = X + center(1);
Y = Y + center(2);
boundary = line(X,Y);
end
%{
     UP_boundary = inter_side_distance/2;                                          <=                                                                 
     DOWN_boundary = -inter_side_distance/2;                                       >=                                                                     
     First_Quadrant_boundary = Y + sqrt(3)*X - sqrt(3) * len_hex    % 1 Quadrant   <=    
     Second_Quadrant_boundary = Y - sqrt(3)*X - sqrt(3) * len_hex     % 2 Quadrant <=     
     Third_Quadrant_boundary = Y + sqrt(3)*X + sqrt(3) * len_hex     % 3 Quadrant  >=    
     Fourth_Quadrant_boundary = Y - sqrt(3)*X + sqrt(3) * len_hex     % 4 Quadrant >=     
%}

%{
     difference = -sqrt(3)*A + B ; 
     UP_boundary = inter_side_distance/2 + B;                                                     <=                                                                 
     DOWN_boundary = -inter_side_distance/2 + B;                                                  >=                                                                     
     First_Quadrant_boundary  = Y + sqrt(3)*X - sqrt(3) * len_hex - difference     % 1 Quadrant   <=    
     Second_Quadrant_boundary = Y - sqrt(3)*X - sqrt(3) * len_hex - difference     % 2 Quadrant   <=     
     Third_Quadrant_boundary  = Y + sqrt(3)*X + sqrt(3) * len_hex - difference     % 3 Quadrant   >=    
     Fourth_Quadrant_boundary = Y - sqrt(3)*X + sqrt(3) * len_hex - difference     % 4 Quadrant   >=     
%}





    
    


