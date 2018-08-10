
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0_EWMA_01_wind_30      = sum( det_int_0_EWMA_01_wind_30 == 0); 
percentage_det_int_0_EWMA_01_wind_30 = count_det_int_0_EWMA_01_wind_30 / size(det_int_0_EWMA_01_wind_30,1) * 100;

% 10
count_det_int_10_EWMA_01_wind_30      = sum( det_int_10_EWMA_01_wind_30 == 10); 
percentage_det_int_10_EWMA_01_wind_30 = count_det_int_10_EWMA_01_wind_30 / size(det_int_10_EWMA_01_wind_30,1) * 100;

% 20
count_det_int_20_EWMA_01_wind_30      = sum( det_int_20_EWMA_01_wind_30 == 20); 
percentage_det_int_20_EWMA_01_wind_30 = count_det_int_20_EWMA_01_wind_30 / size(det_int_20_EWMA_01_wind_30,1) * 100;

% 30
count_det_int_30_EWMA_01_wind_30      = sum( det_int_30_EWMA_01_wind_30 == 30); 
percentage_det_int_30_EWMA_01_wind_30 = count_det_int_30_EWMA_01_wind_30 / size(det_int_30_EWMA_01_wind_30,1) * 100;

% 40
count_det_int_40_EWMA_01_wind_30      = sum( det_int_40_EWMA_01_wind_30 == 40); 
percentage_det_int_40_EWMA_01_wind_30 = count_det_int_40_EWMA_01_wind_30 / size(det_int_40_EWMA_01_wind_30,1) * 100;

% 50
count_det_int_50_EWMA_01_wind_30      = sum( det_int_50_EWMA_01_wind_30 == 50); 
percentage_det_int_50_EWMA_01_wind_30 = count_det_int_50_EWMA_01_wind_30 / size(det_int_50_EWMA_01_wind_30,1) * 100;

% 60
count_det_int_60_EWMA_01_wind_30      = sum( det_int_60_EWMA_01_wind_30 == 60); 
percentage_det_int_60_EWMA_01_wind_30 = count_det_int_60_EWMA_01_wind_30 / size(det_int_60_EWMA_01_wind_30,1) * 100;

% 70
count_det_int_70_EWMA_01_wind_30      = sum( det_int_70_EWMA_01_wind_30 == 70); 
percentage_det_int_70_EWMA_01_wind_30 = count_det_int_70_EWMA_01_wind_30 / size(det_int_70_EWMA_01_wind_30,1) * 100;

% 80
count_det_int_80_EWMA_01_wind_30      = sum( det_int_80_EWMA_01_wind_30 == 80); 
percentage_det_int_80_EWMA_01_wind_30 = count_det_int_80_EWMA_01_wind_30 / size(det_int_80_EWMA_01_wind_30,1) * 100;

% 90
count_det_int_90_EWMA_01_wind_30      = sum( det_int_90_EWMA_01_wind_30 == 90); 
percentage_det_int_90_EWMA_01_wind_30 = count_det_int_90_EWMA_01_wind_30 / size(det_int_90_EWMA_01_wind_30,1) * 100;

% 100
count_det_int_100_EWMA_01_wind_30      = sum( det_int_100_EWMA_01_wind_30 == 100); 
percentage_det_int_100_EWMA_01_wind_30 = count_det_int_100_EWMA_01_wind_30 / size(det_int_100_EWMA_01_wind_30,1) * 100;

%consolidado

percentage_det_int_vec_EWMA_01_wind_30 = [percentage_det_int_0_EWMA_01_wind_30
                                  percentage_det_int_10_EWMA_01_wind_30
                                  percentage_det_int_20_EWMA_01_wind_30
                                  percentage_det_int_30_EWMA_01_wind_30
                                  percentage_det_int_40_EWMA_01_wind_30
                                  percentage_det_int_50_EWMA_01_wind_30
                                  percentage_det_int_60_EWMA_01_wind_30
                                  percentage_det_int_70_EWMA_01_wind_30
                                  percentage_det_int_80_EWMA_01_wind_30
                                  percentage_det_int_90_EWMA_01_wind_30
                                  percentage_det_int_100_EWMA_01_wind_30                       
                                  ]; 

mean_int_0_EWMA_01_wind_30  =  mean(det_int_0_EWMA_01_wind_30);
mean_int_10_EWMA_01_wind_30 =  mean(det_int_10_EWMA_01_wind_30);
mean_int_20_EWMA_01_wind_30 =  mean(det_int_20_EWMA_01_wind_30);
mean_int_30_EWMA_01_wind_30 =  mean(det_int_30_EWMA_01_wind_30);
mean_int_40_EWMA_01_wind_30 =  mean(det_int_40_EWMA_01_wind_30);
mean_int_50_EWMA_01_wind_30 =  mean(det_int_50_EWMA_01_wind_30);
mean_int_60_EWMA_01_wind_30 =  mean(det_int_60_EWMA_01_wind_30);
mean_int_70_EWMA_01_wind_30 =  mean(det_int_70_EWMA_01_wind_30);
mean_int_80_EWMA_01_wind_30 =  mean(det_int_80_EWMA_01_wind_30);
mean_int_90_EWMA_01_wind_30 =  mean(det_int_90_EWMA_01_wind_30);
mean_int_100_EWMA_01_wind_30 =  mean(det_int_100_EWMA_01_wind_30);

