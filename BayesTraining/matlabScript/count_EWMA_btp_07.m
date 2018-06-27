
for i = 1:num_divisions_btp
 
    count_EWMA_btp_07_100_tx(i) = sum( EWMA_btp_07_100_tx >= (i-1) * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_100_tx <  (i)   * range_EWMA_btp_07 / num_divisions_btp );

    count_EWMA_btp_07_95_tx(i) = sum(  EWMA_btp_07_95_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_95_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_07_90_tx(i) = sum(  EWMA_btp_07_90_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_90_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );

    count_EWMA_btp_07_80_tx(i) = sum(  EWMA_btp_07_80_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_80_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_70_tx(i) = sum(  EWMA_btp_07_70_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_70_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_60_tx(i) = sum(  EWMA_btp_07_60_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_60_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_50_tx(i) = sum(  EWMA_btp_07_50_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_50_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_40_tx(i) = sum(  EWMA_btp_07_40_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_40_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_30_tx(i) = sum(  EWMA_btp_07_30_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_30_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_20_tx(i) = sum(  EWMA_btp_07_20_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_20_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_10_tx(i) = sum(  EWMA_btp_07_10_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     & EWMA_btp_07_10_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );
                                 
    count_EWMA_btp_07_0_tx(i) = sum(    EWMA_btp_07_0_tx >= (i-1)  * range_EWMA_btp_07 / num_divisions_btp ...
                                     &  EWMA_btp_07_0_tx <  (i)    * range_EWMA_btp_07 / num_divisions_btp );                                 

end

