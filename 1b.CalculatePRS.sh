#!/bin/bash 

### Followed PRS tutorial at https://choishingwan.github.io/PRS-Tutorial/plink/
### Executed each command independently and examined output
### Wrangled plink output in R Jupyter Notebook in intermediate steps according to tutorial

plink=/software/plink-1.90b3x
vcf=/frazer01/home/tarthur/cse284/ALL_COVID19.vcf.gz
bfile=/frazer01/home/tarthur/cse284/bfiles/ALL_COVID

# clump SNPs to remove weakly associated variants
${plink}/plink \
    --bfile ${bfile}.QC \
    --clump-p1 1 \
    --clump-r2 0.1 \
    --clump-kb 250 \
    --clump bfiles/COVID19_HGI_A2_filtered.txt \
    --clump-snp-field SNP \
    --clump-field P \
    --out $bfile

# create list of SNPs
awk 'NR!=1{print $3}' ${bfile}.clumped >  ${bfile}.valid.snp

# extract p-values from summary statistics
awk '{print $5, $9}' bfiles/COVID19_HGI_A2_filtered.txt > bfiles/SNP.pvalue

# create p-value threshold reference
echo "0.001 0 0.000001" > range_list
echo "0.001 0 0.00001" >> range_list
echo "0.001 0 0.001" >> range_list 
echo "0.05 0 0.05" >> range_list
echo "0.1 0 0.1" >> range_list
echo "0.2 0 0.2" >> range_list
echo "0.3 0 0.3" >> range_list
echo "0.4 0 0.4" >> range_list
echo "0.5 0 0.5" >> range_list

# calculate PRS 
${plink}/plink \
    --bfile ${bfile}.QC \
    --score bfiles/covid_meta_gwas.QC.txt 3 4 8 header \
    --q-score-range bfiles/range_list bfiles/SNP.pvalue \
    --extract ${bfile}.valid.snp \
    --out $bfile

# prune and integrate PCs to account for population stratification 
${plink}/plink \
    --bfile ${bfile}.QC \
    --indep-pairwise 200 50 0.25 \
    --out $bfile

${plink}/plink \
    --bfile ${bfile}.QC \
    --extract ${bfile}.prune.in \
    --pca 6 \
    --out $bfile
