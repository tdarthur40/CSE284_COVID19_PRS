# Predicting COVID-19 Severity Using a Polygenic Risk Score

<b>0.Clean_Covid19_Variants.ipynb</b>
- https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_A2_ALL_leave_23andme_20210107.b37.txt.gz
- Removed duplicate SNPs
- Removed ambiguous SNPs

<b>0.Clean_1000Genomes.sh</b>
- Phase 3 1000 Genomes dataset (GRCh37)
- Excluded SNPs with HWE p < 1e-6
- Filtered overlapped SNPs with COVID19 variants
- Uses prep_vcf.sh to filter by chromosome

<b>2.PRS_Blood_Analysis.ipynb</b>
- Examined distribution of blood type in 1000G populations
- Examined association with PRS and blood type
- Examined associations with PRS, blood type, and populations

<b>3.PRS_Validation.ipynb</b>
- Validated PRS model using AUC

# training_set.txt
- 1000Genome individuals in training set

validation_set.txt
- 1000Genome individuals in validation set

Blood type predictions for 1000Genomes
- https://github.com/kevin-fang/Arvados-Blood-Types-and-Ethnicity
