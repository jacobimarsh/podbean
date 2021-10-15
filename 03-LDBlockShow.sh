#Range from first to last SNP with R2>0.7 with the GWAS-SNP (1.2Mb)
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2 -Region 16:29215372:30408206 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2 -OutPut 16_30125287_imp_R2_fin -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
