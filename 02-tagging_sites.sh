#16_30125287 is the SNP for pdh1 that is being investigated

echo 16_30125287 > 16_30125287.tmp
plink --vcf 16_SNP_id_filt_all.vcf --show-tags 16_30125287.tmp --list-all --tag-r2 0.9 --out 16_30125287 --allow-extra-chr
plink --r2 dprime with-freqs --ld-snp-list 16_30125287.tags --vcf 16_SNP_id_filt_all.vcf --out 16_30125287_tagsdp --ld-window 100000000 --ld-window-kb 1300 --allow-extra-chr
echo -e 'SNP\tMAF\tR2\tDP' > 16_30125287_tagsum.txt
echo '"CHROM" "POS" "R2"' > 16_30125287_ldbs_gwastags.txt
grep 16_30125287 16_30125287_tagsdp.ld | sed 's/ +/\t/g' | awk '{print $7,$8,$9,$10}' | sed 's/ /\t/g' | sort -r -n -k3 >> 16_30125287_tagsum.txt
#gotta restrict to R2>0.7
grep 16_30125287 16_30125287_tagsdp.ld | sed 's/ +/\t/g' | awk '$9>0.7 {print $5,$6,$9}' >> 16_30125287_ldbs_gwastags.txt
#get first and last position
tail -n +2 16_30125287_ldbs_gwastags.txt | sort -k2 | awk '{print $2}' | (head -n 1 && tail -n 1)
#29215372
#30408206
