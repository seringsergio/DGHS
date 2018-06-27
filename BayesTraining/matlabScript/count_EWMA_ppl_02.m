
for i = 1:num_divisions_ppl
 
    count_EWMA_ppl_02_100_tx(i) = sum( EWMA_ppl_02_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_100_tx <  (i)   * range_ppl / num_divisions_ppl );
                           
    count_EWMA_ppl_02_90_tx(i) = sum( EWMA_ppl_02_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

    count_EWMA_ppl_02_80_tx(i) = sum(  EWMA_ppl_02_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_80_tx <  (i)   * range_ppl / num_divisions_ppl );

    count_EWMA_ppl_02_70_tx(i) = sum(  EWMA_ppl_02_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_70_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_60_tx(i) = sum(  EWMA_ppl_02_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_60_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_50_tx(i) = sum(  EWMA_ppl_02_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_50_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_40_tx(i) = sum(  EWMA_ppl_02_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_40_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_30_tx(i) = sum(  EWMA_ppl_02_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_30_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_20_tx(i) = sum(  EWMA_ppl_02_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_20_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_10_tx(i) = sum(  EWMA_ppl_02_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_10_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_02_0_tx(i) = sum(   EWMA_ppl_02_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_02_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
end
        