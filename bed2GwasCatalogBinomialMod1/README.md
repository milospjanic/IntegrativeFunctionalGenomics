#bed2GwasCatalogBinomialMod1

This script is a modification of the /bed2GwasCatalogBinomial and calculates binomial p-value for genomics overlaps using the following criteria. The P-values were computed using binomial cumulative distribution function b(x;n,p) in R (dbinom function). We set the parameter n equal to the total number of GWAS SNPs in a particular GWAS phenotype. Parameter x was set to the number of GWAS SNPs for a given GWAS phenotype that overlap input regions and parameter p was set to the fraction of the uniquely mappable human hg19 genome (calculated with subscript) that is localized in the input regions and contains assessed GWAS phenotype SNPs. Calculated binomial p-value equals the probability of having x or more of the n test genomic regions in the open chromatin domain given that the probability of that occurring for a single GWAS genomic location is p. Note the p-values may be inflated depending on your input files. 

This script will connect to GWAS Catalog and download the entire data set, create bed file, and parse and uniq according to the N-1 input arguments. Last argument provided to the bash script should be a bed file that will be used to intersect parsed bed files from the GWAS Catalog. Number of overlaps is reported and initial number of entries in parsed files.  Finally, it will create an R script that will be executed to calculate binomial p-values for each overlap. Intermediary files will be removed, except: GwasCatalog.bed (entire catalog in a bed file), \*gwascatalog.bed (parsed original files from GWAS Catalog), \*gwascatalog.bed.cut.sort.uniq.chrXY (parsed and uniqed files from GWAS Catalog), \*gwascatalog.bed.cut.sort.uniq.overlap (overlap with parsed files, GWAS SNP positions), \*gwascatalog.bed.cut.sort.uniq.overlap.input.int.cut (overlap with parsed files, input regions), GwasCatalog2Bed.sh (sciprt to download GWAS Catalog and convert to bed). Note that names of phenotypes in GWAS Catalog start with capital letter but then next word is with small letter. **That is why we enabled case insensitive search in this script.**

#Usage
<pre>
chmod 775 ./bed2GwasCatalogBinomial.sh
./bed2GwasCatalogBinomial "Coronary artery" "Coronary heart" "Bipolar disorder" "Feminism" file.bed 
</pre>

#Dependencies 
Rscript, bedtools (needs to be in $PATH)

#Output
<pre>
~/bed2GwasCatalogBinomiaMod2 "Coronary artery" "Coronary heart" "Bipolar disorder" "Schizophrenia" "Height" "Rheumatoid arthritis" "Ulcerative colitis" "Crohn's disease" "Calcium" "Feminism" file.bed
--2016-04-22 01:31:30--  http://www.genome.gov/admin/gwascatalog.txt
Resolving www.genome.gov (www.genome.gov)... 156.40.242.24
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.genome.gov/admin/gwascatalog.txt [following]
--2016-04-22 01:31:30--  https://www.genome.gov/admin/gwascatalog.txt
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10407265 (9.9M) [text/plain]
Saving to: `gwascatalog.txt'

100%[=======================================================================================================================================================>] 10,407,265  1.37M/s   in 7.8s    

2016-04-22 01:31:38 (1.28 MB/s) - `gwascatalog.txt' saved [10407265/10407265]

