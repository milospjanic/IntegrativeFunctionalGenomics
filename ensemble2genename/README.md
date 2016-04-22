# ensemble2genename

This is combined bash/R script that will use a file with **human** ENSEMBLE geneIDs in **a first column** of a file and append a gene name to it, while keeping the structure of the file from  other columns. Ensemble2genename sets its host to ensembl.org thus it could be especially useful when biomaRt site is down.


# Dependencies
Rscript, BiomaRt

# Usage
chmod 775 ensemble2genename.sh

./ensemble2genename.sh file.txt

# Example

<pre>
head file.txt
ENSG00000210077 chrM    1602    1670    +       69      0
ENSG00000210082 chrM    1671    3229    +       1559    106043
ENSG00000209082 chrM    3230    3304    +       75      1
ENSG00000198888 chrM    3307    4262    +       956     29426
ENSG00000210100 chrM    4263    4331    +       69      0
ENSG00000210107 chrM    4329    4400    -       72      0
ENSG00000210112 chrM    4402    4469    +       68      0
ENSG00000198763 chrM    4470    5511    +       1042    15914
ENSG00000210117 chrM    5512    5579    +       68      0
ENSG00000210127 chrM    5587    5655    -       69      0

chmod 775 ensemble2genename.sh
./ensemble2genename.sh file.txt


head file.txt.genename

MT-TV ENSG00000210077   chrM    1602    1670    +       69      0
MT-RNR2 ENSG00000210082 chrM    1671    3229    +       1559    106043
MT-TL1 ENSG00000209082  chrM    3230    3304    +       75      1
MT-ND1 ENSG00000198888  chrM    3307    4262    +       956     29426
MT-TI ENSG00000210100   chrM    4263    4331    +       69      0
MT-TQ ENSG00000210107   chrM    4329    4400    -       72      0
MT-TM ENSG00000210112   chrM    4402    4469    +       68      0
MT-ND2 ENSG00000198763  chrM    4470    5511    +       1042    15914
MT-TW ENSG00000210117   chrM    5512    5579    +       68      0
MT-TA ENSG00000210127   chrM    5587    5655    -       69      0


