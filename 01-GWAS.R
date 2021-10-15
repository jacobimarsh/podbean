## Repeated for all 4 conditions (imp/nonim + early/late)
#conda activate r-env
#Rscript impu_late.R

library(rMVP)

MVP.Data(fileVCF="impu_bial_all_SNP_id_filt.vcf",
         filePhe="late_shatter.txt",
         fileKin=FALSE,
         filePC=FALSE,
         out="ilmvp"
         )


genotype <- attach.big.matrix("ilmvp.geno.desc")
phenotype <- read.table("ilmvp.phe",head=TRUE)
map <- read.table("ilmvp.geno.map" , head = TRUE)



ilMVP <- MVP(
    phe=phenotype,
    geno=genotype,
    map=map,
    #K=Kinship,
    #CV.GLM=Covariates,     ##if you have additional covariates, please keep there open.
    #CV.MLM=Covariates,
    #CV.FarmCPU=Covariates,
    nPC.GLM=5,      ##if you have added PC into covariates, please keep there closed.
    nPC.MLM=3,
    nPC.FarmCPU=3,
    priority="speed",       ##for Kinship construction
    #ncpus=10,
    vc.method="BRENT",      ##only works for MLM
    maxLoop=10,
    method.bin="static",      ## "FaST-LMM", "static" (#only works for FarmCPU)
    #permutation.threshold=TRUE,
    #permutation.rep=100,
    threshold=0.05,
    method=c("GLM", "MLM", "FarmCPU"),
    out="imp_late"
)
    
#impu_late gives best result, highly significant for chr16 
#16_30125287	16	30125287	G	A	0.401123216	0.037863702	1.88E-26

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
