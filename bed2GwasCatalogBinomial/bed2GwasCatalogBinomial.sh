#!/bin/bash
#download gwas catalog and create bed file with "chr position position+1 proxy_gene phenotype"
echo "
#download gwas catalog 
wget http://www.genome.gov/admin/gwascatalog.txt
awk -F\"\t\" '{if (\$12!=\"\") print \$12\"\t\"\$13\"\t\"\$15\"\t\"\$8}' gwascatalog.txt > tmp
awk -F\"\t\" '{print \$1\"\t\"\$2\"\t\"\$2+1\"\t\"\$3\"\t\"\$4}' tmp > GwasCatalog.bed
rm tmp" > GwasCatalog2Bed.sh
chmod 775 GwasCatalog2Bed.sh
./GwasCatalog2Bed.sh

#writing main to perform grep on gwascatalog.txt.cut
echo "
#grep categories
for var in \"\${@:1:\$#-1}\"
do
  echo Received: \$var
grep -i  \"\$var\" GwasCatalog.bed > \"\$var\".gwascatalog.bed 
echo Done: \$var
done

#print stats
echo "Gwas Catalog number of SNP-phenotype associations:"
wc -l GwasCatalog.bed
echo "Gwas Catalog number of SNP-phenotype associations per category:"

for var in \"\${@:1:\$#-1}\"
do
  echo Phenotype: \$var
wc -l \"\$var\".gwascatalog.bed 
done

#bed files - cut, sort, and uniq
for var in \"\${@:1:\$#-1}\"
do
cut -f1-3 \"\$var\".gwascatalog.bed > \"\$var\".gwascatalog.bed.cut
sort -k1,1V -k2,2n \"\$var\".gwascatalog.bed.cut > \"\$var\".gwascatalog.bed.cut.sort
uniq \"\$var\".gwascatalog.bed.cut.sort > \"\$var\".gwascatalog.bed.cut.sort.uniq 
rm \"\$var\".gwascatalog.bed.cut
rm \"\$var\".gwascatalog.bed.cut.sort
done

#new stats
echo "Gwas Catalog number of SNP-phenotype associations per category AFTER REMOVING DUPLICATES:"

for var in \"\${@:1:\$#-1}\"
do
  echo Phenotype: \$var
wc -l \"\$var\".gwascatalog.bed.cut.sort.uniq

done

#substitute 23 24 with X Y, add chr
for var in \"\${@:1:\$#-1}\"
do
  echo Converting Phenotype: \$var
sed -i 's/^23/X/g' \"\$var\".gwascatalog.bed.cut.sort.uniq
sed -i 's/^24/Y/g' \"\$var\".gwascatalog.bed.cut.sort.uniq
sed  's/^/chr/g' \"\$var\".gwascatalog.bed.cut.sort.uniq >  \"\$var\".gwascatalog.bed.cut.sort.uniq.chrXY
rm \"\$var\".gwascatalog.bed.cut.sort.uniq
done

" > main.sh

#calling main
chmod 775 main.sh
./main.sh "$@"

#removing files
rm gwascatalog.txt
rm main.sh

for last; do true; done
echo $last

echo Input phenotypes:
echo "${@:1:$#-1}"

#overlapping  
for var in "${@:1:$#-1}"
do
  echo Overlapping Phenotype SNPs with input bed: $var
bedtools intersect -a "$var".gwascatalog.bed.cut.sort.uniq.chrXY -b $last > "$var".gwascatalog.bed.cut.sort.uniq.overlap
done

for var in "${@:1:$#-1}"
do
  echo Number of Overlapping Phenotype SNPs with input bed: $var
wc -l "$var".gwascatalog.bed.cut.sort.uniq.overlap
done

for var in "${@:1:$#-1}"
do
  echo Number of Overlapping Phenotype SNPs with input bed: $var
wc -l "$var".gwascatalog.bed.cut.sort.uniq.overlap | cut -f1 -d ' '
done
#get the size of hg19
wget https://genome.ucsc.edu/goldenpath/help/hg19.chrom.sizes
hg19=$(cat hg19.chrom.sizes | awk '{ sum+=($2)} END {print sum}')
echo Human Genome size version hg19: $hg19

#bedtools merge on input bed
sort -k1,1V -k2,2n $last > tmp
bedtools merge -n -i tmp > $last
rm tmp
 
#calculate coverage
cov=$(cat $last | awk '{ sum+=($3-$2)} END {print sum}')
echo Coverage of BED file $cov
fra=$(cat $last | awk '{ sum+=($3-$2)} END {print sum/"'"$hg19"'"}')
echo Fraction of hg19 $fra

#create and run R script
touch script.R
echo "#!/usr/bin/Rscript" > script.R

for var in "${@:1:$#-1}"
do
  echo "print(\"$var\")" >> script.R
echo  "dbinom ($(wc -l "$var".gwascatalog.bed.cut.sort.uniq.overlap | cut -f1 -d ' '), $(wc -l "$var".gwascatalog.bed | cut -f1 -d ' '), "$fra")" >> script.R
done

chmod 775 script.R
./script.R
rm script.R
