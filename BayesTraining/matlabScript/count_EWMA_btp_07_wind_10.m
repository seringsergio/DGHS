
for i = 1:num_divisions_btp
 
    count_EWMA_btp_07_100_tx_wind_10(i) = sum( EWMA_btp_07_100_tx_wind_10 >= (i-1) * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_100_tx_wind_10 <  (i)   * range_EWMA_btp_07 / num_divisions_btp );

    count_EWMA_btp_07_95_tx_wind_10(i) = sum(  EWMA_btp_07_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_95_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_07_90_tx_wind_10(i) = sum(  EWMA_btp_07_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_90_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );

    count_EWMA_btp_07_80_tx_wind_10(i) = sum(  EWMA_btp_07_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_80_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_70_tx_wind_10(i) = sum(  EWMA_btp_07_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_70_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_60_tx_wind_10(i) = sum(  EWMA_btp_07_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_60_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_50_tx_wind_10(i) = sum(  EWMA_btp_07_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_50_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_40_tx_wind_10(i) = sum(  EWMA_btp_07_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_40_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_30_tx_wind_10(i) = sum(  EWMA_btp_07_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_30_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_20_tx_wind_10(i) = sum(  EWMA_btp_07_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_20_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_10_tx_wind_10(i) = sum(  EWMA_btp_07_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_10_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_0_tx_wind_10(i) = sum(    EWMA_btp_07_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     &  EWMA_btp_07_0_tx_wind_10 <  (i)    * range_EWMA_btp_07 / num_divisions_btp );                                 

end

