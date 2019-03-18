function nothing = Show_Background(bs_coordinate,inter_side_distance)
 nothing = 0;
 X_bs     = bs_coordinate(:,1);
 Y_bs     = bs_coordinate(:,2);
 index_bs = bs_coordinate(:,3);
 scatter(X_bs,Y_bs,100,[0 0 0],'filled','diamond');
 hold on;
 BS_label= num2str(index_bs);  BS_label = cellstr(BS_label);
 num_of_bs = size(bs_coordinate,1);
 for i = 1 : num_of_bs
     gen_boundary_in_hexgaon(bs_coordinate(i,1:2),inter_side_distance)
     hold on;
 end
 text(X_bs, Y_bs, BS_label,'Color','black','FontSize',14) 
 title('Mobile Distribution');
 xlabel('X in meter');
 ylabel('Y in meter');
end