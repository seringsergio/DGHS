
for i = 1:num_divisions_btp
 
    count_EWMA_btp_04_100_tx_wind_10(i) = sum( EWMA_btp_04_100_tx_wind_10 >= (i-1) * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_100_tx_wind_10 <  (i)   * range_EWMA_btp_04_wind_10 / num_divisions_btp );

    count_EWMA_btp_04_95_tx_wind_10(i) = sum(  EWMA_btp_04_95_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_95_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_04_90_tx_wind_10(i) = sum(  EWMA_btp_04_90_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_90_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );

    count_EWMA_btp_04_80_tx_wind_10(i) = sum(  EWMA_btp_04_80_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_80_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_70_tx_wind_10(i) = sum(  EWMA_btp_04_70_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_70_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_60_tx_wind_10(i) = sum(  EWMA_btp_04_60_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_60_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_50_tx_wind_10(i) = sum(  EWMA_btp_04_50_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_50_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_40_tx_wind_10(i) = sum(  EWMA_btp_04_40_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_40_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_30_tx_wind_10(i) = sum(  EWMA_btp_04_30_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_30_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_20_tx_wind_10(i) = sum(  EWMA_btp_04_20_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_20_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_10_tx_wind_10(i) = sum(  EWMA_btp_04_10_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     & EWMA_btp_04_10_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );
                                 
    count_EWMA_btp_04_0_tx_wind_10(i) = sum(    EWMA_btp_04_0_tx_wind_10 >= (i-1)  * range_EWMA_btp_04_wind_10 / num_divisions_btp ...
                                     &  EWMA_btp_04_0_tx_wind_10 <  (i)    * range_EWMA_btp_04_wind_10 / num_divisions_btp );                                 

end

