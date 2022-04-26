##e.g. Rscript tagphenos.R taglist.txt protein_INs.vcf protein_pheno985ind.txt out

library(data.table)
library(tidyverse)

args <- commandArgs(trailingOnly=TRUE)

#args <- c('taglist.txt','protein_INs.vcf','protein_pheno985ind.txt')

tag_list <- fread(args[1], header=F) %>% as_tibble() %>% pull(V1)
vcf <- fread(paste0("grep -f ",args[1]," ",args[2]), header =F) %>% as_tibble() %>% filter(V3 %in% tag_list)
colnames(vcf) <- colnames(fread("grep -m 1 '#CHROM' protein_INs.vcf"))

vcf_long <- vcf %>% gather(indiv,key,10:ncol(.))

pheno <- fread(args[3]) %>% as_tibble()


type <- tibble(type=c('ref','alt',rep('het',2),rep('het_miss',4),'miss'),
               key=c('0/0','1/1','1/0','0/1','1/.','0/.','./1','./0','./.'))


vcf_long <- vcf_long %>% 
  left_join(pheno, by=c('indiv'='V1')) %>% 
  left_join(type) 


output <- vcf_long %>% 
  group_by(POS,type,REF,ALT) %>% 
  summarize(nIND=n(),avPheno=mean(V2))

write_tsv(output,args[4])
