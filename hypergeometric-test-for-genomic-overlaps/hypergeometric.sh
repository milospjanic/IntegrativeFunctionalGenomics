#!/bin/bash

# hypergeometric-test-for-genomic-overlaps

#intersecting with bedtools
bedtools intersect -a $1 -b $3 > A_BG
bedtools intersect -a $2 -b $3 > B_BG

bedtools intersect -wa -a A_BG -b B_BG | uniq > A_B_BG
bedtools intersect -wa -a B_BG -b A_BG | uniq > B_A_BG
bedtools intersect -v -a A_BG -b A_B_BG | uniq > A_BG_noB
bedtools intersect -v -a B_BG -b B_A_BG | uniq > B_BG_noA
bedtools intersect -v -a $3 -b A_BG | uniq > BG_noA

echo "Number of uniq A overlapping B in genomic background"
wc -l A_B_BG | cut -f1 -d ' '
echo "Number of uniq B overlapping A in genomic background"
wc -l B_A_BG | cut -f1 -d ' '
echo "Number of uniq A not overlapping B in genomic background"
wc -l A_BG_noB | cut -f1 -d ' '
echo "Number of uniq B not overlapping A in genomic background"
wc -l B_BG_noA | cut -f1 -d ' '
echo "Number of genomic background not overlapping A or B"
wc -l BG_noA | cut -f1 -d ' '

echo "Hypergeometric p-value will be calculated with phyper in R as phyper(A-B overlap in BG, A no B in BG, total BG minus BG-A overlap, B no A in BG, lower.tail = FALSE, log.p = FALSE)"
#writing and executing R script
echo "#!/usr/bin/Rscript
A_B.hypergeometric  <-
phyper($(wc -l A_B_BG | cut -f1 -d ' '), $(wc -l A_BG_noB | cut -f1 -d ' '), $(wc -l BG_noA | cut -f1 -d ' '), $(wc -l B_BG_noA | cut -f1 -d ' '), lower.tail = FALSE, log.p = FALSE)

A_B.hypergeometric

str(A_B.hypergeometric)" > script.r

chmod 775 script.r
echo "Hypergeometric p-value:"
./script.r

#removing intermediary files
rm A_BG
rm B_BG
rm A_B_BG
rm B_A_BG
rm A_BG_noB
rm B_BG_noA
rm BG_noA
rm script.r
