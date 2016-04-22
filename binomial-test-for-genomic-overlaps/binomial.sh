#!/bin/bash

# binomial-test-for-genomic-overlaps1

#intersecting with bedtools
bedtools intersect -a $1 -b $2 | uniq > A_B_uniq.bed

echo "Number of unique overlaps of A and B"
wc -l A_B_uniq.bed | cut -f1 -d ' '

mkdir TEMP

for f in $(find . -maxdepth 1 -name $2)
do
echo "Calculating coverage of $f in human genome hg19"
cat "$f" | awk '
{
    FS="\t"
    {
        print $1"\t"$2"\t"$3"\t"($3-$2)
}
}' > TEMP/"$f".temp
done

for f in $(find TEMP/ -maxdepth 1 -name \*temp\*);
do
echo "$f"
cat "$f" | awk '
{s+=$4}END{print s}';
done > out.dat

awk '{if (count++%2!=0) print ($0/2630301437);print $0}' out.dat  > out.dat2

declare bpcoverage=$(awk '{if (count++%2!=0) print ($0/2630301437)}' out.dat)

echo "Base pair coverage of B in hg19 is: $bpcoverage"
sed -i 's/TEMP\//print\(\"/' out.dat2
sed -i 's/\.temp/\"\)/' out.dat2

awk '{if (count++%3!=2) print$0}' out.dat2 > out.dat3

awk '{if (count++%2!=0) print ("dbinom("$0")");print $0}' out.dat3  > out.dat4

#writing and executing R script
echo "#!/usr/bin/Rscript
A_B.binomial  <-
pbinom($(wc -l A_B_uniq.bed | cut -f1 -d ' '), $(wc -l $2 | cut -f1 -d ' '), $bpcoverage)

A_B.binomial

str(A_B.binomial)" > script.r

chmod 775 script.r
echo "Calculating binomial p-value with pbinom($(wc -l A_B_uniq.bed | cut -f1 -d ' '), $(wc -l $2 | cut -f1 -d ' '), $bpcoverage)"
echo "Binomial p-value:"
./script.r

#removing intermediary files

rm A_B_uniq.bed
rm script.r
rm -r TEMP
