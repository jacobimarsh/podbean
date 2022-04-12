sed 's/0\/1/.\/./g' impu_bial_16_SNP_id_filt_all.vcf >> nohet_impu_bial_16_SNP_id_filt_all.vcf
sed -i 's/1\/0/.\/./g' nohet_impu_bial_16_SNP_id_filt_all.vcf
module load java
java -jar /group/pawsey0149/jmarsh1/packages/beagle.18May20.d20.jar gt=nohet_impu_bial_16_SNP_id_filt_all.vcf nthreads=22 out=nohet_prefin_impu_bial_16_SNP_id_filt_all
bgzip -d nohet_prefin_impu_bial_16_SNP_id_filt_all.vcf.gz
tassel5 -Xmx20G -vcf nohet_prefin_impu_bial_16_SNP_id_filt_all.vcf -export nohet_prefin_impu_bial_16_SNP_id_filt_all -exportType HapmapDiploid
sed -i 's/#//g' nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt
sed -i "s/^/Gm/" nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt
sed -i "s/Gmrs/rs/" nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt
#used nohet prefin because it cut too many hets ^^
grep -v $'\tAC\t\|\tAG\t\|\tAT\t\|\tCA\t\|\tCG\t\|\tCT\t\|\tGA\t\|\tGC\t\|\tGT\t\|\tTA\t\|\tTC\t\|\tTG\t\|\tA\t20\|\tC\t20\|\tG\t20\|\tT\t20' nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt >> nohet_fin_impu_bial_16_SNP_id_filt_all.hmp.txt
#pruning for independance so it can run on 100kb region
plink2 --vcf ../impu_bial_16_SNP_id_filt_all.vcf  --indep-pairwise 500 1 0.9 --make-bed --out indep500_1_0.9_impu_bial_16_SNP_id_filt_all
plink --bfile indep500_1_0.9_impu_bial_16_SNP_id_filt_all --extract indep500_1_0.9_impu_bial_16_SNP_id_filt_all.prune.in --make-bed
sed 's/0_//g' !$ > indep500_1_0.9_impu_bial_16_SNP_id_filt_all.vcf
