# bamsplit2bigwig

This script will take a bam file **mapped to the human genome hg19** and convert it to two **strand specific** bigwig files that could be loaded to UCSC Genome Browser. It depends on bedtools bamtobed (aka bamToBed), and it will attempt to download and execute three UCSC scripts, bedItemOverlapCount, bedGraphToBigWig and fetchChromSizes, so make sure your connection is working.
Converting bam to bigwig and separating according to strand could be useful to visualize nucleosomal or protein binding 'footprints' in ChIP-Seq experiments as at the boundaries of protein-DNA interactions will be marked with reads mapping on different DNA strands. 

# Usage

<pre>
chmod 775 bamsplit2bigwig
./bamsplit2bigwig file.bam
</pre>

Note the bam file name is an example, add your file name.

# Example output

<pre>
./bamsplit2bigwig HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam
--2016-04-12 14:39:49--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedItemOverlapCount
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 15593081 (15M) [text/plain]
Saving to: ‘bedItemOverlapCount’

100%[=======================================================================================================================================================>] 15,593,081  32.2MB/s   in 0.5s

2016-04-12 14:39:50 (32.2 MB/s) - ‘bedItemOverlapCount’ saved [15593081/15593081]

--2016-04-12 14:39:50--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/fetchChromSizes
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2793 (2.7K) [text/plain]
Saving to: ‘fetchChromSizes’

100%[=======================================================================================================================================================>] 2,793       --.-K/s   in 0s

2016-04-12 14:39:50 (93.9 MB/s) - ‘fetchChromSizes’ saved [2793/2793]

INFO: trying WGET /usr/bin/wget for database hg19
url: http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.chrom.sizes
--2016-04-12 14:46:10--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3831823 (3.7M) [text/plain]
Saving to: ‘bedGraphToBigWig’

100%[=======================================================================================================================================================>] 3,831,823   18.0MB/s   in 0.2s

2016-04-12 14:46:11 (18.0 MB/s) - ‘bedGraphToBigWig’ saved [3831823/3831823]

ls -l HCASMC_2989_6hr_SF.accepted_hits.sort.coord*
-rw-r--r-- 1 mpjanic mpjanic 1847942103 May 27  2015 HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam
-rw-rw-r-- 1 mpjanic mpjanic   49556726 Apr 12 14:46 HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam.minus.bw
-rw-rw-r-- 1 mpjanic mpjanic   49504820 Apr 12 14:46 HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam.plus.bw
</pre>
