%% colors
dark_green = [0 0.4 0]; 

xtext = 100;
ytext = 0;

% EWMA 01 variando window

range_EWMA_btp_01_wind_5 = max( [ EWMA_btp_01_100_tx_wind_5, 
%                            EWMA_btp_01_95_tx_wind_5,  
                           EWMA_btp_01_90_tx_wind_5,  
                           EWMA_btp_01_80_tx_wind_5,  
                           EWMA_btp_01_70_tx_wind_5,  
                           EWMA_btp_01_60_tx_wind_5,  
                           EWMA_btp_01_50_tx_wind_5,  
                           EWMA_btp_01_40_tx_wind_5,  
                           EWMA_btp_01_30_tx_wind_5,  
                           EWMA_btp_01_20_tx_wind_5,  
                           EWMA_btp_01_10_tx_wind_5,                     
                           EWMA_btp_01_0_tx_wind_5] )
                       
range_EWMA_btp_01_wind_10 = max( [ EWMA_btp_01_100_tx_wind_10, 
                           EWMA_btp_01_95_tx_wind_10,  
                           EWMA_btp_01_90_tx_wind_10,  
                           EWMA_btp_01_80_tx_wind_10,  
                           EWMA_btp_01_70_tx_wind_10,  
                           EWMA_btp_01_60_tx_wind_10,  
                           EWMA_btp_01_50_tx_wind_10,  
                           EWMA_btp_01_40_tx_wind_10,  
                           EWMA_btp_01_30_tx_wind_10,  
                           EWMA_btp_01_20_tx_wind_10,  
                           EWMA_btp_01_10_tx_wind_10,                     
                           EWMA_btp_01_0_tx_wind_10] )
                       
range_EWMA_btp_01_wind_15 = max( [ EWMA_btp_01_100_tx_wind_15, 
%                            EWMA_btp_01_95_tx_wind_15,  
                           EWMA_btp_01_90_tx_wind_15,  
                           EWMA_btp_01_80_tx_wind_15,  
                           EWMA_btp_01_70_tx_wind_15,  
                           EWMA_btp_01_60_tx_wind_15,  
                           EWMA_btp_01_50_tx_wind_15,  
                           EWMA_btp_01_40_tx_wind_15,  
                           EWMA_btp_01_30_tx_wind_15,  
                           EWMA_btp_01_20_tx_wind_15,  
                           EWMA_btp_01_10_tx_wind_15,                     
                           EWMA_btp_01_0_tx_wind_15] )
                       
range_EWMA_btp_01_wind_20 = max( [ EWMA_btp_01_100_tx_wind_20, 
%                            EWMA_btp_01_95_tx_wind_20,  
                           EWMA_btp_01_90_tx_wind_20,  
                           EWMA_btp_01_80_tx_wind_20,  
                           EWMA_btp_01_70_tx_wind_20,  
                           EWMA_btp_01_60_tx_wind_20,  
                           EWMA_btp_01_50_tx_wind_20,  
                           EWMA_btp_01_40_tx_wind_20,  
                           EWMA_btp_01_30_tx_wind_20,  
                           EWMA_btp_01_20_tx_wind_20,  
                           EWMA_btp_01_10_tx_wind_20,                     
                           EWMA_btp_01_0_tx_wind_20] )
                       
range_EWMA_btp_01_wind_25 = max( [ EWMA_btp_01_100_tx_wind_25, 
%                            EWMA_btp_01_95_tx_wind_25,  
                           EWMA_btp_01_90_tx_wind_25,  
                           EWMA_btp_01_80_tx_wind_25,  
                           EWMA_btp_01_70_tx_wind_25,  
                           EWMA_btp_01_60_tx_wind_25,  
                           EWMA_btp_01_50_tx_wind_25,  
                           EWMA_btp_01_40_tx_wind_25,  
                           EWMA_btp_01_30_tx_wind_25,  
                           EWMA_btp_01_20_tx_wind_25,  
                           EWMA_btp_01_10_tx_wind_25,                     
                           EWMA_btp_01_0_tx_wind_25] )
                       
