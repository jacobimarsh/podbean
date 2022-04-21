#with late shatter scores
nohet_fin_impu_bial_16_SNP_id_filt_all.hmp.txt
nohet_prefin_impu_bial_16_SNP_id_filt_all.hmp.txt
#undefined groups PI366122
#undefined groups USB.055
#undefined groups USB.350
#undefined groups USB027



for i in {1..9}; do grep -A 10000 'Haplotypes$Assignment' HMGm16_301_302_indep_CT0.${i}_MIT0.8.o | tail -n +3 | awk '{print $2,$3}' | head -n -2 | sed 's/ /\t/' > HMGm16_301_302_indep_CT0.${i}_MIT0.8.haps; done 
#for i in {1..9}; do sed "s/$/\tCT0.${i}/" HMGm16_301_302_indep_CT0.${i}_MIT0.8.haps >> HMGm16_301_302_indep_ALLCT_MIT0.8.haps; done

########

run_CT_clustree.sh -prefix HMGm16_301_302_indep_MIT0.8 -thresholds 5 9 1 -pheno pheno.txt

echo -e "library(clustree)
library(tidyverse)

id_haps <- read.csv('C:/Users/21485753/Desktop/pod/clustreebox/HMGm16_301_302_indep_ALLCT_MIT0.8.haps', sep = '\t')
wide_IH <- spread(id_haps, 'CT', 'Hap') %>% as_tibble()
#nona_WIH <- wide_IH %>% replace(is.na(.), 'Z')
pheno <- read.csv('C:/Users/21485753/Desktop/pod/clustreebox/late_shatter.txt', sep = '\t')

ph_NWIH <- left_join(wide_IH,
                     pheno,
                     by="ID")

mean_na.rm <- function(x){mean(x,na.rm=T)}


phencol <- clustree(ph_NWIH, 
                    prefix = 'CT', 
                    node_colour = 'Pheno', 
                    node_colour_aggr = 'mean_na.rm', 
                    edge_width = 1, 
                    node_alpha = 0.9
                    ) + 
  scale_colour_viridis_c(limits=c(max(top_frac(ph_NWIH,-0.1,Pheno)$Pheno),
                                 min(top_frac(ph_NWIH,0.1,Pheno)$Pheno)),
                        oob = scales::squish, 
                        begin = 0.25, 
                        direction = -1, 
                        name = 'Pheno') +
  scale_edge_color_continuous(high = 'black', 
                              low = 'grey80') +
  labs(edge_colour = 'nIndividuals', 
       size = 'nIndividuals') +
  guides(edge_alpha = FALSE)
  

  
ggsave('clustree_${1}_${2}_${3}.pdf',
       phencol, 
       device = 'pdf', 
       dpi = 300,
       height = 9,
       width = 16,
       units = 'in')" > clustree_${1}_${2}_${3}.R
Rscript clustree_${1}_${2}_${3}.R
