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


### multiplex
conda activate plotsr
module load samtools
minimap2 -ax asm5 -t 4 --eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
minimap2 -ax asm5 -t 4 --eqx glyso2.fa glyso3.fa | samtools sort -O BAM - > glyso2_glyso3.bam
minimap2 -ax asm5 -t 4 --eqx glyso3.fa glyma4.fa | samtools sort -O BAM - > glyso3_glyma4.bam
minimap2 -ax asm5 -t 4 --eqx glyma4.fa cajca5.fa | samtools sort -O BAM - > glyma4_cajca5.bam
minimap2 -ax asm5 -t 4 --eqx cajca5.fa phalu6.fa | samtools sort -O BAM - > cajca5_phalu6.bam
minimap2 -ax asm5 -t 4 --eqx phalu6.fa phavu7.fa | samtools sort -O BAM - > phalu6_phavu7.bam
minimap2 -ax asm5 -t 4 --eqx phavu7.fa vigan8.fa | samtools sort -O BAM - > phavu7_vigan8.bam
minimap2 -ax asm5 -t 4 --eqx vigan8.fa lupal9.fa | samtools sort -O BAM - > vigan8_lupal9.bam
minimap2 -ax asm5 -t 4 --eqx lupal9.fa lupal10.fa | samtools sort -O BAM - > lupal9_lupal10.bam
minimap2 -ax asm5 -t 4 --eqx lupal10.fa medtr11.fa | samtools sort -O BAM - > lupal10_medtr11.bam
minimap2 -ax asm5 -t 4 --eqx medtr11.fa lotja12.fa | samtools sort -O BAM - > medtr11_lotja12.bam
minimap2 -ax asm5 -t 4 --eqx lotja12.fa pissa13.fa | samtools sort -O BAM - > lotja12_pissa13.bam
minimap2 -ax asm5 -t 4 --eqx pissa13.fa vitvi14.fa | samtools sort -O BAM - > pissa13_vitvi14.bam
minimap2 -ax asm5 -t 4 --eqx vitvi14.fa vitvi15.fa | samtools sort -O BAM - > vitvi14_vitvi15.bam
minimap2 -ax asm5 -t 4 --eqx vitvi15.fa phalu16.fa | samtools sort -O BAM - > vitvi15_phalu16.bam
minimap2 -ax asm5 -t 4 --eqx phalu16.fa phavu17.fa | samtools sort -O BAM - > phalu16_phavu17.bam
minimap2 -ax asm5 -t 4 --eqx phavu17.fa vigra18.fa | samtools sort -O BAM - > phavu17_vigra18.bam
minimap2 -ax asm5 -t 4 --eqx vigra18.fa cicar19.fa | samtools sort -O BAM - > vigra18_cicar19.bam
minimap2 -ax asm5 -t 4 --eqx cicar19.fa pissa20.fa | samtools sort -O BAM - > cicar19_pissa20.bam
minimap2 -ax asm5 -t 4 --eqx pissa20.fa lupal21.fa | samtools sort -O BAM - > pissa20_lupal21.bam
minimap2 -ax asm5 -t 4 --eqx lupal21.fa vigun22.fa | samtools sort -O BAM - > lupal21_vigun22.bam
minimap2 -ax asm5 -t 4 --eqx vigun22.fa cajca23.fa | samtools sort -O BAM - > vigun22_cajca23.bam
minimap2 -ax asm5 -t 4 --eqx cajca23.fa vigra24.fa | samtools sort -O BAM - > cajca23_vigra24.bam
minimap2 -ax asm5 -t 4 --eqx vigra24.fa vigun25.fa | samtools sort -O BAM - > vigra24_vigun25.bam
minimap2 -ax asm5 -t 4 --eqx vigun25.fa phavu26.fa | samtools sort -O BAM - > vigun25_phavu26.bam
minimap2 -ax asm5 -t 4 --eqx phavu26.fa phalu27.fa | samtools sort -O BAM - > phavu26_phalu27.bam
minimap2 -ax asm5 -t 4 --eqx phalu27.fa vigan28.fa | samtools sort -O BAM - > phalu27_vigan28.bam
minimap2 -ax asm5 -t 4 --eqx vigan28.fa glyma29.fa | samtools sort -O BAM - > vigan28_glyma29.bam
minimap2 -ax asm5 -t 4 --eqx glyma29.fa glyso30.fa | samtools sort -O BAM - > glyma29_glyso30.bam
minimap2 -ax asm5 -t 4 --eqx glyso30.fa vigun31.fa | samtools sort -O BAM - > glyso30_vigun31.bam
minimap2 -ax asm5 -t 4 --eqx vigun31.fa vigan32.fa | samtools sort -O BAM - > vigun31_vigan32.bam
minimap2 -ax asm5 -t 4 --eqx vigan32.fa glyma33.fa | samtools sort -O BAM - > vigan32_glyma33.bam
minimap2 -ax asm5 -t 4 --eqx glyma33.fa lotja34.fa | samtools sort -O BAM - > glyma33_lotja34.bam
minimap2 -ax asm5 -t 4 --eqx lotja34.fa lotja35.fa | samtools sort -O BAM - > lotja34_lotja35.bam
minimap2 -ax asm5 -t 4 --eqx lotja35.fa medtr36.fa | samtools sort -O BAM - > lotja35_medtr36.bam

