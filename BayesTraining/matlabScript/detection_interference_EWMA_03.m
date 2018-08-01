
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_03      = sum( det_int_0_EWMA_03 == 0); 
percentage_det_int_0_EWMA_03 = count_det_int_0_EWMA_03 / size(det_int_0_EWMA_03,1) * 100;

% 10
count_det_int_10_EWMA_03      = sum( det_int_10_EWMA_03 == 10); 
percentage_det_int_10_EWMA_03 = count_det_int_10_EWMA_03 / size(det_int_10_EWMA_03,1) * 100;

% 20
count_det_int_20_EWMA_03      = sum( det_int_20_EWMA_03 == 20); 
percentage_det_int_20_EWMA_03 = count_det_int_20_EWMA_03 / size(det_int_20_EWMA_03,1) * 100;

% 30
count_det_int_30_EWMA_03      = sum( det_int_30_EWMA_03 == 30); 
percentage_det_int_30_EWMA_03 = count_det_int_30_EWMA_03 / size(det_int_30_EWMA_03,1) * 100;

% 40
count_det_int_40_EWMA_03      = sum( det_int_40_EWMA_03 == 40); 
percentage_det_int_40_EWMA_03 = count_det_int_40_EWMA_03 / size(det_int_40_EWMA_03,1) * 100;

% 50
count_det_int_50_EWMA_03      = sum( det_int_50_EWMA_03 == 50); 
percentage_det_int_50_EWMA_03 = count_det_int_50_EWMA_03 / size(det_int_50_EWMA_03,1) * 100;

% 60
count_det_int_60_EWMA_03      = sum( det_int_60_EWMA_03 == 60); 
percentage_det_int_60_EWMA_03 = count_det_int_60_EWMA_03 / size(det_int_60_EWMA_03,1) * 100;

% 70
count_det_int_70_EWMA_03      = sum( det_int_70_EWMA_03 == 70); 
percentage_det_int_70_EWMA_03 = count_det_int_70_EWMA_03 / size(det_int_70_EWMA_03,1) * 100;

% 80
count_det_int_80_EWMA_03      = sum( det_int_80_EWMA_03 == 80); 
percentage_det_int_80_EWMA_03 = count_det_int_80_EWMA_03 / size(det_int_80_EWMA_03,1) * 100;

% 90
count_det_int_90_EWMA_03      = sum( det_int_90_EWMA_03 == 90); 
percentage_det_int_90_EWMA_03 = count_det_int_90_EWMA_03 / size(det_int_90_EWMA_03,1) * 100;

% 100
count_det_int_100_EWMA_03      = sum( det_int_100_EWMA_03 == 100); 
percentage_det_int_100_EWMA_03 = count_det_int_100_EWMA_03 / size(det_int_100_EWMA_03,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_03 = [percentage_det_int_0_EWMA_03
                                  percentage_det_int_10_EWMA_03
                                  percentage_det_int_20_EWMA_03
                                  percentage_det_int_30_EWMA_03
                                  percentage_det_int_40_EWMA_03
                                  percentage_det_int_50_EWMA_03
                                  percentage_det_int_60_EWMA_03
                                  percentage_det_int_70_EWMA_03
                                  percentage_det_int_80_EWMA_03
                                  percentage_det_int_90_EWMA_03
                                  percentage_det_int_100_EWMA_03                       
                                  ]; 

mean_int_0_EWMA_03  =  mean(det_int_0_EWMA_03);
mean_int_10_EWMA_03 =  mean(det_int_10_EWMA_03);
mean_int_20_EWMA_03 =  mean(det_int_20_EWMA_03);
mean_int_30_EWMA_03 =  mean(det_int_30_EWMA_03);
mean_int_40_EWMA_03 =  mean(det_int_40_EWMA_03);
mean_int_50_EWMA_03 =  mean(det_int_50_EWMA_03);
mean_int_60_EWMA_03 =  mean(det_int_60_EWMA_03);
mean_int_70_EWMA_03 =  mean(det_int_70_EWMA_03);
mean_int_80_EWMA_03 =  mean(det_int_80_EWMA_03);
mean_int_90_EWMA_03 =  mean(det_int_90_EWMA_03);
mean_int_100_EWMA_03 =  mean(det_int_100_EWMA_03);

std_int_0_EWMA_03  =  std(det_int_0_EWMA_03);
std_int_10_EWMA_03 =  std(det_int_10_EWMA_03);
std_int_20_EWMA_03 =  std(det_int_20_EWMA_03);
std_int_30_EWMA_03 =  std(det_int_30_EWMA_03);
std_int_40_EWMA_03 =  std(det_int_40_EWMA_03);
std_int_50_EWMA_03 =  std(det_int_50_EWMA_03);
std_int_60_EWMA_03 =  std(det_int_60_EWMA_03);
std_int_70_EWMA_03 =  std(det_int_70_EWMA_03);
std_int_80_EWMA_03 =  std(det_int_80_EWMA_03);
std_int_90_EWMA_03 =  std(det_int_90_EWMA_03);
std_int_100_EWMA_03 =  std(det_int_100_EWMA_03);

error_int_0_EWMA_03  = abs(0  - mean(det_int_0_EWMA_03));
error_int_10_EWMA_03 = abs(10 - mean(det_int_10_EWMA_03));
error_int_20_EWMA_03 = abs(20 - mean(det_int_20_EWMA_03));
error_int_30_EWMA_03 = abs(30 - mean(det_int_30_EWMA_03));
error_int_40_EWMA_03 = abs(40 - mean(det_int_40_EWMA_03));
error_int_50_EWMA_03 = abs(50 - mean(det_int_50_EWMA_03));
error_int_60_EWMA_03 = abs(60 - mean(det_int_60_EWMA_03));
error_int_70_EWMA_03 = abs(70 - mean(det_int_70_EWMA_03));
error_int_80_EWMA_03 = abs(80 - mean(det_int_80_EWMA_03));
error_int_90_EWMA_03 = abs(90 - mean(det_int_90_EWMA_03));
error_int_100_EWMA_03 = abs(100 - mean(det_int_100_EWMA_03));

% vectors 
mean_int_vec_EWMA_03   = [mean_int_0_EWMA_03 mean_int_10_EWMA_03 mean_int_20_EWMA_03 mean_int_30_EWMA_03 mean_int_40_EWMA_03 mean_int_50_EWMA_03 mean_int_60_EWMA_03 mean_int_70_EWMA_03 mean_int_80_EWMA_03 mean_int_90_EWMA_03 mean_int_100_EWMA_03]
std_int_vec_EWMA_03   = [std_int_0_EWMA_03 std_int_10_EWMA_03 std_int_20_EWMA_03 std_int_30_EWMA_03 std_int_40_EWMA_03 std_int_50_EWMA_03 std_int_60_EWMA_03 std_int_70_EWMA_03 std_int_80_EWMA_03 std_int_90_EWMA_03 std_int_100_EWMA_03]
error_int_vec_EWMA_03  = [error_int_0_EWMA_03 error_int_10_EWMA_03 error_int_20_EWMA_03 error_int_30_EWMA_03 error_int_40_EWMA_03 error_int_50_EWMA_03 error_int_60_EWMA_03 error_int_70_EWMA_03 error_int_80_EWMA_03 error_int_90_EWMA_03 error_int_100_EWMA_03]


