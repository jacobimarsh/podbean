conda create --name py2 python=2.7.14 numpy=1.13.3
conda activate py2
conda install scipy

plink --vcf impu_bial_16_SNP_id_filt_all.vcf --allow-extra-chr --out impu_bial_16_SNP_id_filt_all.vcf

python2 fastStructure/structure.py -K 1 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 2 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 3 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 4 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 5 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 6 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 7 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 8 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 9 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 10 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 11 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 12 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 13 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 14 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
python2 fastStructure/structure.py -K 15 --prior=simple --input=impu_bial_16_SNP_id_filt_all.vcf --output=test/testoutput_simple
