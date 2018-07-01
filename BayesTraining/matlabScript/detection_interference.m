
%% Porcentaje de acierto en la deteccion

% 0
count_det_int_0      = sum( det_int_0 == 0); 
percentage_det_int_0 = count_det_int_0 / size(det_int_0,1) * 100;

% 10
count_det_int_10      = sum( det_int_10 == 10); 
percentage_det_int_10 = count_det_int_10 / size(det_int_10,1) * 100;

% 20
count_det_int_20      = sum( det_int_20 == 20); 
percentage_det_int_20 = count_det_int_20 / size(det_int_20,1) * 100;

% 30
count_det_int_30      = sum( det_int_30 == 30); 
percentage_det_int_30 = count_det_int_30 / size(det_int_30,1) * 100;

% 40
count_det_int_40      = sum( det_int_40 == 40); 
percentage_det_int_40 = count_det_int_40 / size(det_int_40,1) * 100;

% 50
count_det_int_50      = sum( det_int_50 == 50); 
percentage_det_int_50 = count_det_int_50 / size(det_int_50,1) * 100;

% 60
count_det_int_60      = sum( det_int_60 == 60); 
percentage_det_int_60 = count_det_int_60 / size(det_int_60,1) * 100;

% 70
count_det_int_70      = sum( det_int_70 == 70); 
percentage_det_int_70 = count_det_int_70 / size(det_int_70,1) * 100;

% 80
count_det_int_80      = sum( det_int_80 == 80); 
percentage_det_int_80 = count_det_int_80 / size(det_int_80,1) * 100;

% 90
count_det_int_90      = sum( det_int_90 == 90); 
percentage_det_int_90 = count_det_int_90 / size(det_int_90,1) * 100;

% 100
count_det_int_100      = sum( det_int_100 == 100); 
percentage_det_int_100 = count_det_int_100 / size(det_int_100,1) * 100;

%consolidado

percentage_det_int_vec = [percentage_det_int_0
                          percentage_det_int_10
                          percentage_det_int_20
                          percentage_det_int_30
                          percentage_det_int_40
                          percentage_det_int_50
                          percentage_det_int_60
                          percentage_det_int_70
                          percentage_det_int_80
                          percentage_det_int_90
                          percentage_det_int_100                       
                          ]; 

mean_int_0  =  mean(det_int_0);
mean_int_10 =  mean(det_int_10);
mean_int_20 =  mean(det_int_20);
mean_int_30 =  mean(det_int_30);
mean_int_40 =  mean(det_int_40);
mean_int_50 =  mean(det_int_50);
mean_int_60 =  mean(det_int_60);
mean_int_70 =  mean(det_int_70);
mean_int_80 =  mean(det_int_80);
mean_int_90 =  mean(det_int_90);
mean_int_100 =  mean(det_int_100);

std_int_0  =  std(det_int_0);
std_int_10 =  std(det_int_10);
std_int_20 =  std(det_int_20);
std_int_30 =  std(det_int_30);
std_int_40 =  std(det_int_40);
std_int_50 =  std(det_int_50);
std_int_60 =  std(det_int_60);
std_int_70 =  std(det_int_70);
std_int_80 =  std(det_int_80);
std_int_90 =  std(det_int_90);
std_int_100 =  std(det_int_100);

error_int_0  = abs(0  - mean(det_int_0));
error_int_10 = abs(10 - mean(det_int_10));
error_int_20 = abs(20 - mean(det_int_20));
error_int_30 = abs(30 - mean(det_int_30));
error_int_40 = abs(40 - mean(det_int_40));
error_int_50 = abs(50 - mean(det_int_50));
error_int_60 = abs(60 - mean(det_int_60));
error_int_70 = abs(70 - mean(det_int_70));
error_int_80 = abs(80 - mean(det_int_80));
error_int_90 = abs(90 - mean(det_int_90));
error_int_100 = abs(100 - mean(det_int_100));

% vectors 
mean_int_vec   = [mean_int_0 mean_int_10 mean_int_20 mean_int_30 mean_int_40 mean_int_50 mean_int_60 mean_int_70 mean_int_80 mean_int_90 mean_int_100]
std_int_vec   = [std_int_0 std_int_10 std_int_20 std_int_30 std_int_40 std_int_50 std_int_60 std_int_70 std_int_80 std_int_90 std_int_100]
error_int_vec  = [error_int_0 error_int_10 error_int_20 error_int_30 error_int_40 error_int_50 error_int_60 error_int_70 error_int_80 error_int_90 error_int_100]


