
for i = 1:num_divisions_btp
    
    count_EWMA_btp_01_100_tx_wind_35(i) = sum( EWMA_btp_01_100_tx_wind_35 >= (i-1) * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_100_tx_wind_35 <  (i)   * range_EWMA_btp_01_wind_35 / num_divisions_btp );

%     count_EWMA_btp_01_95_tx_wind_35(i) = sum(  EWMA_btp_01_95_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
%                                      & EWMA_btp_01_95_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_01_90_tx_wind_35(i) = sum(  EWMA_btp_01_90_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_90_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );

    count_EWMA_btp_01_80_tx_wind_35(i) = sum(  EWMA_btp_01_80_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_80_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_70_tx_wind_35(i) = sum(  EWMA_btp_01_70_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_70_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_60_tx_wind_35(i) = sum(  EWMA_btp_01_60_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_60_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_50_tx_wind_35(i) = sum(  EWMA_btp_01_50_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_50_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_40_tx_wind_35(i) = sum(  EWMA_btp_01_40_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_40_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_30_tx_wind_35(i) = sum(  EWMA_btp_01_30_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_30_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_20_tx_wind_35(i) = sum(  EWMA_btp_01_20_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_20_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_10_tx_wind_35(i) = sum(  EWMA_btp_01_10_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     & EWMA_btp_01_10_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );
                                 
    count_EWMA_btp_01_0_tx_wind_35(i) = sum(    EWMA_btp_01_0_tx_wind_35 >= (i-1)  * range_EWMA_btp_01_wind_35 / num_divisions_btp ...
                                     &  EWMA_btp_01_0_tx_wind_35 <  (i)    * range_EWMA_btp_01_wind_35 / num_divisions_btp );                                 

end

