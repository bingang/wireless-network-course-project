function nothing = Show_Specific_Mobile_Movement(all_mobile_coordinate,num_of_bs,user_index)

animate = animatedline('Marker' ,'o','MarkerSize',1);
nothing = 0;
X_mobile     = all_mobile_coordinate(:,1);
Y_mobile     = all_mobile_coordinate(:,2);
addpoints(animate,X_mobile(user_index),Y_mobile(user_index));
drawnow 
end
  %{
bs_of_mobile = all_mobile_coordinate(:,3);
bs_of_mobile = double(bs_of_mobile); 
num_of_user = size(all_mobile_coordinate,1);
color = zeros(num_of_user,3);
background_color = 0.2;
 for i = 1 : num_of_user
     if rem(bs_of_mobile(i),3) == 0
         color(i,:) = [bs_of_mobile(i)/num_of_bs background_color  background_color ];
     elseif rem(bs_of_mobile(i),3) == 1
         color(i,:) = [background_color bs_of_mobile(i)/num_of_bs  background_color ];
     elseif rem(bs_of_mobile(i),3) == 2
         color(i,:) = [background_color background_color bs_of_mobile(i)/num_of_bs ];
     end
 end
 scatter(X_mobile,Y_mobile,50,color,'filled');
 hold on;
 BS_label_for_mobile    = num2str(bs_of_mobile);  BS_label_for_mobile = cellstr(BS_label_for_mobile); 
 label = strcat({'   '},BS_label_for_mobile);
 text(X_mobile,Y_mobile,label,'FontSize',7);
 %}
