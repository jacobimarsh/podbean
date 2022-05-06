##Rscript tagphenos.R HMGm16_301_302_C0.6_MIT0.8 ../glyma/snp_calling/16_SNP_id_filt_all.vcf ../clustreebox/late_shatter.txt
##e.g. Rscript tagphenos.R PREFIX foo.vcf pheno.txt

library(data.table)
library(tidyverse)

args <- commandArgs(trailingOnly=TRUE)

tag_list <- fread(paste0(args[1],"_taglist.txt"), header=F) %>% as_tibble() %>% pull(V1)
vcf <- fread(paste0("grep -f ",args[1],"_taglist.txt ",args[2]), header =F) %>% as_tibble() %>% filter(V3 %in% tag_list)
colnames(vcf) <- colnames(fread(paste0("grep -m 1 '#CHROM'"," ",args[2])))

vcf_long <- vcf %>% gather(indiv,key,10:ncol(.))

pheno <- fread(args[3]) %>% as_tibble()


type <- tibble(type=c('ref','alt',rep('het',2),rep('het_miss',4),'miss'),
               key=c('0/0','1/1','1/0','0/1','1/.','0/.','./1','./0','./.'))


vcf_long <- vcf_long %>% 
  left_join(pheno, by=c('indiv'='ID')) %>% 
  left_join(type) 


output <- vcf_long %>% 
  group_by(POS,type,REF,ALT) %>% 
  summarize(nIND=n(),avPheno=mean(V2, na.rm = T))

write_tsv(output,paste0(args[1],"_tags_phenosum_file3.txt"))
