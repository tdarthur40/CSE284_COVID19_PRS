# Predicting COVID-19 Severity Using a Polygenic Risk Score

Authors: Jonathan Lam, Timothy D. Arthur, Jennifer P. Nguyen

<b> 0.Clean_Covid19_Variants.ipynb </b>
- https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_A2_ALL_leave_23andme_20210107.b37.txt.gz
- Removed duplicate SNPs
- Removed ambiguous SNPs

<b> 0.Clean_1000Genomes.sh </b>
- Phase 3 1000 Genomes dataset (GRCh37)
- Excluded SNPs with HWE p < 1e-6
- Filtered overlapped SNPs with COVID19 variants
- Uses prep_vcf.sh to filter by chromosome

<b> 2.PRS_Blood_Analysis.ipynb </b>
- Examined distribution of blood type in 1000G populations
- Examined association with PRS and blood type
- Examined associations with PRS, blood type, and populations

<b> 3.PRS_Validation.ipynb </b>
- Validated PRS model using AUC

<b> plink/ </b>
- Contains plink files needed for PRS
- Several files are not uploaded due to large size
- Refer to 1.Compute_PRS.sh for code used to generate

<b> training_set.txt </b>
- 1000G individuals in training set

<b> validation_set.txt </b>
- 1000G individuals in validation set

<b> Blood type predictions for 1000G </b>
- https://github.com/kevin-fang/Arvados-Blood-Types-and-Ethnicity

<b> PRS Plink Tutorial </b> 
- https://choishingwan.github.io/PRS-Tutorial/plink/
