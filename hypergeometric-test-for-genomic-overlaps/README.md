# hypergeometric-test-for-genomic-overlaps

This is a combined bash/R script that will generate a hypergeometric p-value that shows significance for the overlap of two sets of genomic regions (for example from ChIP-Seq experiments).

To calculate hypergeometric p-value you would need three BED files: 1. First bed file to overlap, i.e. file1.bed 2. Second bed file for overlap, i.e. file2.bed 3. Bed file that will serve as genomic background for overlaps, i.e. background.bed

Note that file names are optional.

As genomic background you can use e.g. combined ENCODE set of open chromatin regions or a similar data set. Genomic background is necessary to calculate the constituents of the hypergeometric test elements: A-B overlap in BG, A no B in BG, total BG minus BG-A overlap, B no A in BG.

We provide a combined ENCODE DHS data set in a bed file which you can use as a background set, background.bed. 


# Example usage

**./hypergeometric.sh file1.bed file2.bed background.bed**

# Example output 
<pre>
**./hypergeometric.sh file1.bed file2.bed background.bed**
Number of uniq A overlapping B in genomic background 
360
Number of uniq B overlapping A in genomic background 
365
Number of uniq A not overlapping B in genomic background 
3670
Number of uniq B not overlapping A in genomic background 
45854
Number of genomic background not overlapping A or B 
2229526

Hypergeometric p-value will be calculated with phyper in R as phyper(A-B overlap in BG, A no B in BG, total BG minus BG-A overlap, B no A in BG, lower.tail = FALSE, log.p = FALSE)

Hypergeometric p-value:
[1] 2.568593e-129
 num 2.57e-129
</pre>
