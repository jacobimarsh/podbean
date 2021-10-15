#16_30125287 is the SNP for pdh1 that is being investigated

pheno_test.sh 16_30125287 16_SNP_id_filt_all.vcf late_shatter.txt
#Site         Alleles  nInd  nIndPheno  AvPheno
#16_30125287  REF_G    848   407        1.61671
#16_30125287  ALT_A    370   141        2.8156
#16_30125287  HET      31    15         2.53333
#16_30125287  ./N      0
#16_30125287  ./.      3

pheno_test.sh 16_30125287 16_SNP_id_filt_all.vcf early_shatter565.txt
#Site         Alleles  nInd  nIndPheno  AvPheno
#16_30125287  REF_G    848   407        1.15553
#16_30125287  ALT_A    370   141        1.7078
#16_30125287  HET      31    15         1.58667
#16_30125287  ./N      0
#16_30125287  ./.      3

#It's odd that both early and late phenotypes are elevated in the alternate allele population... 
#Need to investigate how each phenotype was measured