Received: Coronary artery
Done: Coronary artery
Received: Coronary heart
Done: Coronary heart
Received: Bipolar disorder
Done: Bipolar disorder
Received: Schizophrenia
Done: Schizophrenia
Received: Height
Done: Height
Received: Rheumatoid arthritis
Done: Rheumatoid arthritis
Received: Ulcerative colitis
Done: Ulcerative colitis
Received: Crohn's disease
Done: Crohn's disease
Received: Calcium
Done: Calcium
Received: Feminism
Done: Feminism
Gwas Catalog number of SNP-phenotype associations:
18899 GwasCatalog.bed
Gwas Catalog number of SNP-phenotype associations per category:
Phenotype: Coronary artery
110 Coronary artery.gwascatalog.bed
Phenotype: Coronary heart
143 Coronary heart.gwascatalog.bed
Phenotype: Bipolar disorder
444 Bipolar disorder.gwascatalog.bed
Phenotype: Schizophrenia
413 Schizophrenia.gwascatalog.bed
Phenotype: Height
521 Height.gwascatalog.bed
Phenotype: Rheumatoid arthritis
369 Rheumatoid arthritis.gwascatalog.bed
Phenotype: Ulcerative colitis
152 Ulcerative colitis.gwascatalog.bed
Phenotype: Crohn's disease
228 Crohn's disease.gwascatalog.bed
Phenotype: Calcium
24 Calcium.gwascatalog.bed
Phenotype: Feminism
12 Feminism.gwascatalog.bed
Gwas Catalog number of SNP-phenotype associations per category AFTER REMOVING DUPLICATES:
Phenotype: Coronary artery
89 Coronary artery.gwascatalog.bed.cut.sort.uniq
Phenotype: Coronary heart
130 Coronary heart.gwascatalog.bed.cut.sort.uniq
Phenotype: Bipolar disorder
411 Bipolar disorder.gwascatalog.bed.cut.sort.uniq
Phenotype: Schizophrenia
376 Schizophrenia.gwascatalog.bed.cut.sort.uniq
Phenotype: Height
460 Height.gwascatalog.bed.cut.sort.uniq
Phenotype: Rheumatoid arthritis
246 Rheumatoid arthritis.gwascatalog.bed.cut.sort.uniq
Phenotype: Ulcerative colitis
120 Ulcerative colitis.gwascatalog.bed.cut.sort.uniq
Phenotype: Crohn's disease
189 Crohn's disease.gwascatalog.bed.cut.sort.uniq
Phenotype: Calcium
22 Calcium.gwascatalog.bed.cut.sort.uniq
Phenotype: Feminism
12 Feminism.gwascatalog.bed.cut.sort.uniq
Converting Phenotype: Coronary artery
Converting Phenotype: Coronary heart
Converting Phenotype: Bipolar disorder
Converting Phenotype: Schizophrenia
Converting Phenotype: Height
Converting Phenotype: Rheumatoid arthritis
Converting Phenotype: Ulcerative colitis
Converting Phenotype: Crohn's disease
Converting Phenotype: Calcium
Converting Phenotype: Feminism
AHR.chipseq.out.cut.2000
Input phenotypes:
Coronary artery Coronary heart Bipolar disorder Schizophrenia Height Rheumatoid arthritis Ulcerative colitis Crohn's disease Calcium Feminism
Overlapping Phenotype SNPs with input bed: Coronary artery
Overlapping Phenotype SNPs with input bed: Coronary heart
Overlapping Phenotype SNPs with input bed: Bipolar disorder
Overlapping Phenotype SNPs with input bed: Schizophrenia
Overlapping Phenotype SNPs with input bed: Height
Overlapping Phenotype SNPs with input bed: Rheumatoid arthritis
Overlapping Phenotype SNPs with input bed: Ulcerative colitis
Overlapping Phenotype SNPs with input bed: Crohn's disease
Overlapping Phenotype SNPs with input bed: Calcium
Overlapping Phenotype SNPs with input bed: Feminism
Number of Overlapping Phenotype SNPs with input bed: Coronary artery
2 Coronary artery.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Coronary heart
2 Coronary heart.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Bipolar disorder
0 Bipolar disorder.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Schizophrenia
2 Schizophrenia.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Height
7 Height.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Rheumatoid arthritis
0 Rheumatoid arthritis.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Ulcerative colitis
2 Ulcerative colitis.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Crohn's disease
5 Crohn's disease.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Calcium
1 Calcium.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Feminism
0 Feminism.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Coronary artery
2
Number of Overlapping Phenotype SNPs with input bed: Coronary heart
2
Number of Overlapping Phenotype SNPs with input bed: Bipolar disorder
0
Number of Overlapping Phenotype SNPs with input bed: Schizophrenia
2
Number of Overlapping Phenotype SNPs with input bed: Height
7
Number of Overlapping Phenotype SNPs with input bed: Rheumatoid arthritis
0
Number of Overlapping Phenotype SNPs with input bed: Ulcerative colitis
2
Number of Overlapping Phenotype SNPs with input bed: Crohn's disease
5
Number of Overlapping Phenotype SNPs with input bed: Calcium
1
Number of Overlapping Phenotype SNPs with input bed: Feminism
0
--2016-04-22 01:31:40--  https://genome.ucsc.edu/goldenpath/help/hg19.chrom.sizes
Resolving genome.ucsc.edu (genome.ucsc.edu)... 128.114.119.136, 128.114.119.135, 128.114.119.133, ...
Connecting to genome.ucsc.edu (genome.ucsc.edu)|128.114.119.136|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1971 (1.9K) [text/plain]
Saving to: `hg19.chrom.sizes.9'

100%[=======================================================================================================================================================>] 1,971       --.-K/s   in 0s      

2016-04-22 01:31:40 (5.66 MB/s) - `hg19.chrom.sizes.9' saved [1971/1971]