std_int_0_EWMA_01_wind_30  =  std(det_int_0_EWMA_01_wind_30);
std_int_10_EWMA_01_wind_30 =  std(det_int_10_EWMA_01_wind_30);
std_int_20_EWMA_01_wind_30 =  std(det_int_20_EWMA_01_wind_30);
std_int_30_EWMA_01_wind_30 =  std(det_int_30_EWMA_01_wind_30);
std_int_40_EWMA_01_wind_30 =  std(det_int_40_EWMA_01_wind_30);
std_int_50_EWMA_01_wind_30 =  std(det_int_50_EWMA_01_wind_30);
std_int_60_EWMA_01_wind_30 =  std(det_int_60_EWMA_01_wind_30);
std_int_70_EWMA_01_wind_30 =  std(det_int_70_EWMA_01_wind_30);
std_int_80_EWMA_01_wind_30 =  std(det_int_80_EWMA_01_wind_30);
std_int_90_EWMA_01_wind_30 =  std(det_int_90_EWMA_01_wind_30);
std_int_100_EWMA_01_wind_30 =  std(det_int_100_EWMA_01_wind_30);

error_int_0_EWMA_01_wind_30  = abs(0  - mean(det_int_0_EWMA_01_wind_30));
error_int_10_EWMA_01_wind_30 = abs(10 - mean(det_int_10_EWMA_01_wind_30));
error_int_20_EWMA_01_wind_30 = abs(20 - mean(det_int_20_EWMA_01_wind_30));
error_int_30_EWMA_01_wind_30 = abs(30 - mean(det_int_30_EWMA_01_wind_30));
error_int_40_EWMA_01_wind_30 = abs(40 - mean(det_int_40_EWMA_01_wind_30));
error_int_50_EWMA_01_wind_30 = abs(50 - mean(det_int_50_EWMA_01_wind_30));
error_int_60_EWMA_01_wind_30 = abs(60 - mean(det_int_60_EWMA_01_wind_30));
error_int_70_EWMA_01_wind_30 = abs(70 - mean(det_int_70_EWMA_01_wind_30));
error_int_80_EWMA_01_wind_30 = abs(80 - mean(det_int_80_EWMA_01_wind_30));
error_int_90_EWMA_01_wind_30 = abs(90 - mean(det_int_90_EWMA_01_wind_30));
error_int_100_EWMA_01_wind_30 = abs(100 - mean(det_int_100_EWMA_01_wind_30));

% vectors 
mean_int_vec_EWMA_01_wind_30   = [mean_int_0_EWMA_01_wind_30 mean_int_10_EWMA_01_wind_30 mean_int_20_EWMA_01_wind_30 mean_int_30_EWMA_01_wind_30 mean_int_40_EWMA_01_wind_30 mean_int_50_EWMA_01_wind_30 mean_int_60_EWMA_01_wind_30 mean_int_70_EWMA_01_wind_30 mean_int_80_EWMA_01_wind_30 mean_int_90_EWMA_01_wind_30 mean_int_100_EWMA_01_wind_30];
std_int_vec_EWMA_01_wind_30   = [std_int_0_EWMA_01_wind_30 std_int_10_EWMA_01_wind_30 std_int_20_EWMA_01_wind_30 std_int_30_EWMA_01_wind_30 std_int_40_EWMA_01_wind_30 std_int_50_EWMA_01_wind_30 std_int_60_EWMA_01_wind_30 std_int_70_EWMA_01_wind_30 std_int_80_EWMA_01_wind_30 std_int_90_EWMA_01_wind_30 std_int_100_EWMA_01_wind_30];
error_int_vec_EWMA_01_wind_30  = [error_int_0_EWMA_01_wind_30 error_int_10_EWMA_01_wind_30 error_int_20_EWMA_01_wind_30 error_int_30_EWMA_01_wind_30 error_int_40_EWMA_01_wind_30 error_int_50_EWMA_01_wind_30 error_int_60_EWMA_01_wind_30 error_int_70_EWMA_01_wind_30 error_int_80_EWMA_01_wind_30 error_int_90_EWMA_01_wind_30 error_int_100_EWMA_01_wind_30];

% Para graficar 
mean_error_int_vec_EWMA_01_wind_30 = mean(error_int_vec_EWMA_01_wind_30);
std_error_int_vec_EWMA_01_wind_30 = std(error_int_vec_EWMA_01_wind_30);

mean_percentage_det_int_vec_EWMA_01_wind_30 = mean(percentage_det_int_vec_EWMA_01_wind_30); 
std_percentage_det_int_vec_EWMA_01_wind_30 = std(percentage_det_int_vec_EWMA_01_wind_30); 

% Identificar donde el error es menor de 1% (porcent_value)
where_error_int_vec_EWMA_01_wind_30 = (error_int_vec_EWMA_01_wind_30 <= porcent_value); % identificar valores menores a 1%
where_error_int_vec_EWMA_01_wind_30 = double(where_error_int_vec_EWMA_01_wind_30); % convertir los valores de logical a double
where_error_int_vec_EWMA_01_wind_30(where_error_int_vec_EWMA_01_wind_30 == 0) = NaN;% convertir los Zeros en NaN
where_error_int_vec_EWMA_01_wind_30(where_error_int_vec_EWMA_01_wind_30 == 1) = 0; % convertir los 1 en zeros
