#!/bin/bash

#create bed from bam, requires bedtools bamToBed
bamToBed -i $1 -split > accepted_hits.bed

#download bedItemOverlapCount
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedItemOverlapCount
chmod 775 bedItemOverlapCount

#fetch hg19 chromosome sizes
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/fetchChromSizes
chmod 775 fetchChromSizes
./fetchChromSizes hg19 > hg19.chrom.sizes

#create plus and minus strand bedgraph
awk '{if($6=="+") print}' accepted_hits.bed | sort -k1,1 | ./bedItemOverlapCount hg19 -chromSize=hg19.chrom.sizes stdin | sort -k1,1 -k2,2n > accepted_hits.plus.bedGraph
awk '{if($6=="-") print}' accepted_hits.bed | sort -k1,1 | ./bedItemOverlapCount hg19 -chromSize=hg19.chrom.sizes stdin | sort -k1,1 -k2,2n | awk '{OFS="\t"; print $1,$2,$3,"-"$4}' > accepted_hits.minus.bedGraph

#download bedGraphToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
chmod 755 bedGraphToBigWig

#create plus and minus strand bigwig
./bedGraphToBigWig accepted_hits.plus.bedGraph hg19.chrom.sizes $1.plus.bw
./bedGraphToBigWig accepted_hits.minus.bedGraph hg19.chrom.sizes $1.minus.bw

#removing intermediery files
rm accepted_hits.bed
rm accepted_hits.plus.bedGraph
rm accepted_hits.minus.bedGraph
rm bedItemOverlapCount
rm bedGraphToBigWig
rm fetchChromSizes
rm hg19.chrom.sizes
