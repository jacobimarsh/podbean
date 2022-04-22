#with late shatter scores
##nohet_fin_impu_bial_16_SNP_id_filt_all.hmp.txt
##nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt
#undefined groups PI366122
#undefined groups USB.055
#undefined groups USB.350
#undefined groups USB027

#mv HMGm16_301_302_C0.6_CT0.6_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.6.o
#mv HMGm16_301_302_C0.5_CT0.5_MIT0.9.o	HMGm16_301_302_MIT0.9_CT0.5.o
#mv HMGm16_301_302_C0.5_CT0.5_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.5.o
#mv HMGm16_301_302_C0.8_CT0.8_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.8.o
#mv HMGm16_301_302_C0.7_CT0.7_MIT0.9.o	HMGm16_301_302_MIT0.9_CT0.7.o
#mv HMGm16_301_302_C0.7_CT0.7_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.7.o
#mv HMGm16_301_302_C0.6_CT0.9_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.9.o
#mv HMGm16_301_302_C0.6_CT0.6_MIT0.9.o	HMGm16_301_302_MIT0.9_CT0.6.o
#mv HMGm16_301_302_indep_CT0.7_MIT0.9.o	HMGm16_301_302_indep_MIT0.9_CT0.7.o
#mv HMGm16_301_302_indep_CT0.7_MIT0.8.o	HMGm16_301_302_indep_MIT0.8_CT0.7.o
#mv HMGm16_301_302_indep_CT0.6_MIT0.9.o	HMGm16_301_302_indep_MIT0.9_CT0.6.o
#mv HMGm16_301_302_indep_CT0.6_MIT0.8.o	HMGm16_301_302_indep_MIT0.8_CT0.6.o
#mv HMGm16_301_302_indep_CT0.5_MIT0.9.o	HMGm16_301_302_indep_MIT0.9_CT0.5.o
#mv HMGm16_301_302_indep_CT0.5_MIT0.8.o	HMGm16_301_302_indep_MIT0.8_CT0.5.o
#mv HMGm16_301_302_C0.9_CT0.9_MIT0.9.o	HMGm16_301_302_MIT0.9_CT0.9.o
#mv HMGm16_301_302_C0.9_CT0.9_MIT0.8.o	HMGm16_301_302_MIT0.8_CT0.9.o
#mv HMGm16_301_302_C0.8_CT0.8_MIT0.9.o	HMGm16_301_302_MIT0.9_CT0.8.o
#mv HMGm16_301_302_indep_CT0.9_MIT0.9.o	HMGm16_301_302_indep_MIT0.9_CT0.9.o
#mv HMGm16_301_302_indep_CT0.9_MIT0.8.o	HMGm16_301_302_indep_MIT0.8_CT0.9.o
#mv HMGm16_301_302_indep_CT0.8_MIT0.9.o	HMGm16_301_302_indep_MIT0.9_CT0.8.o
#mv HMGm16_301_302_indep_CT0.8_MIT0.8.o	HMGm16_301_302_indep_MIT0.8_CT0.8.o
#
#run_CT_clustree.sh HMGm16_301_302_indep_MIT0.8 late_shatter.txt
#run_CT_clustree.sh HMGm16_301_302_MIT0.9 late_shatter.txt
#run_CT_clustree.sh HMGm16_301_302_MIT0.8 late_shatter.txt

#!/bin/bash
PREFIX=${1?Error: no prefix provided}
PHENO=${2?Error: no pheno provided}

echo -e "ID\tHap\tCT" > ${1}_allCT.haps
for i in {5..9}
do
grep -A 10000 'Haplotypes$Assignment' ${1}_CT0.${i}.o | tail -n +3 | awk '{print $2,$3}' | head -n -2 | sed 's/ /\t/' > ${1}_CT0.${i}.haps
sed "s/$/\tCT0.${i}/" ${1}_CT0.${i}.haps >> ${1}_allCT.haps
done

echo -e "library(clustree)
library(tidyverse)
id_haps <- read.csv('${1}_allCT.haps', sep = '\\t', stringsAsFactors = FALSE)
wide_IH <- spread(id_haps, 'CT', 'Hap') %>% as_tibble()
#nona_WIH <- wide_IH %>% replace(is.na(.), 'Z')
pheno <- read.csv('${2}', sep = '\\t')
ph_NWIH <- left_join(wide_IH,
                     pheno,
                     by='ID')
mean_na.rm <- function(x){mean(x,na.rm=T)}
phencol <- clustree(ph_NWIH,
                    prefix = 'CT',
                    node_colour = 'Pheno',
                    node_colour_aggr = 'mean_na.rm',
                    edge_width = 1,
                    node_alpha = 0.9
                    ) +
  scale_colour_viridis_c(limits=c(max(top_frac(ph_NWIH,-0.1,Pheno)\$Pheno),
                                 min(top_frac(ph_NWIH,0.1,Pheno)\$Pheno)),
                        oob = scales::squish,
                        begin = 0.25,
                        direction = -1,
                        name = 'Pheno') +
  scale_edge_color_continuous(high = 'black',
                              low = 'grey80') +
  labs(edge_colour = 'nIndividuals',
       size = 'nIndividuals') +
  guides(edge_alpha = FALSE)


ggsave('clustree_${2}_${1}.pdf',
       phencol,
       device = 'pdf',
       dpi = 300,
       height = 9,
       width = 16,
       units = 'in')" > clustree_${2}_${1}.R
Rscript clustree_${2}_${1}.R
