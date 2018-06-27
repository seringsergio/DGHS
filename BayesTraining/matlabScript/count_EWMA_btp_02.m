
for i = 1:num_divisions_btp
 
    count_EWMA_btp_02_100_tx(i) = sum( EWMA_btp_02_100_tx >= (i-1) * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_100_tx <  (i)   * range_EWMA_btp_02 / num_divisions_btp );

    count_EWMA_btp_02_95_tx(i) = sum(  EWMA_btp_02_95_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_95_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_02_90_tx(i) = sum(  EWMA_btp_02_90_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_90_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );

    count_EWMA_btp_02_80_tx(i) = sum(  EWMA_btp_02_80_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_80_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_70_tx(i) = sum(  EWMA_btp_02_70_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_70_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_60_tx(i) = sum(  EWMA_btp_02_60_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_60_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_50_tx(i) = sum(  EWMA_btp_02_50_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_50_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_40_tx(i) = sum(  EWMA_btp_02_40_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_40_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_30_tx(i) = sum(  EWMA_btp_02_30_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_30_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_20_tx(i) = sum(  EWMA_btp_02_20_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_20_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_10_tx(i) = sum(  EWMA_btp_02_10_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     & EWMA_btp_02_10_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );
                                 
    count_EWMA_btp_02_0_tx(i) = sum(    EWMA_btp_02_0_tx >= (i-1)  * range_EWMA_btp_02 / num_divisions_btp ...
                                     &  EWMA_btp_02_0_tx <  (i)    * range_EWMA_btp_02 / num_divisions_btp );                                 

end

