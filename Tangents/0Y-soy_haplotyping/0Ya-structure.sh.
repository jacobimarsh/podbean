conda create --name py2 python=2.7.14 numpy=1.13.3
conda activate py2
conda install scipy

plink --vcf impu_bial_16_SNP_id_filt_all.vcf --allow-extra-chr --out impu_bial_16_SNP_id_filt_all.vcf

conda activate py2

python2 fastStructure/structure.py -K 1 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 2 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 3 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 4 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 5 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 6 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 7 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 8 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 9 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 10 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 11 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 12 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 13 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 14 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple
python2 fastStructure/structure.py -K 15 --prior=simple --input=haploupe/impu_bial_16_SNP_id_filt_all.vcf --output=haploupe/test/testoutput_simple

for i in {1..15}
do python2 fastStructure/distructnew.py -K ${i} --input=testoutput_simple --output=test${i}_distruct.svg 
done

#REFORMAT FOR K=10

grep '#CHROM' ../impu_bial_16_SNP_id_filt_all.vcf >> temppopfile.txt
sed -i 's/^.*FORMAT\t//' temppopfile.txt
sed -i 's/\t/\n/g' temppopfile.txt
echo -e '\tp1\tp2\tp3\tp4\tp5\tp6\tp7\tp8\tp9\tp10' >> impu_bial_16_SNP_id_filt_all.vcf.10.meanQ_HMformatted.txt
paste temppopfile.txt testoutput_simple.10.meanQ >> temp_impu_bial_16_SNP_id_filt_all.vcf.10.meanQ_HMformatted.txt
cat temp_impu_bial_16_SNP_id_filt_all.vcf.10.meanQ_HMformatted.txt >> impu_bial_16_SNP_id_filt_all.vcf.10.meanQ_HMformatted.txt
rm a
rm temppopfile.txt
