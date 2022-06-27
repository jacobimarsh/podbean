grep -v scaffold Gm1.raw.vcf | sed 's/glyma.Wm82.gnm4.Gm0//g' | sed 's/glyma.Wm82.gnm4.Gm//g' | sed 's/-/./g' | sed 's/:[^\t]*\t/\t/g' | sed 's/:[^\t]*$//'  > 1.raw.vcf
module load java

for i in {1..20}
do echo "vcftools --vcf ${i}.raw.vcf --keep-only-indels --out ${i}_indel_all.vcf --recode --recode-INFO-all
vcftools --vcf ${i}.raw.vcf --remove-indels --out ${i}_SNP_all.vcf --recode --recode-INFO-all
vcftools --vcf ${i}_SNP_all.vcf.recode.vcf --max-missing 0.1 --maf 0.01 --minQ 30 --recode --out ${i}_q30_m0.1_af0.05_SNP
vcftools --vcf ${i}_indel_all.vcf.recode.vcf --max-missing 0.9 --non-ref-af-any 0.01 --recode --out ${i}_q30_m0.9_af0.01_INDEL
mv ${i}_q30_m0.9_af0.01_INDEL.recode.vcf ${i}_indel_filt_all.vcf
mv ${i}_q30_m0.1_af0.05_SNP.recode.vcf ${i}_SNP_filt_all.vcf
bcftools annotate --set-id +'%CHROM\_%POS' ${i}_SNP_filt_all.vcf > ${i}_SNP_id_filt_all.vcf
bcftools view --max-alleles 2 ${i}_SNP_id_filt_all.vcf > ${i}_SNP_id_filt_bial_all.vcf
java -Xmx100g -jar beagle.28Jun21.220.jar gt=${i}_SNP_id_filt_bial_all.vcf nthreads=15 out=impu_bial_${i}_SNP_id_filt_all
bgzip -cd impu_bial_${i}_SNP_id_filt_all.vcf.gz > impu_bial_${i}_SNP_id_filt_all.vcfzz
done | sed 's/aa/"/' | sed 's/zz/"/'
grep '^#' 1_SNP_id_filt_bial_all.vcf > all_SNP_id_filt_bial.vcf
grep '^#' impu_bial_1_SNP_id_filt_all.vcf > impu_bial_all_SNP_id_filt.vcf
for i in {1..20}
do
grep -v '^#' ${i}_SNP_id_filt_bial_all.vcf >> all_SNP_id_filt_bial.vcf
grep -v '^#' impu_bial_${i}_SNP_id_filt_all.vcf >> impu_bial_all_SNP_id_filt.vcf
done
