
for i = 1:num_divisions_btp
 
    count_EWMA_btp_04_100_tx(i) = sum( EWMA_btp_04_100_tx >= (i-1) * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_100_tx <  (i)   * range_EWMA_btp_04 / num_divisions_btp );

    count_EWMA_btp_04_95_tx(i) = sum(  EWMA_btp_04_95_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_95_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_04_90_tx(i) = sum(  EWMA_btp_04_90_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_90_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );

    count_EWMA_btp_04_80_tx(i) = sum(  EWMA_btp_04_80_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_80_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_70_tx(i) = sum(  EWMA_btp_04_70_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_70_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_60_tx(i) = sum(  EWMA_btp_04_60_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_60_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_50_tx(i) = sum(  EWMA_btp_04_50_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_50_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_40_tx(i) = sum(  EWMA_btp_04_40_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_40_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_30_tx(i) = sum(  EWMA_btp_04_30_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_30_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_20_tx(i) = sum(  EWMA_btp_04_20_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_20_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_10_tx(i) = sum(  EWMA_btp_04_10_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     & EWMA_btp_04_10_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );
                                 
    count_EWMA_btp_04_0_tx(i) = sum(    EWMA_btp_04_0_tx >= (i-1)  * range_EWMA_btp_04 / num_divisions_btp ...
                                     &  EWMA_btp_04_0_tx <  (i)    * range_EWMA_btp_04 / num_divisions_btp );                                 

end

