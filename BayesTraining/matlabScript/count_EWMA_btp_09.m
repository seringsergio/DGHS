
for i = 1:num_divisions_btp
 
    count_EWMA_btp_09_100_tx(i) = sum( EWMA_btp_09_100_tx >= (i-1) * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_100_tx <  (i)   * range_EWMA_btp_09 / num_divisions_btp );

    count_EWMA_btp_09_95_tx(i) = sum(  EWMA_btp_09_95_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_95_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_09_90_tx(i) = sum(  EWMA_btp_09_90_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_90_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );

    count_EWMA_btp_09_80_tx(i) = sum(  EWMA_btp_09_80_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_80_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_70_tx(i) = sum(  EWMA_btp_09_70_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_70_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_60_tx(i) = sum(  EWMA_btp_09_60_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_60_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_50_tx(i) = sum(  EWMA_btp_09_50_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_50_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_40_tx(i) = sum(  EWMA_btp_09_40_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_40_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_30_tx(i) = sum(  EWMA_btp_09_30_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_30_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_20_tx(i) = sum(  EWMA_btp_09_20_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_20_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_10_tx(i) = sum(  EWMA_btp_09_10_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     & EWMA_btp_09_10_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );
                                 
    count_EWMA_btp_09_0_tx(i) = sum(    EWMA_btp_09_0_tx >= (i-1)  * range_EWMA_btp_09 / num_divisions_btp ...
                                     &  EWMA_btp_09_0_tx <  (i)    * range_EWMA_btp_09 / num_divisions_btp );                                 

end

