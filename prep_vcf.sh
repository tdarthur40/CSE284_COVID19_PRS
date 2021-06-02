#!/bin/bash

# -pe smp 4

chrom=$1
pop=$2

data_dir=/frazer01/home/jennifer/private/cse284_project/data
pop_dir=${data_dir}/1000Genomes_byPop/${pop}
vcf_file=${data_dir}/1000Genomes/ALL.chr${chrom}.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz

date >& 2
cmd="bcftools view \
	-S ${pop_dir}/${pop}.indv \
	-Ou $vcf_file |\
	bcftools norm -m - |\
	bcftools annotate \
	--set-id '%CHROM:%POS:%REF:%ALT' \
	-Oz -o ${pop_dir}/chr${chrom}.vcf.gz"
echo $cmd; eval $cmd

date >& 2
cmd="vcftools \
	--gzvcf ${pop_dir}/chr${chrom}.vcf.gz \
	--snps ${data_dir}/C2_covid19_snps/c2_covid19.snps \
	--hwe 0.000001 \
	--recode \
	--out ${pop_dir}/chr${chrom}"
echo $cmd; eval $cmd

date >& 2
cmd="bgzip -c ${pop_dir}/chr${chrom}.recode.vcf > ${pop_dir}/chr${chrom}.recode.vcf.gz;\
	tabix -p vcf ${pop_dir}/chr${chrom}.recode.vcf.gz"
echo $cmd; eval $cmd

date >& 2
echo Done!
