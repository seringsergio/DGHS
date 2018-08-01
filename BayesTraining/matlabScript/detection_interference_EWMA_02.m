
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_02      = sum( det_int_0_EWMA_02 == 0); 
percentage_det_int_0_EWMA_02 = count_det_int_0_EWMA_02 / size(det_int_0_EWMA_02,1) * 100;

% 10
count_det_int_10_EWMA_02      = sum( det_int_10_EWMA_02 == 10); 
percentage_det_int_10_EWMA_02 = count_det_int_10_EWMA_02 / size(det_int_10_EWMA_02,1) * 100;

% 20
count_det_int_20_EWMA_02      = sum( det_int_20_EWMA_02 == 20); 
percentage_det_int_20_EWMA_02 = count_det_int_20_EWMA_02 / size(det_int_20_EWMA_02,1) * 100;

% 30
count_det_int_30_EWMA_02      = sum( det_int_30_EWMA_02 == 30); 
percentage_det_int_30_EWMA_02 = count_det_int_30_EWMA_02 / size(det_int_30_EWMA_02,1) * 100;

% 40
count_det_int_40_EWMA_02      = sum( det_int_40_EWMA_02 == 40); 
percentage_det_int_40_EWMA_02 = count_det_int_40_EWMA_02 / size(det_int_40_EWMA_02,1) * 100;

% 50
count_det_int_50_EWMA_02      = sum( det_int_50_EWMA_02 == 50); 
percentage_det_int_50_EWMA_02 = count_det_int_50_EWMA_02 / size(det_int_50_EWMA_02,1) * 100;

% 60
count_det_int_60_EWMA_02      = sum( det_int_60_EWMA_02 == 60); 
percentage_det_int_60_EWMA_02 = count_det_int_60_EWMA_02 / size(det_int_60_EWMA_02,1) * 100;

% 70
count_det_int_70_EWMA_02      = sum( det_int_70_EWMA_02 == 70); 
percentage_det_int_70_EWMA_02 = count_det_int_70_EWMA_02 / size(det_int_70_EWMA_02,1) * 100;

% 80
count_det_int_80_EWMA_02      = sum( det_int_80_EWMA_02 == 80); 
percentage_det_int_80_EWMA_02 = count_det_int_80_EWMA_02 / size(det_int_80_EWMA_02,1) * 100;

% 90
count_det_int_90_EWMA_02      = sum( det_int_90_EWMA_02 == 90); 
percentage_det_int_90_EWMA_02 = count_det_int_90_EWMA_02 / size(det_int_90_EWMA_02,1) * 100;

% 100
count_det_int_100_EWMA_02      = sum( det_int_100_EWMA_02 == 100); 
percentage_det_int_100_EWMA_02 = count_det_int_100_EWMA_02 / size(det_int_100_EWMA_02,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_02 = [percentage_det_int_0_EWMA_02
                                  percentage_det_int_10_EWMA_02
                                  percentage_det_int_20_EWMA_02
                                  percentage_det_int_30_EWMA_02
                                  percentage_det_int_40_EWMA_02
                                  percentage_det_int_50_EWMA_02
                                  percentage_det_int_60_EWMA_02
                                  percentage_det_int_70_EWMA_02
                                  percentage_det_int_80_EWMA_02
                                  percentage_det_int_90_EWMA_02
                                  percentage_det_int_100_EWMA_02                       
                                  ]; 

mean_int_0_EWMA_02  =  mean(det_int_0_EWMA_02);
mean_int_10_EWMA_02 =  mean(det_int_10_EWMA_02);
mean_int_20_EWMA_02 =  mean(det_int_20_EWMA_02);
mean_int_30_EWMA_02 =  mean(det_int_30_EWMA_02);
mean_int_40_EWMA_02 =  mean(det_int_40_EWMA_02);
mean_int_50_EWMA_02 =  mean(det_int_50_EWMA_02);
mean_int_60_EWMA_02 =  mean(det_int_60_EWMA_02);
mean_int_70_EWMA_02 =  mean(det_int_70_EWMA_02);
mean_int_80_EWMA_02 =  mean(det_int_80_EWMA_02);
mean_int_90_EWMA_02 =  mean(det_int_90_EWMA_02);
mean_int_100_EWMA_02 =  mean(det_int_100_EWMA_02);

std_int_0_EWMA_02  =  std(det_int_0_EWMA_02);
std_int_10_EWMA_02 =  std(det_int_10_EWMA_02);
std_int_20_EWMA_02 =  std(det_int_20_EWMA_02);
std_int_30_EWMA_02 =  std(det_int_30_EWMA_02);
std_int_40_EWMA_02 =  std(det_int_40_EWMA_02);
std_int_50_EWMA_02 =  std(det_int_50_EWMA_02);
std_int_60_EWMA_02 =  std(det_int_60_EWMA_02);
std_int_70_EWMA_02 =  std(det_int_70_EWMA_02);
std_int_80_EWMA_02 =  std(det_int_80_EWMA_02);
std_int_90_EWMA_02 =  std(det_int_90_EWMA_02);
std_int_100_EWMA_02 =  std(det_int_100_EWMA_02);

error_int_0_EWMA_02  = abs(0  - mean(det_int_0_EWMA_02));
error_int_10_EWMA_02 = abs(10 - mean(det_int_10_EWMA_02));
error_int_20_EWMA_02 = abs(20 - mean(det_int_20_EWMA_02));
error_int_30_EWMA_02 = abs(30 - mean(det_int_30_EWMA_02));
error_int_40_EWMA_02 = abs(40 - mean(det_int_40_EWMA_02));
error_int_50_EWMA_02 = abs(50 - mean(det_int_50_EWMA_02));
error_int_60_EWMA_02 = abs(60 - mean(det_int_60_EWMA_02));
error_int_70_EWMA_02 = abs(70 - mean(det_int_70_EWMA_02));
error_int_80_EWMA_02 = abs(80 - mean(det_int_80_EWMA_02));
error_int_90_EWMA_02 = abs(90 - mean(det_int_90_EWMA_02));
error_int_100_EWMA_02 = abs(100 - mean(det_int_100_EWMA_02));

% vectors 
mean_int_vec_EWMA_02   = [mean_int_0_EWMA_02 mean_int_10_EWMA_02 mean_int_20_EWMA_02 mean_int_30_EWMA_02 mean_int_40_EWMA_02 mean_int_50_EWMA_02 mean_int_60_EWMA_02 mean_int_70_EWMA_02 mean_int_80_EWMA_02 mean_int_90_EWMA_02 mean_int_100_EWMA_02]
std_int_vec_EWMA_02   = [std_int_0_EWMA_02 std_int_10_EWMA_02 std_int_20_EWMA_02 std_int_30_EWMA_02 std_int_40_EWMA_02 std_int_50_EWMA_02 std_int_60_EWMA_02 std_int_70_EWMA_02 std_int_80_EWMA_02 std_int_90_EWMA_02 std_int_100_EWMA_02]
error_int_vec_EWMA_02  = [error_int_0_EWMA_02 error_int_10_EWMA_02 error_int_20_EWMA_02 error_int_30_EWMA_02 error_int_40_EWMA_02 error_int_50_EWMA_02 error_int_60_EWMA_02 error_int_70_EWMA_02 error_int_80_EWMA_02 error_int_90_EWMA_02 error_int_100_EWMA_02]


