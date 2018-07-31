
for i = 1:num_divisions_btp
 
    count_EWMA_btp_06_100_tx(i) = sum( EWMA_btp_06_100_tx >= (i-1) * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_100_tx <  (i)   * range_EWMA_btp_06 / num_divisions_btp );

    count_EWMA_btp_06_95_tx(i) = sum(  EWMA_btp_06_95_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_95_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_06_90_tx(i) = sum(  EWMA_btp_06_90_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_90_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );

    count_EWMA_btp_06_80_tx(i) = sum(  EWMA_btp_06_80_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_80_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_70_tx(i) = sum(  EWMA_btp_06_70_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_70_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_60_tx(i) = sum(  EWMA_btp_06_60_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_60_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_50_tx(i) = sum(  EWMA_btp_06_50_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_50_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_40_tx(i) = sum(  EWMA_btp_06_40_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_40_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_30_tx(i) = sum(  EWMA_btp_06_30_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_30_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_20_tx(i) = sum(  EWMA_btp_06_20_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_20_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_10_tx(i) = sum(  EWMA_btp_06_10_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     & EWMA_btp_06_10_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );
                                 
    count_EWMA_btp_06_0_tx(i) = sum(    EWMA_btp_06_0_tx >= (i-1)  * range_EWMA_btp_06 / num_divisions_btp ...
                                     &  EWMA_btp_06_0_tx <  (i)    * range_EWMA_btp_06 / num_divisions_btp );                                 

end

