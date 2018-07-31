
for i = 1:num_divisions_btp
 
    count_EWMA_btp_05_100_tx(i) = sum( EWMA_btp_05_100_tx >= (i-1) * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_100_tx <  (i)   * range_EWMA_btp_05 / num_divisions_btp );

    count_EWMA_btp_05_95_tx(i) = sum(  EWMA_btp_05_95_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_95_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_05_90_tx(i) = sum(  EWMA_btp_05_90_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_90_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );

    count_EWMA_btp_05_80_tx(i) = sum(  EWMA_btp_05_80_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_80_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_70_tx(i) = sum(  EWMA_btp_05_70_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_70_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_60_tx(i) = sum(  EWMA_btp_05_60_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_60_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_50_tx(i) = sum(  EWMA_btp_05_50_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_50_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_40_tx(i) = sum(  EWMA_btp_05_40_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_40_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_30_tx(i) = sum(  EWMA_btp_05_30_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_30_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_20_tx(i) = sum(  EWMA_btp_05_20_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_20_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_10_tx(i) = sum(  EWMA_btp_05_10_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     & EWMA_btp_05_10_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );
                                 
    count_EWMA_btp_05_0_tx(i) = sum(    EWMA_btp_05_0_tx >= (i-1)  * range_EWMA_btp_05 / num_divisions_btp ...
                                     &  EWMA_btp_05_0_tx <  (i)    * range_EWMA_btp_05 / num_divisions_btp );                                 

end

