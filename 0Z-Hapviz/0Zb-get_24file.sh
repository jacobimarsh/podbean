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
library(scales)

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
write_tsv(removedSNPs,'${3}_pruned_Mreps.out.txt')

ts5 <- file4_filt_in %>% mutate(SNP=as.numeric(gsub('.*_','',SNP))) %>% mutate(TAGS=as.numeric(gsub('.*_','',TAGS))) 

vertranges <- ((range(ts5\$SNP)[2]-range(ts5\$SNP)[1]) / (length(unique(ts5\$SNP)))) *0.9

p <- ggplot() + 
  geom_segment(data=ts5,aes(x=TAGS,xend=TAGS,y=SNP-vertranges,yend=SNP+vertranges),size=0.2)+
  geom_point(data=ts5,aes(x=SNP,y=SNP), pch=23,fill='red',size=2)+
  geom_segment(data=ts5,aes(x=SNP,xend=SNP,y=SNP-vertranges,yend=SNP+vertranges),size=0.2, colour = 'red')+
  scale_y_reverse(breaks=c(unique(ts5\$SNP))) + #, labels=c(paste('M0',1:length(unique(ts5\$SNP)),sep='')))+
  labs(x='Position', y='Marker group') +
  theme_minimal()
  
p

ggsave('s${3}_posplot.pdf',p,device = 'pdf',units = 'cm',height = 9,width = 16)  " > get4file_${3}.R
Rscript get4file_${3}.R
