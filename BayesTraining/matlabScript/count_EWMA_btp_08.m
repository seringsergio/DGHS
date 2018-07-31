
for i = 1:num_divisions_btp
 
    count_EWMA_btp_08_100_tx(i) = sum( EWMA_btp_08_100_tx >= (i-1) * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_100_tx <  (i)   * range_EWMA_btp_08 / num_divisions_btp );

    count_EWMA_btp_08_95_tx(i) = sum(  EWMA_btp_08_95_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_95_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_08_90_tx(i) = sum(  EWMA_btp_08_90_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_90_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );

    count_EWMA_btp_08_80_tx(i) = sum(  EWMA_btp_08_80_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_80_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_70_tx(i) = sum(  EWMA_btp_08_70_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_70_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_60_tx(i) = sum(  EWMA_btp_08_60_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_60_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_50_tx(i) = sum(  EWMA_btp_08_50_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_50_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_40_tx(i) = sum(  EWMA_btp_08_40_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_40_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_30_tx(i) = sum(  EWMA_btp_08_30_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_30_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_20_tx(i) = sum(  EWMA_btp_08_20_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_20_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_10_tx(i) = sum(  EWMA_btp_08_10_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     & EWMA_btp_08_10_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );
                                 
    count_EWMA_btp_08_0_tx(i) = sum(    EWMA_btp_08_0_tx >= (i-1)  * range_EWMA_btp_08 / num_divisions_btp ...
                                     &  EWMA_btp_08_0_tx <  (i)    * range_EWMA_btp_08 / num_divisions_btp );                                 

end

