#!/bin/bash

#write R script, needs biomaRt

echo "#!/usr/bin/Rscript
library(biomaRt)
listMarts(host=\"grch37.ensembl.org\")
ensembl = useMart(\"ENSEMBL_MART_ENSEMBL\",dataset=\"hsapiens_gene_ensembl\", host=\"grch37.ensembl.org\")
id_merge = getBM(attributes=c(\"ensembl_gene_id\",\"external_gene_name\"),mart=ensembl)
write.table(id_merge, file=\"id_merge.txt\", sep = \"\t\", quote =F, col.names=F, row.names=F)
" > script.r

#run R script

chmod 775 script.r
./script.r

#Use awk to append gene names

awk 'NR==FNR {h[$1] = $1; h2[$1] = $2; next} {print h2[$1], $0}' id_merge.txt $1 >$1.genename

#remove temporary files

rm id_merge.txt
rm script.r