samtools index glyma1_glyso2.bam
samtools index glyso2_glyso3.bam
samtools index glyso3_glyma4.bam
samtools index glyma4_cajca5.bam
samtools index cajca5_phalu6.bam
samtools index phalu6_phavu7.bam
samtools index phavu7_vigan8.bam
samtools index vigan8_lupal9.bam
samtools index lupal9_lupal10.bam
samtools index lupal10_medtr11.bam
samtools index medtr11_lotja12.bam
samtools index lotja12_pissa13.bam
samtools index pissa13_vitvi14.bam
samtools index vitvi14_vitvi15.bam
samtools index vitvi15_phalu16.bam
samtools index phalu16_phavu17.bam
samtools index phavu17_vigra18.bam
samtools index vigra18_cicar19.bam
samtools index cicar19_pissa20.bam
samtools index pissa20_lupal21.bam
samtools index lupal21_vigun22.bam
samtools index vigun22_cajca23.bam
samtools index cajca23_vigra24.bam
samtools index vigra24_vigun25.bam
samtools index vigun25_phavu26.bam
samtools index phavu26_phalu27.bam
samtools index phalu27_vigan28.bam
samtools index vigan28_glyma29.bam
samtools index glyma29_glyso30.bam
samtools index glyso30_vigun31.bam
samtools index vigun31_vigan32.bam
samtools index vigan32_glyma33.bam
samtools index glyma33_lotja34.bam
samtools index lotja34_lotja35.bam
samtools index lotja35_medtr36.bam