range_EWMA_btp_01_wind_30 = max( [ EWMA_btp_01_100_tx_wind_30, 
%                            EWMA_btp_01_95_tx_wind_30,  
                           EWMA_btp_01_90_tx_wind_30,  
                           EWMA_btp_01_80_tx_wind_30,  
                           EWMA_btp_01_70_tx_wind_30,  
                           EWMA_btp_01_60_tx_wind_30,  
                           EWMA_btp_01_50_tx_wind_30,  
                           EWMA_btp_01_40_tx_wind_30,  
                           EWMA_btp_01_30_tx_wind_30,  
                           EWMA_btp_01_20_tx_wind_30,  
                           EWMA_btp_01_10_tx_wind_30,                     
                           EWMA_btp_01_0_tx_wind_30] )
                       
range_EWMA_btp_01_wind_35 = max( [ EWMA_btp_01_100_tx_wind_35, 
%                            EWMA_btp_01_95_tx_wind_35,  
                           EWMA_btp_01_90_tx_wind_35,  
                           EWMA_btp_01_80_tx_wind_35,  
                           EWMA_btp_01_70_tx_wind_35,  
                           EWMA_btp_01_60_tx_wind_35,  
                           EWMA_btp_01_50_tx_wind_35,  
                           EWMA_btp_01_40_tx_wind_35,  
                           EWMA_btp_01_30_tx_wind_35,  
                           EWMA_btp_01_20_tx_wind_35,  
                           EWMA_btp_01_10_tx_wind_35,                     
                           EWMA_btp_01_0_tx_wind_35] )                       

                       
%%         hasta aca              

range_EWMA_btp_02_wind_10 = max( [ EWMA_btp_02_100_tx_wind_10, 
                           EWMA_btp_02_95_tx_wind_10,  
                           EWMA_btp_02_90_tx_wind_10,  
                           EWMA_btp_02_80_tx_wind_10,  
                           EWMA_btp_02_70_tx_wind_10,  
                           EWMA_btp_02_60_tx_wind_10,  
                           EWMA_btp_02_50_tx_wind_10,  
                           EWMA_btp_02_40_tx_wind_10,  
                           EWMA_btp_02_30_tx_wind_10,  
                           EWMA_btp_02_20_tx_wind_10,  
                           EWMA_btp_02_10_tx_wind_10,                     
                           EWMA_btp_02_0_tx_wind_10] )  

range_EWMA_btp_03_wind_10 = max( [ EWMA_btp_03_100_tx_wind_10, 
                           EWMA_btp_03_95_tx_wind_10,  
                           EWMA_btp_03_90_tx_wind_10,  
                           EWMA_btp_03_80_tx_wind_10,  
                           EWMA_btp_03_70_tx_wind_10,  
                           EWMA_btp_03_60_tx_wind_10,  
                           EWMA_btp_03_50_tx_wind_10,  
                           EWMA_btp_03_40_tx_wind_10,  
                           EWMA_btp_03_30_tx_wind_10,  
                           EWMA_btp_03_20_tx_wind_10,  
                           EWMA_btp_03_10_tx_wind_10,                     
                           EWMA_btp_03_0_tx_wind_10] ) 

range_EWMA_btp_04_wind_10 = max( [ EWMA_btp_04_100_tx_wind_10, 
                           EWMA_btp_04_95_tx_wind_10,  
                           EWMA_btp_04_90_tx_wind_10,  
                           EWMA_btp_04_80_tx_wind_10,  
                           EWMA_btp_04_70_tx_wind_10,  
                           EWMA_btp_04_60_tx_wind_10,  
                           EWMA_btp_04_50_tx_wind_10,  
                           EWMA_btp_04_40_tx_wind_10,  
                           EWMA_btp_04_30_tx_wind_10,  
                           EWMA_btp_04_20_tx_wind_10,  
                           EWMA_btp_04_10_tx_wind_10,                     
                           EWMA_btp_04_0_tx_wind_10] )

range_EWMA_btp_05_wind_10 = max( [ EWMA_btp_05_100_tx_wind_10, 
                           EWMA_btp_05_95_tx_wind_10,  
                           EWMA_btp_05_90_tx_wind_10,  
                           EWMA_btp_05_80_tx_wind_10,  
                           EWMA_btp_05_70_tx_wind_10,  
                           EWMA_btp_05_60_tx_wind_10,  
                           EWMA_btp_05_50_tx_wind_10,  
                           EWMA_btp_05_40_tx_wind_10,  
                           EWMA_btp_05_30_tx_wind_10,  
                           EWMA_btp_05_20_tx_wind_10,  
                           EWMA_btp_05_10_tx_wind_10,                     
                           EWMA_btp_05_0_tx_wind_10] )
                       
