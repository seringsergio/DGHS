%% colors
dark_green = [0 0.4 0]; 

xtext = 100;
ytext = 0;

range_EWMA_btp_01 = max( [ EWMA_btp_01_100_tx, 
                           EWMA_btp_01_95_tx,  
                           EWMA_btp_01_90_tx,  
                           EWMA_btp_01_80_tx,  
                           EWMA_btp_01_70_tx,  
                           EWMA_btp_01_60_tx,  
                           EWMA_btp_01_50_tx,  
                           EWMA_btp_01_40_tx,  
                           EWMA_btp_01_30_tx,  
                           EWMA_btp_01_20_tx,  
                           EWMA_btp_01_10_tx,                     
                           EWMA_btp_01_0_tx] )

range_EWMA_btp_02 = max( [ EWMA_btp_02_100_tx, 
                           EWMA_btp_02_95_tx,  
                           EWMA_btp_02_90_tx,  
                           EWMA_btp_02_80_tx,  
                           EWMA_btp_02_70_tx,  
                           EWMA_btp_02_60_tx,  
                           EWMA_btp_02_50_tx,  
                           EWMA_btp_02_40_tx,  
                           EWMA_btp_02_30_tx,  
                           EWMA_btp_02_20_tx,  
                           EWMA_btp_02_10_tx,                     
                           EWMA_btp_02_0_tx] )  
                       
range_EWMA_btp_07 = max( [ EWMA_btp_07_100_tx, 
                           EWMA_btp_07_95_tx,  
                           EWMA_btp_07_90_tx,  
                           EWMA_btp_07_80_tx,  
                           EWMA_btp_07_70_tx,  
                           EWMA_btp_07_60_tx,  
                           EWMA_btp_07_50_tx,  
                           EWMA_btp_07_40_tx,  
                           EWMA_btp_07_30_tx,  
                           EWMA_btp_07_20_tx,  
                           EWMA_btp_07_10_tx,                     
                           EWMA_btp_07_0_tx] )                       


num_divisions_btp = 40;

range_ppl = 1; 
num_divisions_ppl = 40; 

int_vec_0_100 = [0 10 20 30 40 50 60 70 80 90 100]; 

vec_zeros =  zeros(1,11);

for i = 1:num_divisions_btp
    x_eje_btp_01(i) = (i)   * range_EWMA_btp_01 / num_divisions_btp;
    x_eje_btp_02(i) = (i)   * range_EWMA_btp_02 / num_divisions_btp;
    x_eje_btp_07(i) = (i)   * range_EWMA_btp_07 / num_divisions_btp;

end

for i = 1:num_divisions_ppl
    x_eje_ppl(i) = (i)   * range_ppl / num_divisions_ppl;
end

%% EWMA (exponential weighted moving average)
alpha = 0.1; 

