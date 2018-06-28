
for i = 1:num_divisions_btp
    
    count_EWMA_btp_01_100_tx(i) = sum( EWMA_btp_01_100_tx >= (i-1) * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_100_tx <  (i)   * range_EWMA_btp_01 / num_divisions_btp );

    count_EWMA_btp_01_95_tx(i) = sum(  EWMA_btp_01_95_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_95_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );                                 
                                 
    count_EWMA_btp_01_90_tx(i) = sum(  EWMA_btp_01_90_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_90_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );

    count_EWMA_btp_01_80_tx(i) = sum(  EWMA_btp_01_80_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_80_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_70_tx(i) = sum(  EWMA_btp_01_70_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_70_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_60_tx(i) = sum(  EWMA_btp_01_60_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_60_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_50_tx(i) = sum(  EWMA_btp_01_50_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_50_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_40_tx(i) = sum(  EWMA_btp_01_40_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_40_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_30_tx(i) = sum(  EWMA_btp_01_30_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_30_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_20_tx(i) = sum(  EWMA_btp_01_20_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_20_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_10_tx(i) = sum(  EWMA_btp_01_10_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     & EWMA_btp_01_10_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );
                                 
    count_EWMA_btp_01_0_tx(i) = sum(    EWMA_btp_01_0_tx >= (i-1)  * range_EWMA_btp_01 / num_divisions_btp ...
                                     &  EWMA_btp_01_0_tx <  (i)    * range_EWMA_btp_01 / num_divisions_btp );                                 

end

