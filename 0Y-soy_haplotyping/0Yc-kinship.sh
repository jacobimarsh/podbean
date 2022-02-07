module load java
tassel5 -Xmx100g -h nohet_fin_impu_bial_16_SNP_id_filt_all.hmp.txt -KinshipPlugin -method Centered_IBS -endPlugin -export nohet_fin_impu_bial_16_SNP_id_filt_all_kinship.txt -exportType SqrMatrix
touch temp_empty.txt
tail -n +4 nohet_fin_impu_bial_16_SNP_id_filt_all_kinship.txt | awk '{print $1}' | tr "\n" "\t" >> temp_head.txt
paste temp_empty.txt temp_head.txt >> nohet_fin_impu_bial_16_SNP_id_filt_all_kinship_HMformatted.txt
tail -n +4 nohet_fin_impu_bial_16_SNP_id_filt_all_kinship.txt >> nohet_fin_impu_bial_16_SNP_id_filt_all_kinship_HMformatted.txt
rm temp_empty.txt
rm temp_head.txt
##prefin
module load java
tassel5 -Xmx100g -h nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt -KinshipPlugin -method Centered_IBS -endPlugin -export nohet_prefin_impu_bial_16_SNP_id_filt_all_kinship.txt -exportType SqrMatrix
touch temp_empty.txt
tail -n +4 nohet_prefin_impu_bial_16_SNP_id_filt_all_kinship.txt | awk '{print $1}' | tr "\n" "\t" >> temp_head.txt
paste temp_empty.txt temp_head.txt >> nohet_prefin_impu_bial_16_SNP_id_filt_all_kinship_HMformatted.txt
tail -n +4 nohet_prefin_impu_bial_16_SNP_id_filt_all_kinship.txt >> nohet_prefin_impu_bial_16_SNP_id_filt_all_kinship_HMformatted.txt
rm temp_empty.txt
rm temp_head.txt
