#Range from first to last SNP with R2>0.7 with the GWAS-SNP (1.2Mb)
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2 -Region 16:29215372:30408206 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2 -OutPut 16_30125287_imp_R2_fin -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
#Distant spike skews results, will refine around site
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2_500kb -Region 16:29900000:30400000 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2_500kb -OutPut 16_30125287_imp_R2_fin_500kb -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
#A lot cleaner, mod-low, but consistent LD across region, but can refine region down further for higher resolution
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2_100kb -Region 16:30100000:30200000 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2_100kb -OutPut 16_30125287_imp_R2_fin_100kb -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
#Distinct blocks delimited largely by black lines, overally moderate linkage, need to discern pdh1 gene region...
##From Funatsuki primers BLAST to Wm82.v4 (pdh1 genomic cloning)
F: 30166011
R: 30160726
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2_6kb -Region 16:30160726:30166011 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2_6kb -OutPut 16_30125287_imp_R2_fin_6kb -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
##Note that there's a significant block (CI approach) from start:30160889     end:30173677       12.789kb     74SNPs
LDBlockShow/bin/LDBlockShow -InVCF impu_bial_16_SNP_id_filt_all.vcf -OutPut 16_30125287_imp_R2_12kb -Region 16:30160889:30173677 -SeleVar 2 -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3 -TopSite
LDBlockShow/bin/ShowLDSVG -InPreFix 16_30125287_imp_R2_12kb -OutPut 16_30125287_imp_R2_fin_12kb -NoLogP -OutPdf -TopSite -InGWAS 16_30125287_ldbs_gwastags.txt -InGFF glyma.Wm82.gnm4.ann1.T8TQ.gene_models_main.gff3
#looking at just the block, it appears there are overlapping haplotype patterns appropriate for digging.
#####Can take this ~12kb region (done), find ORF (3'>5' Frame 1; skips first 2 SNPs, rev order)

##Found dirigent orthologs with protein sequence homology. Can use this region.

##Will use 50kb flanks from pdh1 to characterize region
