
for i = 1:num_divisions_ppl
 
    count_EWMA_ppl_09_100_tx(i) = sum( EWMA_ppl_09_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_100_tx <  (i)   * range_ppl / num_divisions_ppl );
                           
    count_EWMA_ppl_09_90_tx(i) = sum( EWMA_ppl_09_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

    count_EWMA_ppl_09_80_tx(i) = sum(  EWMA_ppl_09_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_80_tx <  (i)   * range_ppl / num_divisions_ppl );

    count_EWMA_ppl_09_70_tx(i) = sum(  EWMA_ppl_09_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_70_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_60_tx(i) = sum(  EWMA_ppl_09_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_60_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_50_tx(i) = sum(  EWMA_ppl_09_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_50_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_40_tx(i) = sum(  EWMA_ppl_09_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_40_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_30_tx(i) = sum(  EWMA_ppl_09_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_30_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_20_tx(i) = sum(  EWMA_ppl_09_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_20_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_10_tx(i) = sum(  EWMA_ppl_09_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_10_tx <  (i)   * range_ppl / num_divisions_ppl );
                                 
    count_EWMA_ppl_09_0_tx(i) = sum(   EWMA_ppl_09_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                     & EWMA_ppl_09_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
end
        