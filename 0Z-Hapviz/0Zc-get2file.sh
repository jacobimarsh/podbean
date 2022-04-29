#!/bin/bash
HMP=${1?Error: no hapmap file provided}
PREFIX=${2?Error: no prefix provided}

echo -e "library(data.table)
library(tidyverse)

hmp <- fread('${1}') %>% separate(alleles, c('ref','alt'))

file2 <- hmp %>%
  gather(haplotype,alleles,13:ncol(.)) %>%
  filter(alleles == paste(alt,alt,sep = '')) %>%
  select(haplotype,pos)

write_tsv(file2,'${2}_2file.txt')" > get2file_${2}.R

Rscript get2file_${2}.R


#a lot of porting + plink tags


library(tidyverse)
library(data.table)

rawpfile <- fread('C:/Users/21485753/Desktop/pod/tagphenosbox/plink.tags.list') %>% 
  as_tibble() %>% 
  arrange(-NTAG) %>% 
  mutate(grp='')


for(snp in unique(rawpfile$SNP)){
  rawpfile <- rawpfile %>% 
    mutate(grp=ifelse(grp == '' & SNP==snp,snp,grp))
  rawpfile <- rawpfile %>% 
    mutate(grp=ifelse(grp == '' & str_detect(TAGS,snp),snp,grp))
  }


keptSNPs <- rawpfile %>% 
  filter(SNP==grp)

file4_filt_in <- keptSNPs %>% separate_rows(TAGS, sep='\\|') %>% select(SNP,TAGS)

removedSNPs <- rawpfile %>% 
  filter(SNP!=grp)

write_tsv(keptSNPs,'kept_SNPtags.txt')
write_tsv(file4_filt, 'file4_filt_in.txt')
write_tsv(removedSNPs,'removed_Mreps.txt')

#write_tsv(select(keptSNPs, TAGS),'kept_SNPtags.txt', col_names= F)
#write_tsv(select(removedSNPs, SNP, grp),'removed_Mreps.txt')
#keptSNPs %>% separate_rows(TAGS, sep='\\|')
