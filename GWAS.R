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
    
