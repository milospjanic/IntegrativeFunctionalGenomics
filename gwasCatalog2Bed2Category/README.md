# gwasCatalog2Bed2Category
This is the script that will connect to http://www.genome.gov, download GWAS Catalog, convert it to a bed file with "chr position position+1 proxy_gene phenotype", and then take all your input search terms and select those entries in the catalog that match the term, and create separate bed files for each search term.

Script will create and call two 'subscripts' GwasCatalog2Bed.sh and main.sh. Main.sh will be removed while GwasCatalog2Bed.sh will not be removed and you can use it afterwards to download whole GWAS Catalog in bed format.

Files that will be generated are: GwasCatalog.bed, which contains shorter bed version of the entire GWAS Catalog and phenotype specific bed files.

gwasCatalog2Bed2Category will also remove duplicates from phenotype/term specific bed files, that may occur as you may greb similar but different phenotypes that contain identical SNPs. Script will save those files as .bed.cut.sort.uniq and report the number of SNPs before and after removing deplicates.

#Usage
Enter all search terms as arguments passed to a Bash script and if your serach term is a phrase use double quotes. Note that names of phenotypes in GWAS Catalog start with capital letter but then next word is with small letter. **That is why we enabled serach to be case insensitive in this script.**
<pre>
chmod 755 gwasCatalog2Bed2Category.sh
~/gwasCatalog2Bed2Category "Coronary artery" "Coronary heart" "Bipolar disorder"
</pre>

#Example

<pre>
chmod 755 gwasCatalog2Bed2Category.sh
~/gwasCatalog2Bed2Category "Coronary artery" "Coronary heart" "Bipolar disorder"

--2016-04-20 00:01:09--  http://www.genome.gov/admin/gwascatalog.txt
Resolving www.genome.gov (www.genome.gov)... 156.40.242.24
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.genome.gov/admin/gwascatalog.txt [following]
--2016-04-20 00:01:09--  https://www.genome.gov/admin/gwascatalog.txt
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10407265 (9.9M) [text/plain]
Saving to: `gwascatalog.txt'

100%[======================================================================================================>] 10,407,265  1.46M/s   in 7.1s    

2016-04-20 00:01:17 (1.39 MB/s) - `gwascatalog.txt' saved [10407265/10407265]

Received: Coronary artery
Done: Coronary artery
Received: Coronary heart
Done: Coronary heart
Received: Bipolar disorder
Done: Bipolar disorder
Gwas Catalog number of SNP-phenotype associations:
18899 GwasCatalog.bed
Gwas Catalog number of SNP-phenotype associations per category:
Phenotype: Coronary artery
110 Coronary artery.gwascatalog.bed
Phenotype: Coronary heart
143 Coronary heart.gwascatalog.bed
Phenotype: Bipolar disorder
324 Bipolar disorder.gwascatalog.bed
Gwas Catalog number of SNP-phenotype associations per category AFTER REMOVING DUPLICATES:
Phenotype: Coronary artery
89 Coronary artery.gwascatalog.bed.cut.sort.uniq
Phenotype: Coronary heart
130 Coronary heart.gwascatalog.bed.cut.sort.uniq
Phenotype: Bipolar disorder
310 Bipolar disorder.gwascatalog.bed.cut.sort.uniq

</pre>
