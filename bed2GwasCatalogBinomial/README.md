# bed2GwasCatalogBinomial

This script will connect to GWAS Catalog and download the entire data set, create bed file, and parse and uniq according to the N-1 input arguments. Last argument provided to the bash script should be a bed file that will be used to intersect parsed bed files from the GWAS Catalog. Number of overlaps is reported and initial number of entries in parsed files.  Finally, it will create an R script that will be executed to calculate binomial p-values for each overlap. Intermediary files will be removed, except: GwasCatalog.bed (entire catalog in a bed file), \*gwascatalog.bed (parsed original files from GWAS Catalog), \*gwascatalog.bed.cut.sort.uniq.chrXY (parsed and uniqed files from GWAS Catalog), \*gwascatalog.bed.cut.sort.uniq.overlap (overlap with parsed files), GwasCatalog2Bed.sh (sciprt to download GWAS Catalog and convert to bed). Note that names of phenotypes in GWAS Catalog start with capital letter but then next word is with small letter. **That is why we enabled case insensitive search in this script.**

#Usage
<pre>
chmod 775 ./bed2GwasCatalogBinomial.sh
./bed2GwasCatalogBinomial "Coronary artery" "Coronary heart" "Bipolar disorder" "Feminism" L2_TCCTGAGC_L002_peaks.bed 
</pre>

#Dependencies 
Rscript, bedtools (needs to be in $PATH)

#Output
<pre>
./bed2GwasCatalogBinomial "Coronary artery" "Coronary heart" "Bipolar disorder" "Feminism" L2_TCCTGAGC_L002_peaks.bed 

--2016-04-20 14:41:34--  http://www.genome.gov/admin/gwascatalog.txt
Resolving www.genome.gov (www.genome.gov)... 156.40.242.24
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.genome.gov/admin/gwascatalog.txt [following]
--2016-04-20 14:41:34--  https://www.genome.gov/admin/gwascatalog.txt
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10407265 (9.9M) [text/plain]
Saving to: `gwascatalog.txt'

100%[=======================================================================================================================================================>] 10,407,265  1.49M/s   in 7.0s    

2016-04-20 14:41:42 (1.42 MB/s) - `gwascatalog.txt' saved [10407265/10407265]

Received: Coronary artery
Done: Coronary artery
Received: Coronary heart
Done: Coronary heart
Received: Bipolar disorder
Done: Bipolar disorder
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
Phenotype: Feminism
12 Feminism.gwascatalog.bed
Gwas Catalog number of SNP-phenotype associations per category AFTER REMOVING DUPLICATES:
Phenotype: Coronary artery
89 Coronary artery.gwascatalog.bed.cut.sort.uniq
Phenotype: Coronary heart
130 Coronary heart.gwascatalog.bed.cut.sort.uniq
Phenotype: Bipolar disorder
411 Bipolar disorder.gwascatalog.bed.cut.sort.uniq
Phenotype: Feminism
12 Feminism.gwascatalog.bed.cut.sort.uniq
Converting Phenotype: Coronary artery
Converting Phenotype: Coronary heart
Converting Phenotype: Bipolar disorder
Converting Phenotype: Feminism
L2_TCCTGAGC_L002_peaks.bed
Input phenotypes:
Coronary artery Coronary heart Bipolar disorder Feminism
Overlapping Phenotype SNPs with input bed: Coronary artery
Overlapping Phenotype SNPs with input bed: Coronary heart
Overlapping Phenotype SNPs with input bed: Bipolar disorder
Overlapping Phenotype SNPs with input bed: Feminism
Number of Overlapping Phenotype SNPs with input bed: Coronary artery
4 Coronary artery.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Coronary heart
7 Coronary heart.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Bipolar disorder
8 Bipolar disorder.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Feminism
0 Feminism.gwascatalog.bed.cut.sort.uniq.overlap
Number of Overlapping Phenotype SNPs with input bed: Coronary artery
4
Number of Overlapping Phenotype SNPs with input bed: Coronary heart
7
Number of Overlapping Phenotype SNPs with input bed: Bipolar disorder
8
Number of Overlapping Phenotype SNPs with input bed: Feminism
0
--2016-04-20 14:41:44--  https://genome.ucsc.edu/goldenpath/help/hg19.chrom.sizes
Resolving genome.ucsc.edu (genome.ucsc.edu)... 128.114.119.134, 128.114.119.132, 128.114.119.131, ...
Connecting to genome.ucsc.edu (genome.ucsc.edu)|128.114.119.134|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1971 (1.9K) [text/plain]
Saving to: `hg19.chrom.sizes.18'

100%[=======================================================================================================================================================>] 1,971       --.-K/s   in 0s      

2016-04-20 14:41:44 (55.3 MB/s) - `hg19.chrom.sizes.18' saved [1971/1971]

Human Genome size version hg19: 3137161264
Coverage of BED file 91380849
Fraction of hg19 0.0291285
[1] "Coronary artery"
[1] 0.1810647
[1] "Coronary heart"
[1] 0.06673914
[1] "Bipolar disorder"
[1] 0.04603295
[1] "Feminism"
[1] 0.7013601
</pre>
