# CSE284: Polygenic risk scores for COVID-19 severity using blood type

0.Clean_Covid19_Variants.ipynb
- Removed duplicate SNPs
- Removed ambiguous SNPs

0.Clean_1000Genomes.sh
- Excluded SNPs with HWE p < 1e-6
- Filtered overlapped SNPs with COVID19 variants

2.PRS_Blood_Analysis.ipynb
- Examined distribution of blood type in 1000G populations
- Examined association with PRS and blood type
- Examined associations with PRS, blood type, and populations

3.PRS_Validation.ipynb
- Validated PRS model using AUC
