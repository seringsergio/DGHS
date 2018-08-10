
for i = 1:num_divisions_btp
 
    count_EWMA_btp_02_100_tx_wind_10(i) = sum( EWMA_btp_02_100_tx_wind_10 >= (i-1) * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_100_tx_wind_10 <  (i)   * range_EWMA_btp_02_wind_10 / num_divisions_btp );

    count_EWMA_btp_02_95_tx_wind_10(i) = sum(  EWMA_btp_02_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_95_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_02_90_tx_wind_10(i) = sum(  EWMA_btp_02_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_90_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );

    count_EWMA_btp_02_80_tx_wind_10(i) = sum(  EWMA_btp_02_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_80_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_70_tx_wind_10(i) = sum(  EWMA_btp_02_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_70_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_60_tx_wind_10(i) = sum(  EWMA_btp_02_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_60_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_50_tx_wind_10(i) = sum(  EWMA_btp_02_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_50_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_40_tx_wind_10(i) = sum(  EWMA_btp_02_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_40_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_30_tx_wind_10(i) = sum(  EWMA_btp_02_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_30_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_20_tx_wind_10(i) = sum(  EWMA_btp_02_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_20_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_10_tx_wind_10(i) = sum(  EWMA_btp_02_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_02_10_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_02_0_tx_wind_10(i) = sum(    EWMA_btp_02_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_02_wind_10 / num_divisions_btp ...
                                     &  EWMA_btp_02_0_tx_wind_10 <  (i)    * range_EWMA_btp_02_wind_10 / num_divisions_btp );                                 

end

