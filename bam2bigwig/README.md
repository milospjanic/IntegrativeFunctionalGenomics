# bam2bigwig

This script will take a bam file **mapped to the human genome hg19** and convert it to a bigwig file that could be loaded to UCSC Genome Browser. It depends on bedtools bamtobed (aka bamToBed), and it will attempt to download and execute three UCSC scripts, bedItemOverlapCount, bedGraphToBigWig and fetchChromSizes, so make sure your connection is working.

# Usage

<pre>
chmod 775 bam2bigwig
./bam2bigwig file.bam
</pre>

Note the bam file name is an example, add your file name.

# Example output

<pre>
**./bam2bigwig.sh HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam**
--2016-04-14 09:42:38--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedItemOverlapCount
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 15593081 (15M) [text/plain]
Saving to: ‘bedItemOverlapCount’

100%[=======================================================================================================================================================>] 15,593,081  31.1MB/s   in 0.5s

2016-04-14 09:42:38 (31.1 MB/s) - ‘bedItemOverlapCount’ saved [15593081/15593081]

--2016-04-14 09:42:38--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/fetchChromSizes
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2793 (2.7K) [text/plain]
Saving to: ‘fetchChromSizes’

100%[=======================================================================================================================================================>] 2,793       --.-K/s   in 0s

2016-04-14 09:42:38 (139 MB/s) - ‘fetchChromSizes’ saved [2793/2793]

INFO: trying WGET /usr/bin/wget for database hg19
url: http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.chrom.sizes
--2016-04-14 09:49:04--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3831823 (3.7M) [text/plain]
Saving to: ‘bedGraphToBigWig’

100%[=======================================================================================================================================================>] 3,831,823   24.0MB/s   in 0.2s

2016-04-14 09:49:04 (24.0 MB/s) - ‘bedGraphToBigWig’ saved [3831823/3831823]

**ls -lh HCASMC_2989_6hr_SF.accepted_hits.sort.coord***
-rw-r--r-- 1 mpjanic mpjanic 1.8G May 27  2015 HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam
-rw-rw-r-- 1 mpjanic mpjanic  75M Apr 14 09:49 HCASMC_2989_6hr_SF.accepted_hits.sort.coord.bam.bw

</pre>