range_EWMA_btp_06_wind_10 = max( [ EWMA_btp_06_100_tx_wind_10, 
                           EWMA_btp_06_95_tx_wind_10,  
                           EWMA_btp_06_90_tx_wind_10,  
                           EWMA_btp_06_80_tx_wind_10,  
                           EWMA_btp_06_70_tx_wind_10,  
                           EWMA_btp_06_60_tx_wind_10,  
                           EWMA_btp_06_50_tx_wind_10,  
                           EWMA_btp_06_40_tx_wind_10,  
                           EWMA_btp_06_30_tx_wind_10,  
                           EWMA_btp_06_20_tx_wind_10,  
                           EWMA_btp_06_10_tx_wind_10,                     
                           EWMA_btp_06_0_tx_wind_10] )
                       
range_EWMA_btp_07_wind_10 = max( [ EWMA_btp_07_100_tx_wind_10, 
                           EWMA_btp_07_95_tx_wind_10,  
                           EWMA_btp_07_90_tx_wind_10,  
                           EWMA_btp_07_80_tx_wind_10,  
                           EWMA_btp_07_70_tx_wind_10,  
                           EWMA_btp_07_60_tx_wind_10,  
                           EWMA_btp_07_50_tx_wind_10,  
                           EWMA_btp_07_40_tx_wind_10,  
                           EWMA_btp_07_30_tx_wind_10,  
                           EWMA_btp_07_20_tx_wind_10,  
                           EWMA_btp_07_10_tx_wind_10,                     
                           EWMA_btp_07_0_tx_wind_10] )      
                       
range_EWMA_btp_08_wind_10 = max( [ EWMA_btp_08_100_tx_wind_10, 
                           EWMA_btp_08_95_tx_wind_10,  
                           EWMA_btp_08_90_tx_wind_10,  
                           EWMA_btp_08_80_tx_wind_10,  
                           EWMA_btp_08_70_tx_wind_10,  
                           EWMA_btp_08_60_tx_wind_10,  
                           EWMA_btp_08_50_tx_wind_10,  
                           EWMA_btp_08_40_tx_wind_10,  
                           EWMA_btp_08_30_tx_wind_10,  
                           EWMA_btp_08_20_tx_wind_10,  
                           EWMA_btp_08_10_tx_wind_10,                     
                           EWMA_btp_08_0_tx_wind_10] )
                       
range_EWMA_btp_09_wind_10 = max( [ EWMA_btp_09_100_tx_wind_10, 
                           EWMA_btp_09_95_tx_wind_10,  
                           EWMA_btp_09_90_tx_wind_10,  
                           EWMA_btp_09_80_tx_wind_10,  
                           EWMA_btp_09_70_tx_wind_10,  
                           EWMA_btp_09_60_tx_wind_10,  
                           EWMA_btp_09_50_tx_wind_10,  
                           EWMA_btp_09_40_tx_wind_10,  
                           EWMA_btp_09_30_tx_wind_10,  
                           EWMA_btp_09_20_tx_wind_10,  
                           EWMA_btp_09_10_tx_wind_10,                     
                           EWMA_btp_09_0_tx_wind_10] )                       


num_divisions_btp = 40;

range_ppl = 1; 
num_divisions_ppl = 40; 

int_vec_0_100 = [0 10 20 30 40 50 60 70 80 90 100]; 

vec_zeros =  zeros(1,11);

vec_zeros_9 =  zeros(1,9);

for i = 1:num_divisions_btp
    x_eje_btp_01(i) = (i)   * range_EWMA_btp_01_wind_10 / num_divisions_btp;
    x_eje_btp_02(i) = (i)   * range_EWMA_btp_02_wind_10 / num_divisions_btp;
    x_eje_btp_07(i) = (i)   * range_EWMA_btp_07_wind_10 / num_divisions_btp;

end

for i = 1:num_divisions_ppl
    x_eje_ppl(i) = (i)   * range_ppl / num_divisions_ppl;
end

%% EWMA (exponential weighted moving average)
alpha = 0.1; 

EWMA_vec = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]; 

%% Porcentaje donde pinto puntito rojo en la grafica "Error for different alpha"
porcent_value = 1; 

%% position del texto en la grafica "Error for different alpha"
xtext1 = 102;
xtext2 = -10;
ytext1 = 0;
ytext2 = 17;

%%vector ventanas
num_windows = 7; 
window_vec = [5 10 15 20 25 30 35];

vec_wind_zeros = zeros(1,num_windows);


