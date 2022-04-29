#!/bin/bash
HMP=${1?Error: no hapmap file provided for haplotype combinations}
VCF=${2?Error: no vcf file provided for chromosome}
PREFIX=${3?Error: no prefix provided}

conda activate r3.6

echo -e "library(data.table)
library(tidyverse)

hmp <- fread('${1}') %>% separate(alleles, c('ref','alt'))

file2 <- hmp %>%
  gather(haplotype,alleles,13:ncol(.)) %>%
  filter(alleles == paste(alt,alt,sep = '')) %>%
  select(haplotype,pos)

write_tsv(file2,'${3}_2file.txt')" > get2file_${3}.R

Rscript get2file_${3}.R

#### 4file
awk '{print $1}' ${1} | tail -n +2 > ${3}_Mreps_sites.txt
sed -i 's/Gm//' ${3}_Mreps_sites.txt
##need to make sure the SNP IDs have the same naming convention (e.g. Gm16_... vs 16_...)
/group/pawsey0149/jmarsh1/packages/PLINK/plink --vcf ${2} --show-tags ${3}_Mreps_sites.txt --tag-r2 0.9 --list-all --out ${3}_prepruned

echo -e "library(tidyverse)
library(data.table)

rawpfile <- fread('${3}_prepruned.tags.list') %>% 
  as_tibble() %>% 
  arrange(-NTAG) %>% 
  mutate(grp='')


for(snp in unique(rawpfile\$SNP)){
  rawpfile <- rawpfile %>% 
    mutate(grp=ifelse(grp == '' & SNP==snp,snp,grp))
  rawpfile <- rawpfile %>% 
    mutate(grp=ifelse(grp == '' & str_detect(TAGS,snp),snp,grp))
  }


keptSNPs <- rawpfile %>% 
  filter(SNP==grp)

file4_filt_in <- keptSNPs %>% separate_rows(TAGS, sep='\\\\\|') %>% select(SNP,TAGS)

uniqSNP <- c(file4_filt_in\$SNP) %>% unique() 
taglist <- rbind(c(file4_filt_in\$TAGS) %>% as.matrix(), as.matrix(uniqSNP)) %>% as.tibble()

removedSNPs <- rawpfile %>% 
  filter(SNP!=grp)

write_tsv(keptSNPs,'${3}_pruned_Mreps.in.txt')
write_tsv(file4_filt_in, '${3}_4file.txt')
write_tsv(taglist, '${3}_taglist.txt', col_names= F)
write_tsv(removedSNPs,'${3}_pruned_Mreps.out.txt')" > get4file_${3}.R
Rscript get4file_${3}.R
