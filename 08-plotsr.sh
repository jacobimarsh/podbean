#conda create --name plotsr
conda activate plotsr
#conda install -c bioconda plotsr
#conda install -c bioconda 'minimap2>=2.7'
#conda install python=3.8
#conda install biopython
#conda install psutil
#conda install -c conda-forge python-igraph
#git clone https://github.com/schneebergerlab/syri.git
#cd syri
#unset PYTHONPATH
#python setup.py install
#chmod +x syri/bin/syri

####RECODED TEST
#scp glyma1.fa TAIR10.filtered.fa
#scp glyso2.fa ler.filtered.fa
#minimap2 -ax asm5 -t 4 --eqx TAIR10.filtered.fa ler.filtered.fa | samtools sort -O BAM - > col_ler.bam
#samtools index col_ler.bam
#syri/syri/bin/syri  -c col_ler.bam -r TAIR10.filtered.fa -q ler.filtered.fa -F B --prefix col_ler &
###in genomes.txt
###file	name	tags
##TAIR10.filetered.fa	col-0	lw:1.5
##ler.filtered.fa	ler	lw:1.5
#plotsr --sr col_lersyri.out --genomes genomes.txt -o out.png
####

conda activate plotsr
minimap2 -ax asm5 -t 4 --eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
samtools index glyma1_glyso2.bam
syri/syri/bin/syri  -c glyma1_glyso2.bam -r glyma1.fa -q glyso2.fa -F B --prefix glyma1_glyso2 &
echo -e "#file\tname\ttags\nglyma1.fa\tglyma1\tlw:1.5\nglyso2.fa\tglyso2\tlw:1.5" > glyma1_glyso2_genomes.txt
plotsr --sr glyma1_glyso2syri.out --genomes glyma1_glyso2_genomes.txt -o glyma1_glyso2.png



minimap2 -ax asm5 -t 4 -eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
samtools index glyma1_glyso2.bam
minimap2 -ax asm5 -t 4 -eqx glyso2.fa glyma1.fa | samtools sort -O BAM - > glyso2_glyma1.bam
samtools index glyso2_glyma1.bam
conda install -c bioconda pysam
