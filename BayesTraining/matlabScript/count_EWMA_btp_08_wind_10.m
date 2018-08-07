
for i = 1:num_divisions_btp
 
    count_EWMA_btp_08_100_tx_wind_10(i) = sum( EWMA_btp_08_100_tx_wind_10 >= (i-1) * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_100_tx_wind_10 <  (i)   * range_EWMA_btp_08 / num_divisions_btp );

    count_EWMA_btp_08_95_tx_wind_10(i) = sum(  EWMA_btp_08_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_95_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_08_90_tx_wind_10(i) = sum(  EWMA_btp_08_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_90_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );

    count_EWMA_btp_08_80_tx_wind_10(i) = sum(  EWMA_btp_08_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_80_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_70_tx_wind_10(i) = sum(  EWMA_btp_08_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_70_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_60_tx_wind_10(i) = sum(  EWMA_btp_08_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_60_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_50_tx_wind_10(i) = sum(  EWMA_btp_08_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_50_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_40_tx_wind_10(i) = sum(  EWMA_btp_08_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_40_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_30_tx_wind_10(i) = sum(  EWMA_btp_08_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_30_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_20_tx_wind_10(i) = sum(  EWMA_btp_08_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_20_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_10_tx_wind_10(i) = sum(  EWMA_btp_08_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_10_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_0_tx_wind_10(i) = sum(    EWMA_btp_08_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     &  EWMA_btp_08_0_tx_wind_10 <  (i)    * range_EWMA_btp_08 / num_divisions_btp );                                 

end

