
for i = 1:num_divisions_btp
 
    count_EWMA_btp_05_100_tx_wind_10(i) = sum( EWMA_btp_05_100_tx_wind_10 >= (i-1) * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_100_tx_wind_10 <  (i)   * range_EWMA_btp_05_wind_10 / num_divisions_btp );

    count_EWMA_btp_05_95_tx_wind_10(i) = sum(  EWMA_btp_05_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_95_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_05_90_tx_wind_10(i) = sum(  EWMA_btp_05_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_90_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );

    count_EWMA_btp_05_80_tx_wind_10(i) = sum(  EWMA_btp_05_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_80_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_70_tx_wind_10(i) = sum(  EWMA_btp_05_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_70_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_60_tx_wind_10(i) = sum(  EWMA_btp_05_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_60_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_50_tx_wind_10(i) = sum(  EWMA_btp_05_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_50_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_40_tx_wind_10(i) = sum(  EWMA_btp_05_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_40_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_30_tx_wind_10(i) = sum(  EWMA_btp_05_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_30_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_20_tx_wind_10(i) = sum(  EWMA_btp_05_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_20_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_10_tx_wind_10(i) = sum(  EWMA_btp_05_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_05_10_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_05_0_tx_wind_10(i) = sum(    EWMA_btp_05_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_05_wind_10 / num_divisions_btp ...
                                     &  EWMA_btp_05_0_tx_wind_10 <  (i)    * range_EWMA_btp_05_wind_10 / num_divisions_btp );                                 

end

