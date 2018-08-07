
for i = 1:num_divisions_btp
 
    count_EWMA_btp_09_100_tx_wind_10(i) = sum( EWMA_btp_09_100_tx_wind_10 >= (i-1) * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_100_tx_wind_10 <  (i)   * range_EWMA_btp_09 / num_divisions_btp );

    count_EWMA_btp_09_95_tx_wind_10(i) = sum(  EWMA_btp_09_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_95_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_09_90_tx_wind_10(i) = sum(  EWMA_btp_09_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_90_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );

    count_EWMA_btp_09_80_tx_wind_10(i) = sum(  EWMA_btp_09_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_80_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_70_tx_wind_10(i) = sum(  EWMA_btp_09_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_70_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_60_tx_wind_10(i) = sum(  EWMA_btp_09_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_60_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_50_tx_wind_10(i) = sum(  EWMA_btp_09_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_50_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_40_tx_wind_10(i) = sum(  EWMA_btp_09_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_40_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_30_tx_wind_10(i) = sum(  EWMA_btp_09_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_30_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_20_tx_wind_10(i) = sum(  EWMA_btp_09_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_20_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_10_tx_wind_10(i) = sum(  EWMA_btp_09_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_10_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_0_tx_wind_10(i) = sum(    EWMA_btp_09_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     &  EWMA_btp_09_0_tx_wind_10 <  (i)    * range_EWMA_btp_09 / num_divisions_btp );                                 

end

