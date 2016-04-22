# binomial-test-for-genomic-overlaps
This is a combined bash/R script that will generate a binomial p-value that shows significance for the overlap of two sets of genomic regions (for example from ChIP-Seq experiments).

To calculate binomial p-value you would need two bed files as inputs. Note that binomial test does not require background set as do Fisher and hypergeometric tests.

Note that file names are optional.


#Usage

<pre>
./binomial2.sh file1.bed file2.bed
</pre>

#Example output
<pre>
./binomial.sh file1.bed file2.bed
Number of unique overlaps of A and B
143
Calculating coverage of ./file2.bed in human genome hg19
Base pair coverage of B in hg19 is: 0.00566281
Calculating binomial p-value with pbinom(143, 42920, 0.00566281)
Binomial p-value:
[1] 2.196093e-12
 num 2.2e-12
</pre>
