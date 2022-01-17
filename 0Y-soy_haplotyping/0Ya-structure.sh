conda create --name py2 python=2.7.14 numpy=1.13.3
conda activate py2
conda install scipy

python /group/pawsey0149/jmarsh1/packages/fastStructure/structure.py -K 4 --input=impu_bial_all_SNP_id_filt.vcf

#need to fix python in path...
