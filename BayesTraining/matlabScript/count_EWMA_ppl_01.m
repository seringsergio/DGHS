
for i = 1:num_divisions_ppl
 
    count_EWMA_ppl_01_100_tx(i) = sum( EWMA_ppl_01_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_100_tx <  (i)   * range_ppl / num_divisions_ppl );
                           
    count_EWMA_ppl_01_90_tx(i) = sum( EWMA_ppl_01_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

    count_EWMA_ppl_01_80_tx(i) = sum(  EWMA_ppl_01_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_80_tx <  (i)   * range_ppl / num_divisions_ppl );

    count_EWMA_ppl_01_70_tx(i) = sum(  EWMA_ppl_01_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_70_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_60_tx(i) = sum(  EWMA_ppl_01_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_60_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_50_tx(i) = sum(  EWMA_ppl_01_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_50_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_40_tx(i) = sum(  EWMA_ppl_01_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_40_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_30_tx(i) = sum(  EWMA_ppl_01_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_30_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_20_tx(i) = sum(  EWMA_ppl_01_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_20_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_10_tx(i) = sum(  EWMA_ppl_01_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_10_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_01_0_tx(i) = sum(   EWMA_ppl_01_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_01_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
end
        