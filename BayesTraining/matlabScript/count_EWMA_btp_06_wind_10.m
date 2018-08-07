
for i = 1:num_divisions_btp
 
    count_EWMA_btp_06_100_tx_wind_10(i) = sum( EWMA_btp_06_100_tx_wind_10 >= (i-1) * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_100_tx_wind_10 <  (i)   * range_EWMA_btp_06 / num_divisions_btp );

    count_EWMA_btp_06_95_tx_wind_10(i) = sum(  EWMA_btp_06_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_95_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_06_90_tx_wind_10(i) = sum(  EWMA_btp_06_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_90_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );

    count_EWMA_btp_06_80_tx_wind_10(i) = sum(  EWMA_btp_06_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_80_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_70_tx_wind_10(i) = sum(  EWMA_btp_06_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_70_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_60_tx_wind_10(i) = sum(  EWMA_btp_06_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_60_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_50_tx_wind_10(i) = sum(  EWMA_btp_06_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_50_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_40_tx_wind_10(i) = sum(  EWMA_btp_06_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_40_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_30_tx_wind_10(i) = sum(  EWMA_btp_06_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_30_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_20_tx_wind_10(i) = sum(  EWMA_btp_06_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_20_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_10_tx_wind_10(i) = sum(  EWMA_btp_06_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_10_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_0_tx_wind_10(i) = sum(    EWMA_btp_06_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     &  EWMA_btp_06_0_tx_wind_10 <  (i)    * range_EWMA_btp_06 / num_divisions_btp );                                 

end

