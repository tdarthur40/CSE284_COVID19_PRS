#!/bin/bash 

### Followed PRS tutorial at https://choishingwan.github.io/PRS-Tutorial/plink/
### Executed each command independently and examined output 
### Wrangled plink output in R Jupyter Notebook in intermediate steps according to tutorial
 
plink=/software/plink-1.90b3x
vcf=/frazer01/home/tarthur/cse284/ALL_COVID19.vcf.gz
bfile=/frazer01/home/tarthur/cse284/bfiles/ALL_COVID

# filtered 1000G vcf for snps-only
${plink}/plink --vcf $vcf --snps-only --write-covar --make-bed --out $bfile

# filtered 1000G vcf for MAF, Hardy-Weinberg Eq, etc,,, 
${plink}/plink \
  --bfile $bfile  \
  --maf 0.01 \
  --hwe 1e-6 \
  --geno 0.01 \
  --mind 0.01 \
  --write-snplist \
  --make-just-fam \
  --out ${bfile}.QC

# perform pruning for SNPs in high LD
${plink}/plink \
  --bfile $bfile \
  --keep ${bfile}.QC.fam \
  --extract ${bfile}.QC.snplist \
  --indep-pairwise 200 50 0.25 \
  --out ${bfile}.QC

# compute heterozygosity
${plink}/plink \
  --bfile $bfile \
  --extract ${bfile}.QC.prune.in \
  --keep ${bfile}.QC.fam \
  --het \
  --out ${bfile}.QC

### review output in jup notebook and calculate F score for heterozygosity and filter
### then remove mismatching SNPs between summary statistics and 1000G in R

# remove related individuals from 1000G
${plink}/plink \
  --bfile $bfile \
  --extract ${bfile}.QC.prune.in \
  --keep ${bfile}.valid.sample \
  --rel-cutoff 0.125 \
  --out ${bfile}.QC

# generate final QC'ed dataset
${plink}/plink \
  --bfile $bfile \
  --make-bed \
  --keep ${bfile}.QC.rel.id \
  --out ${bfile}.QC \
  --extract ${bfile}.QC.snplist \
  --exclude ${bfile}.mismatch \
  --a1-allele ${bfile}.a1
