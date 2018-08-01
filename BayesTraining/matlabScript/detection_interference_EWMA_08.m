
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_08      = sum( det_int_0_EWMA_08 == 0); 
percentage_det_int_0_EWMA_08 = count_det_int_0_EWMA_08 / size(det_int_0_EWMA_08,1) * 100;

% 10
count_det_int_10_EWMA_08      = sum( det_int_10_EWMA_08 == 10); 
percentage_det_int_10_EWMA_08 = count_det_int_10_EWMA_08 / size(det_int_10_EWMA_08,1) * 100;

% 20
count_det_int_20_EWMA_08      = sum( det_int_20_EWMA_08 == 20); 
percentage_det_int_20_EWMA_08 = count_det_int_20_EWMA_08 / size(det_int_20_EWMA_08,1) * 100;

% 30
count_det_int_30_EWMA_08      = sum( det_int_30_EWMA_08 == 30); 
percentage_det_int_30_EWMA_08 = count_det_int_30_EWMA_08 / size(det_int_30_EWMA_08,1) * 100;

% 40
count_det_int_40_EWMA_08      = sum( det_int_40_EWMA_08 == 40); 
percentage_det_int_40_EWMA_08 = count_det_int_40_EWMA_08 / size(det_int_40_EWMA_08,1) * 100;

% 50
count_det_int_50_EWMA_08      = sum( det_int_50_EWMA_08 == 50); 
percentage_det_int_50_EWMA_08 = count_det_int_50_EWMA_08 / size(det_int_50_EWMA_08,1) * 100;

% 60
count_det_int_60_EWMA_08      = sum( det_int_60_EWMA_08 == 60); 
percentage_det_int_60_EWMA_08 = count_det_int_60_EWMA_08 / size(det_int_60_EWMA_08,1) * 100;

% 70
count_det_int_70_EWMA_08      = sum( det_int_70_EWMA_08 == 70); 
percentage_det_int_70_EWMA_08 = count_det_int_70_EWMA_08 / size(det_int_70_EWMA_08,1) * 100;

% 80
count_det_int_80_EWMA_08      = sum( det_int_80_EWMA_08 == 80); 
percentage_det_int_80_EWMA_08 = count_det_int_80_EWMA_08 / size(det_int_80_EWMA_08,1) * 100;

% 90
count_det_int_90_EWMA_08      = sum( det_int_90_EWMA_08 == 90); 
percentage_det_int_90_EWMA_08 = count_det_int_90_EWMA_08 / size(det_int_90_EWMA_08,1) * 100;

% 100
count_det_int_100_EWMA_08      = sum( det_int_100_EWMA_08 == 100); 
percentage_det_int_100_EWMA_08 = count_det_int_100_EWMA_08 / size(det_int_100_EWMA_08,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_08 = [percentage_det_int_0_EWMA_08
                                  percentage_det_int_10_EWMA_08
                                  percentage_det_int_20_EWMA_08
                                  percentage_det_int_30_EWMA_08
                                  percentage_det_int_40_EWMA_08
                                  percentage_det_int_50_EWMA_08
                                  percentage_det_int_60_EWMA_08
                                  percentage_det_int_70_EWMA_08
                                  percentage_det_int_80_EWMA_08
                                  percentage_det_int_90_EWMA_08
                                  percentage_det_int_100_EWMA_08                       
                                  ]; 

mean_int_0_EWMA_08  =  mean(det_int_0_EWMA_08);
mean_int_10_EWMA_08 =  mean(det_int_10_EWMA_08);
mean_int_20_EWMA_08 =  mean(det_int_20_EWMA_08);
mean_int_30_EWMA_08 =  mean(det_int_30_EWMA_08);
mean_int_40_EWMA_08 =  mean(det_int_40_EWMA_08);
mean_int_50_EWMA_08 =  mean(det_int_50_EWMA_08);
mean_int_60_EWMA_08 =  mean(det_int_60_EWMA_08);
mean_int_70_EWMA_08 =  mean(det_int_70_EWMA_08);
mean_int_80_EWMA_08 =  mean(det_int_80_EWMA_08);
mean_int_90_EWMA_08 =  mean(det_int_90_EWMA_08);
mean_int_100_EWMA_08 =  mean(det_int_100_EWMA_08);

std_int_0_EWMA_08  =  std(det_int_0_EWMA_08);
std_int_10_EWMA_08 =  std(det_int_10_EWMA_08);
std_int_20_EWMA_08 =  std(det_int_20_EWMA_08);
std_int_30_EWMA_08 =  std(det_int_30_EWMA_08);
std_int_40_EWMA_08 =  std(det_int_40_EWMA_08);
std_int_50_EWMA_08 =  std(det_int_50_EWMA_08);
std_int_60_EWMA_08 =  std(det_int_60_EWMA_08);
std_int_70_EWMA_08 =  std(det_int_70_EWMA_08);
std_int_80_EWMA_08 =  std(det_int_80_EWMA_08);
std_int_90_EWMA_08 =  std(det_int_90_EWMA_08);
std_int_100_EWMA_08 =  std(det_int_100_EWMA_08);

error_int_0_EWMA_08  = abs(0  - mean(det_int_0_EWMA_08));
error_int_10_EWMA_08 = abs(10 - mean(det_int_10_EWMA_08));
error_int_20_EWMA_08 = abs(20 - mean(det_int_20_EWMA_08));
error_int_30_EWMA_08 = abs(30 - mean(det_int_30_EWMA_08));
error_int_40_EWMA_08 = abs(40 - mean(det_int_40_EWMA_08));
error_int_50_EWMA_08 = abs(50 - mean(det_int_50_EWMA_08));
error_int_60_EWMA_08 = abs(60 - mean(det_int_60_EWMA_08));
error_int_70_EWMA_08 = abs(70 - mean(det_int_70_EWMA_08));
error_int_80_EWMA_08 = abs(80 - mean(det_int_80_EWMA_08));
error_int_90_EWMA_08 = abs(90 - mean(det_int_90_EWMA_08));
error_int_100_EWMA_08 = abs(100 - mean(det_int_100_EWMA_08));

% vectors 
mean_int_vec_EWMA_08   = [mean_int_0_EWMA_08 mean_int_10_EWMA_08 mean_int_20_EWMA_08 mean_int_30_EWMA_08 mean_int_40_EWMA_08 mean_int_50_EWMA_08 mean_int_60_EWMA_08 mean_int_70_EWMA_08 mean_int_80_EWMA_08 mean_int_90_EWMA_08 mean_int_100_EWMA_08]
std_int_vec_EWMA_08   = [std_int_0_EWMA_08 std_int_10_EWMA_08 std_int_20_EWMA_08 std_int_30_EWMA_08 std_int_40_EWMA_08 std_int_50_EWMA_08 std_int_60_EWMA_08 std_int_70_EWMA_08 std_int_80_EWMA_08 std_int_90_EWMA_08 std_int_100_EWMA_08]
error_int_vec_EWMA_08  = [error_int_0_EWMA_08 error_int_10_EWMA_08 error_int_20_EWMA_08 error_int_30_EWMA_08 error_int_40_EWMA_08 error_int_50_EWMA_08 error_int_60_EWMA_08 error_int_70_EWMA_08 error_int_80_EWMA_08 error_int_90_EWMA_08 error_int_100_EWMA_08]


