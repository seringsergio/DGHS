
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_09      = sum( det_int_0_EWMA_09 == 0); 
percentage_det_int_0_EWMA_09 = count_det_int_0_EWMA_09 / size(det_int_0_EWMA_09,1) * 100;

% 10
count_det_int_10_EWMA_09      = sum( det_int_10_EWMA_09 == 10); 
percentage_det_int_10_EWMA_09 = count_det_int_10_EWMA_09 / size(det_int_10_EWMA_09,1) * 100;

% 20
count_det_int_20_EWMA_09      = sum( det_int_20_EWMA_09 == 20); 
percentage_det_int_20_EWMA_09 = count_det_int_20_EWMA_09 / size(det_int_20_EWMA_09,1) * 100;

% 30
count_det_int_30_EWMA_09      = sum( det_int_30_EWMA_09 == 30); 
percentage_det_int_30_EWMA_09 = count_det_int_30_EWMA_09 / size(det_int_30_EWMA_09,1) * 100;

% 40
count_det_int_40_EWMA_09      = sum( det_int_40_EWMA_09 == 40); 
percentage_det_int_40_EWMA_09 = count_det_int_40_EWMA_09 / size(det_int_40_EWMA_09,1) * 100;

% 50
count_det_int_50_EWMA_09      = sum( det_int_50_EWMA_09 == 50); 
percentage_det_int_50_EWMA_09 = count_det_int_50_EWMA_09 / size(det_int_50_EWMA_09,1) * 100;

% 60
count_det_int_60_EWMA_09      = sum( det_int_60_EWMA_09 == 60); 
percentage_det_int_60_EWMA_09 = count_det_int_60_EWMA_09 / size(det_int_60_EWMA_09,1) * 100;

% 70
count_det_int_70_EWMA_09      = sum( det_int_70_EWMA_09 == 70); 
percentage_det_int_70_EWMA_09 = count_det_int_70_EWMA_09 / size(det_int_70_EWMA_09,1) * 100;

% 80
count_det_int_80_EWMA_09      = sum( det_int_80_EWMA_09 == 80); 
percentage_det_int_80_EWMA_09 = count_det_int_80_EWMA_09 / size(det_int_80_EWMA_09,1) * 100;

% 90
count_det_int_90_EWMA_09      = sum( det_int_90_EWMA_09 == 90); 
percentage_det_int_90_EWMA_09 = count_det_int_90_EWMA_09 / size(det_int_90_EWMA_09,1) * 100;

% 100
count_det_int_100_EWMA_09      = sum( det_int_100_EWMA_09 == 100); 
percentage_det_int_100_EWMA_09 = count_det_int_100_EWMA_09 / size(det_int_100_EWMA_09,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_09 = [percentage_det_int_0_EWMA_09
                                  percentage_det_int_10_EWMA_09
                                  percentage_det_int_20_EWMA_09
                                  percentage_det_int_30_EWMA_09
                                  percentage_det_int_40_EWMA_09
                                  percentage_det_int_50_EWMA_09
                                  percentage_det_int_60_EWMA_09
                                  percentage_det_int_70_EWMA_09
                                  percentage_det_int_80_EWMA_09
                                  percentage_det_int_90_EWMA_09
                                  percentage_det_int_100_EWMA_09                       
                                  ]; 

mean_int_0_EWMA_09  =  mean(det_int_0_EWMA_09);
mean_int_10_EWMA_09 =  mean(det_int_10_EWMA_09);
mean_int_20_EWMA_09 =  mean(det_int_20_EWMA_09);
mean_int_30_EWMA_09 =  mean(det_int_30_EWMA_09);
mean_int_40_EWMA_09 =  mean(det_int_40_EWMA_09);
mean_int_50_EWMA_09 =  mean(det_int_50_EWMA_09);
mean_int_60_EWMA_09 =  mean(det_int_60_EWMA_09);
mean_int_70_EWMA_09 =  mean(det_int_70_EWMA_09);
mean_int_80_EWMA_09 =  mean(det_int_80_EWMA_09);
mean_int_90_EWMA_09 =  mean(det_int_90_EWMA_09);
mean_int_100_EWMA_09 =  mean(det_int_100_EWMA_09);

std_int_0_EWMA_09  =  std(det_int_0_EWMA_09);
std_int_10_EWMA_09 =  std(det_int_10_EWMA_09);
std_int_20_EWMA_09 =  std(det_int_20_EWMA_09);
std_int_30_EWMA_09 =  std(det_int_30_EWMA_09);
std_int_40_EWMA_09 =  std(det_int_40_EWMA_09);
std_int_50_EWMA_09 =  std(det_int_50_EWMA_09);
std_int_60_EWMA_09 =  std(det_int_60_EWMA_09);
std_int_70_EWMA_09 =  std(det_int_70_EWMA_09);
std_int_80_EWMA_09 =  std(det_int_80_EWMA_09);
std_int_90_EWMA_09 =  std(det_int_90_EWMA_09);
std_int_100_EWMA_09 =  std(det_int_100_EWMA_09);

error_int_0_EWMA_09  = abs(0  - mean(det_int_0_EWMA_09));
error_int_10_EWMA_09 = abs(10 - mean(det_int_10_EWMA_09));
error_int_20_EWMA_09 = abs(20 - mean(det_int_20_EWMA_09));
error_int_30_EWMA_09 = abs(30 - mean(det_int_30_EWMA_09));
error_int_40_EWMA_09 = abs(40 - mean(det_int_40_EWMA_09));
error_int_50_EWMA_09 = abs(50 - mean(det_int_50_EWMA_09));
error_int_60_EWMA_09 = abs(60 - mean(det_int_60_EWMA_09));
error_int_70_EWMA_09 = abs(70 - mean(det_int_70_EWMA_09));
error_int_80_EWMA_09 = abs(80 - mean(det_int_80_EWMA_09));
error_int_90_EWMA_09 = abs(90 - mean(det_int_90_EWMA_09));
error_int_100_EWMA_09 = abs(100 - mean(det_int_100_EWMA_09));

% vectors 
mean_int_vec_EWMA_09   = [mean_int_0_EWMA_09 mean_int_10_EWMA_09 mean_int_20_EWMA_09 mean_int_30_EWMA_09 mean_int_40_EWMA_09 mean_int_50_EWMA_09 mean_int_60_EWMA_09 mean_int_70_EWMA_09 mean_int_80_EWMA_09 mean_int_90_EWMA_09 mean_int_100_EWMA_09]
std_int_vec_EWMA_09   = [std_int_0_EWMA_09 std_int_10_EWMA_09 std_int_20_EWMA_09 std_int_30_EWMA_09 std_int_40_EWMA_09 std_int_50_EWMA_09 std_int_60_EWMA_09 std_int_70_EWMA_09 std_int_80_EWMA_09 std_int_90_EWMA_09 std_int_100_EWMA_09]
error_int_vec_EWMA_09  = [error_int_0_EWMA_09 error_int_10_EWMA_09 error_int_20_EWMA_09 error_int_30_EWMA_09 error_int_40_EWMA_09 error_int_50_EWMA_09 error_int_60_EWMA_09 error_int_70_EWMA_09 error_int_80_EWMA_09 error_int_90_EWMA_09 error_int_100_EWMA_09]


