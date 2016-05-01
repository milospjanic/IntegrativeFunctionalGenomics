# Integrative-Functional-Genomics---Nature-Comm-2016

This is the repository for scripts that were used in paper:

*Integrative functional genomics identifies regulatory mechanisms at coronary artery disease loci*

*Miller and Pjanic et al, 2016, Nature Communications.*

#bed2GwasCatalogBinomialMod1Ggplot
The modification of the binomial test includes calculation of the binomial p-value using modified probability of the base nucleotide to localize in the tested region. In the standard binomial test, one uses the probability of the base nucleotide to be localized in the tested input regions of the bed file, which corresponds to the percent of input bed in the human genome. This approach is robust and less sensitive towards the larger (but not smaller) sizes of the tested GWAS category, however it does not resolve well the p-values of various categories, which you can see in the examples provides. In addition, calculated P-value will approximately correspond to the fold change (number of overlaps/total number of GWAS variants), due to the fact in addition to number of overlaps/total number of GWAS variants (that correspond to the fold change) the only parameter used to calculate binomial p-value is the probability of a base to be in the input region and which is constant for each tested GWAS category. Hence, this is the reason the p-value/fold change plot will look almost diagonal in every example.


Therefore, we modified the calculation of the probability to include the probability of base nucleotide to be present in the input regions that correspond the the tested GWAS category. This modification will better resolve p-values and will be less sensitive to the inflated p-values of smaller datasets, however the modification itself inflates p-values, which is something to consider when interpreting the results. One example of the better resolution of the p-values is the example of dataset of open chromatin regions in ENCODE Glioblastoma cell line. When tested with standard binomial test the brain related categories such as Schizophrenia and Bipolar disorder do not emerge tot the top of the list. Surprisingly, the top categories are not brain related and are relatively small datasets (CardiogramplusC4D, Diastolic blood pressure, Coronary heart disease). When modified binomial is applied, we obtained better resolution of brain related categories, with the Schizophrenia and Bipolar disorder being top categories.

**Example of standard binomial test - Glioblastoma ENCODE cell line** that does not resolve GWAS categories well. Log p-value and fold change are proportional and the graph is nearly a diagonal.

![ScreenShot](https://github.com/milospjanic/IntegrativeFunctionalGenomics/blob/master/Glioblastoma.ENCODE.binomial.png)

**Example of modified binomial test - Glioblastoma ENCODE cell line** that resolves GWAS categories. Note that modified binomial gives brain related categories as top ones, as expected for Glioblastoma ENCODE cell line.

![ScreenShot](https://github.com/milospjanic/IntegrativeFunctionalGenomics/blob/master/Glioblastoma.ENCODE.binomial.mod.png)