Human Genome size version hg19: 3137161264
Coverage of BED file 11846796
Fraction of hg19 0.00377628
Overlapping Phenotype SNPs with input bed to calculate coverage: Coronary artery
Overlapping Phenotype SNPs with input bed to calculate coverage: Coronary heart
Overlapping Phenotype SNPs with input bed to calculate coverage: Bipolar disorder
Overlapping Phenotype SNPs with input bed to calculate coverage: Schizophrenia
Overlapping Phenotype SNPs with input bed to calculate coverage: Height
Overlapping Phenotype SNPs with input bed to calculate coverage: Rheumatoid arthritis
Overlapping Phenotype SNPs with input bed to calculate coverage: Ulcerative colitis
Overlapping Phenotype SNPs with input bed to calculate coverage: Crohn's disease
Overlapping Phenotype SNPs with input bed to calculate coverage: Calcium
Overlapping Phenotype SNPs with input bed to calculate coverage: Feminism
Input terms no spaces: Coronaryartery
Coverage of the input bed file that overlaps GWAS category: 9548
Fraction of hg19 3.04352e-06
Input terms no spaces: Coronaryheart
Coverage of the input bed file that overlaps GWAS category: 9048
Fraction of hg19 2.88414e-06
Input terms no spaces: Bipolardisorder
Coverage of the input bed file that overlaps GWAS category:
Fraction of hg19 0
Input terms no spaces: Schizophrenia
Coverage of the input bed file that overlaps GWAS category: 9398
Fraction of hg19 2.9957e-06
Input terms no spaces: Height
Coverage of the input bed file that overlaps GWAS category: 35493
Fraction of hg19 1.13137e-05
Input terms no spaces: Rheumatoidarthritis
Coverage of the input bed file that overlaps GWAS category:
Fraction of hg19 0
Input terms no spaces: Ulcerativecolitis
Coverage of the input bed file that overlaps GWAS category: 12748
Fraction of hg19 4.06355e-06
Input terms no spaces: Crohn'sdisease
Coverage of the input bed file that overlaps GWAS category: 31395
Fraction of hg19 1.00075e-05
Input terms no spaces: Calcium
Coverage of the input bed file that overlaps GWAS category: 4599
Fraction of hg19 1.46598e-06
Input terms no spaces: Feminism
Coverage of the input bed file that overlaps GWAS category:
Fraction of hg19 0
[1] "Coronary artery"
[1] 5.551352e-08
[1] "Coronary heart"
[1] 8.442099e-08
[1] "Bipolar disorder"
[1] 1
[1] "Schizophrenia"
[1] 7.625691e-07
[1] "Height"
[1] 4.68341e-20
[1] "Rheumatoid arthritis"
[1] 1
[1] "Ulcerative colitis"
[1] 1.893813e-07
[1] "Crohn's disease"
[1] 4.920137e-16
[1] "Calcium"
[1] 3.518233e-05
[1] "Feminism"
[1] 1

</pre>