syri/syri/bin/syri -c glyma1_glyso2.bam -r glyma1.fa -q glyso2.fa -F B --prefix glyma1_glyso2 &
syri/syri/bin/syri -c glyso2_glyso3.bam -r glyso2.fa -q glyso3.fa -F B --prefix glyso2_glyso3 &
syri/syri/bin/syri -c glyso3_glyma4.bam -r glyso3.fa -q glyma4.fa -F B --prefix glyso3_glyma4 &
syri/syri/bin/syri -c glyma4_cajca5.bam -r glyma4.fa -q cajca5.fa -F B --prefix glyma4_cajca5 &
syri/syri/bin/syri -c cajca5_phalu6.bam -r cajca5.fa -q phalu6.fa -F B --prefix cajca5_phalu6 &
syri/syri/bin/syri -c phalu6_phavu7.bam -r phalu6.fa -q phavu7.fa -F B --prefix phalu6_phavu7 &
syri/syri/bin/syri -c phavu7_vigan8.bam -r phavu7.fa -q vigan8.fa -F B --prefix phavu7_vigan8 &
syri/syri/bin/syri -c vigan8_lupal9.bam -r vigan8.fa -q lupal9.fa -F B --prefix vigan8_lupal9 &
syri/syri/bin/syri -c lupal9_lupal10.bam -r lupal9.fa -q lupal10.fa -F B --prefix lupal9_lupal10 &
syri/syri/bin/syri -c lupal10_medtr11.bam -r lupal10.fa -q medtr11.fa -F B --prefix lupal10_medtr11 &
syri/syri/bin/syri -c medtr11_lotja12.bam -r medtr11.fa -q lotja12.fa -F B --prefix medtr11_lotja12 &
syri/syri/bin/syri -c lotja12_pissa13.bam -r lotja12.fa -q pissa13.fa -F B --prefix lotja12_pissa13 &
syri/syri/bin/syri -c pissa13_vitvi14.bam -r pissa13.fa -q vitvi14.fa -F B --prefix pissa13_vitvi14 &
syri/syri/bin/syri -c vitvi14_vitvi15.bam -r vitvi14.fa -q vitvi15.fa -F B --prefix vitvi14_vitvi15 &
syri/syri/bin/syri -c vitvi15_phalu16.bam -r vitvi15.fa -q phalu16.fa -F B --prefix vitvi15_phalu16 &
syri/syri/bin/syri -c phalu16_phavu17.bam -r phalu16.fa -q phavu17.fa -F B --prefix phalu16_phavu17 &
syri/syri/bin/syri -c phavu17_vigra18.bam -r phavu17.fa -q vigra18.fa -F B --prefix phavu17_vigra18 &
syri/syri/bin/syri -c vigra18_cicar19.bam -r vigra18.fa -q cicar19.fa -F B --prefix vigra18_cicar19 &
syri/syri/bin/syri -c cicar19_pissa20.bam -r cicar19.fa -q pissa20.fa -F B --prefix cicar19_pissa20 &
syri/syri/bin/syri -c pissa20_lupal21.bam -r pissa20.fa -q lupal21.fa -F B --prefix pissa20_lupal21 &
syri/syri/bin/syri -c lupal21_vigun22.bam -r lupal21.fa -q vigun22.fa -F B --prefix lupal21_vigun22 &
syri/syri/bin/syri -c vigun22_cajca23.bam -r vigun22.fa -q cajca23.fa -F B --prefix vigun22_cajca23 &
syri/syri/bin/syri -c cajca23_vigra24.bam -r cajca23.fa -q vigra24.fa -F B --prefix cajca23_vigra24 &
syri/syri/bin/syri -c vigra24_vigun25.bam -r vigra24.fa -q vigun25.fa -F B --prefix vigra24_vigun25 &
syri/syri/bin/syri -c vigun25_phavu26.bam -r vigun25.fa -q phavu26.fa -F B --prefix vigun25_phavu26 &
syri/syri/bin/syri -c phavu26_phalu27.bam -r phavu26.fa -q phalu27.fa -F B --prefix phavu26_phalu27 &
syri/syri/bin/syri -c phalu27_vigan28.bam -r phalu27.fa -q vigan28.fa -F B --prefix phalu27_vigan28 &
syri/syri/bin/syri -c vigan28_glyma29.bam -r vigan28.fa -q glyma29.fa -F B --prefix vigan28_glyma29 &
syri/syri/bin/syri -c glyma29_glyso30.bam -r glyma29.fa -q glyso30.fa -F B --prefix glyma29_glyso30 &
syri/syri/bin/syri -c glyso30_vigun31.bam -r glyso30.fa -q vigun31.fa -F B --prefix glyso30_vigun31 &
syri/syri/bin/syri -c vigun31_vigan32.bam -r vigun31.fa -q vigan32.fa -F B --prefix vigun31_vigan32 &
syri/syri/bin/syri -c vigan32_glyma33.bam -r vigan32.fa -q glyma33.fa -F B --prefix vigan32_glyma33 &
syri/syri/bin/syri -c glyma33_lotja34.bam -r glyma33.fa -q lotja34.fa -F B --prefix glyma33_lotja34 &
syri/syri/bin/syri -c lotja34_lotja35.bam -r lotja34.fa -q lotja35.fa -F B --prefix lotja34_lotja35 &
syri/syri/bin/syri -c lotja35_medtr36.bam -r lotja35.fa -q medtr36.fa -F B --prefix lotja35_medtr36 &

glyma1_glyso2.bam
glyso2_glyso3.bam
glyso3_glyma4.bam
glyma4_cajca5.bam
cajca5_phalu6.bam
phalu6_phavu7.bam
phavu7_vigan8.bam
vigan8_lupal9.bam
lupal9_lupal10.bam
lupal10_medtr11.bam
medtr11_lotja12.bam
lotja12_pissa13.bam
pissa13_vitvi14.bam
vitvi14_vitvi15.bam
vitvi15_phalu16.bam
phalu16_phavu17.bam
phavu17_vigra18.bam
vigra18_cicar19.bam
cicar19_pissa20.bam
pissa20_lupal21.bam
lupal21_vigun22.bam
vigun22_cajca23.bam
cajca23_vigra24.bam
vigra24_vigun25.bam
vigun25_phavu26.bam
phavu26_phalu27.bam
phalu27_vigan28.bam
vigan28_glyma29.bam
glyma29_glyso30.bam
glyso30_vigun31.bam
vigun31_vigan32.bam
vigan32_glyma33.bam
glyma33_lotja34.bam
lotja34_lotja35.bam
lotja35_medtr36.bam





glyma4
cajca5
phalu6
phavu7
vigan8
lupal9
lupal10
medtr11
lotja12
pissa13
vitvi14
vitvi15
phalu16
phavu17
vigra18
cicar19
pissa20
lupal21
vigun22
cajca23
vigra24
vigun25
phavu26
phalu27
vigan28
glyma29
glyso30
vigun31
vigan32
glyma33
lotja34
lotja35


