
for i = 1:num_divisions_btp
 
    count_EWMA_btp_03_100_tx_wind_10(i) = sum( EWMA_btp_03_100_tx_wind_10 >= (i-1) * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_100_tx_wind_10 <  (i)   * range_EWMA_btp_03 / num_divisions_btp );

    count_EWMA_btp_03_95_tx_wind_10(i) = sum(  EWMA_btp_03_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_95_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_03_90_tx_wind_10(i) = sum(  EWMA_btp_03_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_90_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );

    count_EWMA_btp_03_80_tx_wind_10(i) = sum(  EWMA_btp_03_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_80_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_70_tx_wind_10(i) = sum(  EWMA_btp_03_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_70_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_60_tx_wind_10(i) = sum(  EWMA_btp_03_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_60_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_50_tx_wind_10(i) = sum(  EWMA_btp_03_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_50_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_40_tx_wind_10(i) = sum(  EWMA_btp_03_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_40_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_30_tx_wind_10(i) = sum(  EWMA_btp_03_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_30_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_20_tx_wind_10(i) = sum(  EWMA_btp_03_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_20_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_10_tx_wind_10(i) = sum(  EWMA_btp_03_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_10_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_0_tx_wind_10(i) = sum(    EWMA_btp_03_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     &  EWMA_btp_03_0_tx_wind_10 <  (i)    * range_EWMA_btp_03 / num_divisions_btp );                                 

end

