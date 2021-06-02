pop=ALL
dir=/frazer01/home/jennifer/private/cse284_project/data
work_dir=${dir}/1000Genomes_byPop
pop_dir=${work_dir}/${pop}

# 2. Filter 1000Genomes
chroms=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22)
pipeline=prep_vcf.sh

for chrom in ${chroms[@]}; do
cmd="qsub -N ${pop}_chr${chrom} -o logs/${pop}_chr${chrom}.out -e logs/${pop}_chr${chrom}.err -V -cwd -pe smp 4 ${pipeline} ${chrom} ${pop}"
#eval $cmd
done

# 3. Create file list to concat
for chrom in ${chroms[@]}; do
touch ${pop_dir}/vcf_filelist.txt
echo ${pop_dir}/chr${chrom}.recode.vcf.gz >> ${pop_dir}/vcf_filelist.txt
done

pipeline=concat.sh
cmd="qsub -N ${pop}_concat -o logs/${pop}_concat.out -e logs/${pop}_concat.err -V -cwd -pe smp 8 -hold_jid ${pop}_chr* $pipeline $pop"
echo $cmd; eval $cmd
