grep -v scaffold /scratch/pawsey0149/hhu/mainwork/soy_bean/Wm82bam/gvcf/select/Gm1.raw.vcf | sed 's/glyma.Wm82.gnm4.Gm0//g' | sed 's/glyma.Wm82.gnm4.Gm//g' | sed 's/-/./g' | sed 's/:[^\t]*\t/\t/g' | sed 's/:[^\t]*$//'  > /scratch/pawsey0149/jmarsh1/podshatter/snp_calling/1.raw.vcf
module load java

for i in {1..20}
do echo "aavcftools --vcf ${i}.raw.vcf --keep-only-indels --out ${i}_indel_all.vcf --recode --recode-INFO-all
vcftools --vcf ${i}.raw.vcf --remove-indels --out ${i}_SNP_all.vcf --recode --recode-INFO-all
vcftools --vcf ${i}_SNP_all.vcf.recode.vcf --max-missing 0.1 --maf 0.01 --minQ 30 --recode --out ${i}_q30_m0.1_af0.05_SNP
vcftools --vcf ${i}_indel_all.vcf.recode.vcf --max-missing 0.9 --non-ref-af-any 0.01 --recode --out ${i}_q30_m0.9_af0.01_INDEL
mv ${i}_q30_m0.9_af0.01_INDEL.recode.vcf ${i}_indel_filt_all.vcf
mv ${i}_q30_m0.1_af0.05_SNP.recode.vcf ${i}_SNP_filt_all.vcf
beagle gt=${i}_SNP_filt_all.vcf nthreads=22 out=impu_${i}_SNP_filt_all
bgzip -cd impu_${i}_SNP_filt_all.vcf.gz >> impu_${i}_SNP_filt_all.vcfzz"
done | sed 's/aa/"/' | sed 's/zz/"/'
