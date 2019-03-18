% 51 �� �i�H���propagation model
%��J 
%     1. user��m(mobile_coordinate)
%     2. ��a�x��m(bs_coordinate)
%��X 
%     1. Power_Itself
%       �x�}�j�p�� num_of_user * 1
%       ��� : db
%       ����
%       Power_Itself(n) : ����n��user�q�ۤv���ݰ�a�x���쪺Power
%     2. Power_Other
%       �x�}�j�p�� (num_of_user*num_of_bs) * 1
%       ��� : db
%       ����
%       Power_Other(num_of_bs*(n-1) + 1) ~ Other_SINR(num_of_bs*n) :  ����n��user�q��1�Ӱ�a�x���19�Ӱ�a�x���쪺Power
%     3. SINR_Itself
%       �x�}�j�p�� num_of_user * 1
%       ����
%       SINR_Itself(n) : ����n��user�q�ۤv���ݰ�a�x���쪺SINR
%     4. Other_SINR 
%       �x�}�j�p�� (num_of_user*num_of_bs) * 1
%       ����
%       Other_SINR(num_of_bs*(n-1) + 1) ~ Other_SINR(num_of_bs*n) :  ����n��user�q��1�Ӱ�a�x���19�Ӱ�a�x���쪺SINR
%     5. Interference_Itself 
%       �x�}�j�p�� num_of_user * 1
%       ��� : db
%       ����
%       Interference_Itself(n) : ����n��user�q�ۤv���ݰ�a�x���쪺Interference
function [Power_Itself Power_Other SINR_Itself SINR_Other Interference_Itself] = Calculate_Power_and_SINR(mobile_coordinate,Bs_of_mobile_coordinate,bs_coordinate)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calculate Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Power_trans = 33;     %dBm
 Power_mobile = 0;     %dBm
 Gain_trans_ante = 14;
 Gain_rece_ante = 14;
 Height_base = 51.5;
 Height_rece = 1.5;
 mean_of_shadowing = 0;
 deviation_of_shadowing = 8;
 mobile_coordinate_bs = Bs_of_mobile_coordinate;
 BS_coordinate = bs_coordinate(:,1:2);
 Power_of_bs_rece = [];
 dis = [];
 num_of_user = size(mobile_coordinate,1);
 num_of_bs = size(BS_coordinate,1);
 
 for mobile_index = 1 : num_of_user
     for bs_index = 1 : num_of_bs
        dis_vector = mobile_coordinate(mobile_index,:)- BS_coordinate( bs_index,: );
        distance = sqrt((dis_vector(1))^2+(dis_vector(2))^2);
        Power_rece =  Two_Ray_Model(Power_trans,Gain_trans_ante,Gain_rece_ante,Height_base,Height_rece,distance)
                    + Log_Normal_Shadowing(mean_of_shadowing,deviation_of_shadowing);
        dis = [dis;distance];
        Power_of_bs_rece = [Power_of_bs_rece;Power_rece];
     end
 end  
 Power_Itself = [];
 Power_Other = [];
 Power_Other = Power_of_bs_rece;
 for mobile_index = 1 : num_of_user
    if mobile_coordinate_bs(mobile_index) == -1
      Power_Itself = [Power_Itself ; 0]
    else
      Power_Itself = [Power_Itself ; Power_Other(mobile_coordinate_bs(mobile_index) + (mobile_index -1)*num_of_bs)]
    end
 end
 Power_of_bs_rece = power(10,Power_of_bs_rece/10);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calculate Intereference %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 All_Interference = [];
 for mobile_index = 1 : num_of_user
     Interference = 0;
     for i = 1 : num_of_bs      
         Interference = Interference + Power_of_bs_rece(i+ (mobile_index-1)*num_of_bs );          
     end     
     for i = 1 : num_of_bs        
         All_Interference = [All_Interference ; (Interference - Power_of_bs_rece(i + (mobile_index -1)*num_of_bs ))];
     end
     
 end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Interference Itself %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Interference_Itself = [];
for mobile_index = 1 : num_of_user
    if mobile_coordinate_bs(mobile_index) == -1
        Interference_Itself = [Interference_Itself ; 0 ];
    else
        Interference_Itself = [Interference_Itself ; All_Interference(mobile_coordinate_bs(mobile_index) + (mobile_index -1)*num_of_bs) ];
    end
end
Interference_Itself = power(10,Interference_Itself/10);%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Calculate SINR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Denominator_Of_SINR = []
SINR_Itself = [];
bandwidth = 10* 10^6;   %Hz
temperature = 27;       %Celsius
Thermal_Noise =  physconst('Boltzmann') * (temperature+273) * bandwidth;
Noise = wgn(num_of_bs*num_of_user,1,0) + Thermal_Noise
Denominator_Of_SINR = All_Interference + Noise;
SINR_Other = Power_of_bs_rece ./ Denominator_Of_SINR;
for mobile_index = 1 : num_of_user
    if mobile_coordinate_bs(mobile_index) ~= -1
        SINR_Itself = [ SINR_Itself ; SINR_Other(mobile_coordinate_bs(mobile_index) + (mobile_index -1)*num_of_bs) ];
    else
        SINR_Itself = [ SINR_Itself ; 0 ];
    end
end

end