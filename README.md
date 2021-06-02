# Predicting COVID-19 Severity Using a Polygenic Risk Score

0.Clean_Covid19_Variants.ipynb
- Removed duplicate SNPs
- Removed ambiguous SNPs

0.Clean_1000Genomes.sh
- Phase 3 1000 Genomes dataset (GRCh37)
- Excluded SNPs with HWE p < 1e-6
- Filtered overlapped SNPs with COVID19 variants
- Uses prep_vcf.sh to filter by chromosome

2.PRS_Blood_Analysis.ipynb
- Examined distribution of blood type in 1000G populations
- Examined association with PRS and blood type
- Examined associations with PRS, blood type, and populations

3.PRS_Validation.ipynb
- Validated PRS model using AUC

training_set.txt
- 1000Genome individuals in training set

validation_set.txt
- 1000Genome individuals in validation set
