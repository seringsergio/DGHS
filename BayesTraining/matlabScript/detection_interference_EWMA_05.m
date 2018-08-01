
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_05      = sum( det_int_0_EWMA_05 == 0); 
percentage_det_int_0_EWMA_05 = count_det_int_0_EWMA_05 / size(det_int_0_EWMA_05,1) * 100;

% 10
count_det_int_10_EWMA_05      = sum( det_int_10_EWMA_05 == 10); 
percentage_det_int_10_EWMA_05 = count_det_int_10_EWMA_05 / size(det_int_10_EWMA_05,1) * 100;

% 20
count_det_int_20_EWMA_05      = sum( det_int_20_EWMA_05 == 20); 
percentage_det_int_20_EWMA_05 = count_det_int_20_EWMA_05 / size(det_int_20_EWMA_05,1) * 100;

% 30
count_det_int_30_EWMA_05      = sum( det_int_30_EWMA_05 == 30); 
percentage_det_int_30_EWMA_05 = count_det_int_30_EWMA_05 / size(det_int_30_EWMA_05,1) * 100;

% 40
count_det_int_40_EWMA_05      = sum( det_int_40_EWMA_05 == 40); 
percentage_det_int_40_EWMA_05 = count_det_int_40_EWMA_05 / size(det_int_40_EWMA_05,1) * 100;

% 50
count_det_int_50_EWMA_05      = sum( det_int_50_EWMA_05 == 50); 
percentage_det_int_50_EWMA_05 = count_det_int_50_EWMA_05 / size(det_int_50_EWMA_05,1) * 100;

% 60
count_det_int_60_EWMA_05      = sum( det_int_60_EWMA_05 == 60); 
percentage_det_int_60_EWMA_05 = count_det_int_60_EWMA_05 / size(det_int_60_EWMA_05,1) * 100;

% 70
count_det_int_70_EWMA_05      = sum( det_int_70_EWMA_05 == 70); 
percentage_det_int_70_EWMA_05 = count_det_int_70_EWMA_05 / size(det_int_70_EWMA_05,1) * 100;

% 80
count_det_int_80_EWMA_05      = sum( det_int_80_EWMA_05 == 80); 
percentage_det_int_80_EWMA_05 = count_det_int_80_EWMA_05 / size(det_int_80_EWMA_05,1) * 100;

% 90
count_det_int_90_EWMA_05      = sum( det_int_90_EWMA_05 == 90); 
percentage_det_int_90_EWMA_05 = count_det_int_90_EWMA_05 / size(det_int_90_EWMA_05,1) * 100;

% 100
count_det_int_100_EWMA_05      = sum( det_int_100_EWMA_05 == 100); 
percentage_det_int_100_EWMA_05 = count_det_int_100_EWMA_05 / size(det_int_100_EWMA_05,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_05 = [percentage_det_int_0_EWMA_05
                                  percentage_det_int_10_EWMA_05
                                  percentage_det_int_20_EWMA_05
                                  percentage_det_int_30_EWMA_05
                                  percentage_det_int_40_EWMA_05
                                  percentage_det_int_50_EWMA_05
                                  percentage_det_int_60_EWMA_05
                                  percentage_det_int_70_EWMA_05
                                  percentage_det_int_80_EWMA_05
                                  percentage_det_int_90_EWMA_05
                                  percentage_det_int_100_EWMA_05                       
                                  ]; 

mean_int_0_EWMA_05  =  mean(det_int_0_EWMA_05);
mean_int_10_EWMA_05 =  mean(det_int_10_EWMA_05);
mean_int_20_EWMA_05 =  mean(det_int_20_EWMA_05);
mean_int_30_EWMA_05 =  mean(det_int_30_EWMA_05);
mean_int_40_EWMA_05 =  mean(det_int_40_EWMA_05);
mean_int_50_EWMA_05 =  mean(det_int_50_EWMA_05);
mean_int_60_EWMA_05 =  mean(det_int_60_EWMA_05);
mean_int_70_EWMA_05 =  mean(det_int_70_EWMA_05);
mean_int_80_EWMA_05 =  mean(det_int_80_EWMA_05);
mean_int_90_EWMA_05 =  mean(det_int_90_EWMA_05);
mean_int_100_EWMA_05 =  mean(det_int_100_EWMA_05);

std_int_0_EWMA_05  =  std(det_int_0_EWMA_05);
std_int_10_EWMA_05 =  std(det_int_10_EWMA_05);
std_int_20_EWMA_05 =  std(det_int_20_EWMA_05);
std_int_30_EWMA_05 =  std(det_int_30_EWMA_05);
std_int_40_EWMA_05 =  std(det_int_40_EWMA_05);
std_int_50_EWMA_05 =  std(det_int_50_EWMA_05);
std_int_60_EWMA_05 =  std(det_int_60_EWMA_05);
std_int_70_EWMA_05 =  std(det_int_70_EWMA_05);
std_int_80_EWMA_05 =  std(det_int_80_EWMA_05);
std_int_90_EWMA_05 =  std(det_int_90_EWMA_05);
std_int_100_EWMA_05 =  std(det_int_100_EWMA_05);

error_int_0_EWMA_05  = abs(0  - mean(det_int_0_EWMA_05));
error_int_10_EWMA_05 = abs(10 - mean(det_int_10_EWMA_05));
error_int_20_EWMA_05 = abs(20 - mean(det_int_20_EWMA_05));
error_int_30_EWMA_05 = abs(30 - mean(det_int_30_EWMA_05));
error_int_40_EWMA_05 = abs(40 - mean(det_int_40_EWMA_05));
error_int_50_EWMA_05 = abs(50 - mean(det_int_50_EWMA_05));
error_int_60_EWMA_05 = abs(60 - mean(det_int_60_EWMA_05));
error_int_70_EWMA_05 = abs(70 - mean(det_int_70_EWMA_05));
error_int_80_EWMA_05 = abs(80 - mean(det_int_80_EWMA_05));
error_int_90_EWMA_05 = abs(90 - mean(det_int_90_EWMA_05));
error_int_100_EWMA_05 = abs(100 - mean(det_int_100_EWMA_05));

% vectors 
mean_int_vec_EWMA_05   = [mean_int_0_EWMA_05 mean_int_10_EWMA_05 mean_int_20_EWMA_05 mean_int_30_EWMA_05 mean_int_40_EWMA_05 mean_int_50_EWMA_05 mean_int_60_EWMA_05 mean_int_70_EWMA_05 mean_int_80_EWMA_05 mean_int_90_EWMA_05 mean_int_100_EWMA_05]
std_int_vec_EWMA_05   = [std_int_0_EWMA_05 std_int_10_EWMA_05 std_int_20_EWMA_05 std_int_30_EWMA_05 std_int_40_EWMA_05 std_int_50_EWMA_05 std_int_60_EWMA_05 std_int_70_EWMA_05 std_int_80_EWMA_05 std_int_90_EWMA_05 std_int_100_EWMA_05]
error_int_vec_EWMA_05  = [error_int_0_EWMA_05 error_int_10_EWMA_05 error_int_20_EWMA_05 error_int_30_EWMA_05 error_int_40_EWMA_05 error_int_50_EWMA_05 error_int_60_EWMA_05 error_int_70_EWMA_05 error_int_80_EWMA_05 error_int_90_EWMA_05 error_int_100_EWMA_05]


