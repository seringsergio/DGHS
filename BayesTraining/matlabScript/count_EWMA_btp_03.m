
for i = 1:num_divisions_btp
 
    count_EWMA_btp_03_100_tx(i) = sum( EWMA_btp_03_100_tx >= (i-1) * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_100_tx <  (i)   * range_EWMA_btp_03 / num_divisions_btp );

    count_EWMA_btp_03_95_tx(i) = sum(  EWMA_btp_03_95_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_95_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_03_90_tx(i) = sum(  EWMA_btp_03_90_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_90_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );

    count_EWMA_btp_03_80_tx(i) = sum(  EWMA_btp_03_80_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_80_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_70_tx(i) = sum(  EWMA_btp_03_70_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_70_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_60_tx(i) = sum(  EWMA_btp_03_60_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_60_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_50_tx(i) = sum(  EWMA_btp_03_50_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_50_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_40_tx(i) = sum(  EWMA_btp_03_40_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_40_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_30_tx(i) = sum(  EWMA_btp_03_30_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_30_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_20_tx(i) = sum(  EWMA_btp_03_20_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_20_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_10_tx(i) = sum(  EWMA_btp_03_10_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     & EWMA_btp_03_10_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );
                                 
    count_EWMA_btp_03_0_tx(i) = sum(    EWMA_btp_03_0_tx >= (i-1)  * range_EWMA_btp_03 / num_divisions_btp ...
                                     &  EWMA_btp_03_0_tx <  (i)    * range_EWMA_btp_03 / num_divisions_btp );                                 

end

