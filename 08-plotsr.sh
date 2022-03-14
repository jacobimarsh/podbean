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

#test
#conda activate plotsr
#minimap2 -ax asm5 -t 4 --eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
#samtools index glyma1_glyso2.bam
#syri/syri/bin/syri  -c glyma1_glyso2.bam -r glyma1.fa -q glyso2.fa -F B --prefix glyma1_glyso2 &
#echo -e "#file\tname\ttags\nglyma1.fa\tglyma1\tlw:1.5\nglyso2.fa\tglyso2\tlw:1.5" > glyma1_glyso2_genomes.txt
#plotsr --sr glyma1_glyso2syri.out --genomes glyma1_glyso2_genomes.txt -o glyma1_glyso2.png

### multiplex from here
conda activate plotsr
module load samtools
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyso2.fa glyso3.fa | samtools sort -O BAM - > glyso2_glyso3.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyso3.fa glyma4.fa | samtools sort -O BAM - > glyso3_glyma4.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyma4.fa cajca5.fa | samtools sort -O BAM - > glyma4_cajca5.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx cajca5.fa phalu6.fa | samtools sort -O BAM - > cajca5_phalu6.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phalu6.fa phavu7.fa | samtools sort -O BAM - > phalu6_phavu7.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phavu7.fa vigan8.fa | samtools sort -O BAM - > phavu7_vigan8.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigan8.fa lupal9.fa | samtools sort -O BAM - > vigan8_lupal9.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lupal9.fa lupal10.fa | samtools sort -O BAM - > lupal9_lupal10.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lupal10.fa medtr11.fa | samtools sort -O BAM - > lupal10_medtr11.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx medtr11.fa lotja12.fa | samtools sort -O BAM - > medtr11_lotja12.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lotja12.fa pissa13.fa | samtools sort -O BAM - > lotja12_pissa13.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx pissa13.fa vitvi14.fa | samtools sort -O BAM - > pissa13_vitvi14.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vitvi14.fa vitvi15.fa | samtools sort -O BAM - > vitvi14_vitvi15.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vitvi15.fa phalu16.fa | samtools sort -O BAM - > vitvi15_phalu16.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phalu16.fa phavu17.fa | samtools sort -O BAM - > phalu16_phavu17.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phavu17.fa vigra18.fa | samtools sort -O BAM - > phavu17_vigra18.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigra18.fa cicar19.fa | samtools sort -O BAM - > vigra18_cicar19.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx cicar19.fa pissa20.fa | samtools sort -O BAM - > cicar19_pissa20.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx pissa20.fa lupal21.fa | samtools sort -O BAM - > pissa20_lupal21.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lupal21.fa vigun22.fa | samtools sort -O BAM - > lupal21_vigun22.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigun22.fa cajca23.fa | samtools sort -O BAM - > vigun22_cajca23.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx cajca23.fa vigra24.fa | samtools sort -O BAM - > cajca23_vigra24.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigra24.fa vigun25.fa | samtools sort -O BAM - > vigra24_vigun25.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigun25.fa phavu26.fa | samtools sort -O BAM - > vigun25_phavu26.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phavu26.fa phalu27.fa | samtools sort -O BAM - > phavu26_phalu27.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx phalu27.fa vigan28.fa | samtools sort -O BAM - > phalu27_vigan28.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigan28.fa glyma29.fa | samtools sort -O BAM - > vigan28_glyma29.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyma29.fa glyso30.fa | samtools sort -O BAM - > glyma29_glyso30.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyso30.fa vigun31.fa | samtools sort -O BAM - > glyso30_vigun31.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigun31.fa vigan32.fa | samtools sort -O BAM - > vigun31_vigan32.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx vigan32.fa glyma33.fa | samtools sort -O BAM - > vigan32_glyma33.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx glyma33.fa lotja34.fa | samtools sort -O BAM - > glyma33_lotja34.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lotja34.fa lotja35.fa | samtools sort -O BAM - > lotja34_lotja35.bam
minimap2 -a -k19 -w10 -U50,500 --rmq=yes -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 --eqx lotja35.fa medtr36.fa | samtools sort -O BAM - > lotja35_medtr36.bam

#fix splice 
#samtools view -h -o out.sam vigun25_phavu26.bam
#awk '{gsub("N","D",$6)}1' out.sam > out2.sam
#samtools view -S -b out2.sam > sample.bam

#try asm33
#minimap2 -k19 -w10 -U50,500 --rmq -r100k -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 -t 4 --eqx vigun25.fa phavu26.fa | samtools sort -O BAM - > vigun25_phavu26.bam
#samtools index vigun25_phavu26.bam
#syri/syri/bin/syri -c vigun25_phavu26.bam -r vigun25.fa -q phavu26.fa -F B --prefix vigun25_phavu26 &
#
#
#minimap2 -k19 -w10 -U50,500 --rmq -r100k -g10k -A1 -B3 -O4,24 -E2,1 -s200 -z200 -N50 -t 4 --eqx phalu16.fa phavu17.fa | samtools sort -O BAM - > phalu16_phavu17.bam
#
#minimap2 -ax asm20 -t 4 --eqx phalu16.fa phavu17.fa | samtools sort -O BAM - > phalu16_phavu17.bam
#samtools index phalu16_phavu17.bam
#syri/syri/bin/syri -c phalu16_phavu17.bam -r phalu16.fa -q phavu17.fa -F B --prefix phalu16_phavu17 &
#

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


syri/syri/bin/syri -c Vu3_Chr02.bam -r Vu3.fa -q Chr02.fa -F B --prefix Vu3_Chr02 &
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

##Following lines successfully mapped with asm5
#vitvi14_vitvi15syri.out
#vigun31_vigan32syri.out
#vigra24_vigun25syri.out
#phavu7_vigan8syri.out
#phavu26_phalu27syri.out
#phavu17_vigra18syri.out
#phalu6_phavu7syri.out
#phalu27_vigan28syri.out
#phalu16_phavu17syri.out
#lupal9_lupal10syri.out
#glyso3_glyma4syri.out
#glyso2_glyso3syri.out
#glyma29_glyso30syri.out
#glyma1_glyso2syri.out

echo -e "#file\tname\ttags\nglyma1.fa\tglyma1\tlw:1.5\nglyso2.fa\tglyso2\tlw:1.5" > glyma1_glyso2_genomes.txt
echo -e "#file\tname\ttags\nglyso2.fa\tglyso2\tlw:1.5\nglyso3.fa\tglyso3\tlw:1.5" > glyso2_glyso3_genomes.txt
echo -e "#file\tname\ttags\nglyso3.fa\tglyso3\tlw:1.5\nglyma4.fa\tglyma4\tlw:1.5" > glyso3_glyma4_genomes.txt
echo -e "#file\tname\ttags\nglyma4.fa\tglyma4\tlw:1.5\ncajca5.fa\tcajca5\tlw:1.5" > glyma4_cajca5_genomes.txt
echo -e "#file\tname\ttags\ncajca5.fa\tcajca5\tlw:1.5\nphalu6.fa\tphalu6\tlw:1.5" > cajca5_phalu6_genomes.txt
echo -e "#file\tname\ttags\nphalu6.fa\tphalu6\tlw:1.5\nphavu7.fa\tphavu7\tlw:1.5" > phalu6_phavu7_genomes.txt
echo -e "#file\tname\ttags\nphavu7.fa\tphavu7\tlw:1.5\nvigan8.fa\tvigan8\tlw:1.5" > phavu7_vigan8_genomes.txt
echo -e "#file\tname\ttags\nvigan8.fa\tvigan8\tlw:1.5\nlupal9.fa\tlupal9\tlw:1.5" > vigan8_lupal9_genomes.txt
echo -e "#file\tname\ttags\nlupal9.fa\tlupal9\tlw:1.5\nlupal10.fa\tlupal10\tlw:1.5" > lupal9_lupal10_genomes.txt
echo -e "#file\tname\ttags\nlupal10.fa\tlupal10\tlw:1.5\nmedtr11.fa\tmedtr11\tlw:1.5" > lupal10_medtr11_genomes.txt
echo -e "#file\tname\ttags\nmedtr11.fa\tmedtr11\tlw:1.5\nlotja12.fa\tlotja12\tlw:1.5" > medtr11_lotja12_genomes.txt
echo -e "#file\tname\ttags\nlotja12.fa\tlotja12\tlw:1.5\npissa13.fa\tpissa13\tlw:1.5" > lotja12_pissa13_genomes.txt
echo -e "#file\tname\ttags\npissa13.fa\tpissa13\tlw:1.5\nvitvi14.fa\tvitvi14\tlw:1.5" > pissa13_vitvi14_genomes.txt
echo -e "#file\tname\ttags\nvitvi14.fa\tvitvi14\tlw:1.5\nvitvi15.fa\tvitvi15\tlw:1.5" > vitvi14_vitvi15_genomes.txt
echo -e "#file\tname\ttags\nvitvi15.fa\tvitvi15\tlw:1.5\nphalu16.fa\tphalu16\tlw:1.5" > vitvi15_phalu16_genomes.txt
echo -e "#file\tname\ttags\nphalu16.fa\tphalu16\tlw:1.5\nphavu17.fa\tphavu17\tlw:1.5" > phalu16_phavu17_genomes.txt
echo -e "#file\tname\ttags\nphavu17.fa\tphavu17\tlw:1.5\nvigra18.fa\tvigra18\tlw:1.5" > phavu17_vigra18_genomes.txt
echo -e "#file\tname\ttags\nvigra18.fa\tvigra18\tlw:1.5\ncicar19.fa\tcicar19\tlw:1.5" > vigra18_cicar19_genomes.txt
echo -e "#file\tname\ttags\ncicar19.fa\tcicar19\tlw:1.5\npissa20.fa\tpissa20\tlw:1.5" > cicar19_pissa20_genomes.txt
echo -e "#file\tname\ttags\npissa20.fa\tpissa20\tlw:1.5\nlupal21.fa\tlupal21\tlw:1.5" > pissa20_lupal21_genomes.txt
echo -e "#file\tname\ttags\nlupal21.fa\tlupal21\tlw:1.5\nvigun22.fa\tvigun22\tlw:1.5" > lupal21_vigun22_genomes.txt
echo -e "#file\tname\ttags\nvigun22.fa\tvigun22\tlw:1.5\ncajca23.fa\tcajca23\tlw:1.5" > vigun22_cajca23_genomes.txt
echo -e "#file\tname\ttags\ncajca23.fa\tcajca23\tlw:1.5\nvigra24.fa\tvigra24\tlw:1.5" > cajca23_vigra24_genomes.txt
echo -e "#file\tname\ttags\nvigra24.fa\tvigra24\tlw:1.5\nvigun25.fa\tvigun25\tlw:1.5" > vigra24_vigun25_genomes.txt
echo -e "#file\tname\ttags\nvigun25.fa\tvigun25\tlw:1.5\nphavu26.fa\tphavu26\tlw:1.5" > vigun25_phavu26_genomes.txt
echo -e "#file\tname\ttags\nphavu26.fa\tphavu26\tlw:1.5\nphalu27.fa\tphalu27\tlw:1.5" > phavu26_phalu27_genomes.txt
echo -e "#file\tname\ttags\nphalu27.fa\tphalu27\tlw:1.5\nvigan28.fa\tvigan28\tlw:1.5" > phalu27_vigan28_genomes.txt
echo -e "#file\tname\ttags\nvigan28.fa\tvigan28\tlw:1.5\nglyso30.fa\tglyso30\tlw:1.5" > vigan28_glyso30_genomes.txt
echo -e "#file\tname\ttags\nglyma29.fa\tglyma29\tlw:1.5\nglyso30.fa\tglyso30\tlw:1.5" > glyma29_glyso30_genomes.txt
echo -e "#file\tname\ttags\nglyso30.fa\tglyso30\tlw:1.5\nvigan32.fa\tvigan32\tlw:1.5" > glyso30_vigan32_genomes.txt
echo -e "#file\tname\ttags\nvigun31.fa\tvigun31\tlw:1.5\nvigan32.fa\tvigan32\tlw:1.5" > vigun31_vigan32_genomes.txt
echo -e "#file\tname\ttags\nvigan32.fa\tvigan32\tlw:1.5\nglyma33.fa\tglyma33\tlw:1.5" > vigan32_glyma33_genomes.txt
echo -e "#file\tname\ttags\nglyma33.fa\tglyma33\tlw:1.5\nlotja34.fa\tlotja34\tlw:1.5" > glyma33_lotja34_genomes.txt
echo -e "#file\tname\ttags\nlotja34.fa\tlotja34\tlw:1.5\nlotja35.fa\tlotja35\tlw:1.5" > lotja34_lotja35_genomes.txt
echo -e "#file\tname\ttags\nlotja35.fa\tlotja35\tlw:1.5\nmedtr36.fa\tmedtr36\tlw:1.5" > lotja35_medtr36_genomes.txt

plotsr --sr glyma1_glyso2syri.out --genomes glyma1_glyso2_genomes.txt -o glyma1_glyso2.png
plotsr --sr glyso2_glyso3syri.out --genomes glyso2_glyso3_genomes.txt -o glyso2_glyso3.png
plotsr --sr glyso3_glyma4syri.out --genomes glyso3_glyma4_genomes.txt -o glyso3_glyma4.png
plotsr --sr glyma4_cajca5syri.out --genomes glyma4_cajca5_genomes.txt -o glyma4_cajca5.png
plotsr --sr cajca5_phalu6syri.out --genomes cajca5_phalu6_genomes.txt -o cajca5_phalu6.png
plotsr --sr phalu6_phavu7syri.out --genomes phalu6_phavu7_genomes.txt -o phalu6_phavu7.png
plotsr --sr phavu7_vigan8syri.out --genomes phavu7_vigan8_genomes.txt -o phavu7_vigan8.png
plotsr --sr vigan8_lupal9syri.out --genomes vigan8_lupal9_genomes.txt -o vigan8_lupal9.png
plotsr --sr lupal9_lupal10syri.out --genomes lupal9_lupal10_genomes.txt -o lupal9_lupal10.png
plotsr --sr lupal10_medtr11syri.out --genomes lupal10_medtr11_genomes.txt -o lupal10_medtr11.png
plotsr --sr medtr11_lotja12syri.out --genomes medtr11_lotja12_genomes.txt -o medtr11_lotja12.png
plotsr --sr lotja12_pissa13syri.out --genomes lotja12_pissa13_genomes.txt -o lotja12_pissa13.png
plotsr --sr pissa13_vitvi14syri.out --genomes pissa13_vitvi14_genomes.txt -o pissa13_vitvi14.png
plotsr --sr vitvi14_vitvi15syri.out --genomes vitvi14_vitvi15_genomes.txt -o vitvi14_vitvi15.png
plotsr --sr vitvi15_phalu16syri.out --genomes vitvi15_phalu16_genomes.txt -o vitvi15_phalu16.png
plotsr --sr phalu16_phavu17syri.out --genomes phalu16_phavu17_genomes.txt -o phalu16_phavu17.png
plotsr --sr phavu17_vigra18syri.out --genomes phavu17_vigra18_genomes.txt -o phavu17_vigra18.png
plotsr --sr vigra18_cicar19syri.out --genomes vigra18_cicar19_genomes.txt -o vigra18_cicar19.png
plotsr --sr cicar19_pissa20syri.out --genomes cicar19_pissa20_genomes.txt -o cicar19_pissa20.png
plotsr --sr pissa20_lupal21syri.out --genomes pissa20_lupal21_genomes.txt -o pissa20_lupal21.png
plotsr --sr lupal21_vigun22syri.out --genomes lupal21_vigun22_genomes.txt -o lupal21_vigun22.png
plotsr --sr vigun22_cajca23syri.out --genomes vigun22_cajca23_genomes.txt -o vigun22_cajca23.png
plotsr --sr cajca23_vigra24syri.out --genomes cajca23_vigra24_genomes.txt -o cajca23_vigra24.png
plotsr --sr vigra24_vigun25syri.out --genomes vigra24_vigun25_genomes.txt -o vigra24_vigun25.png
plotsr --sr vigun25_phavu26syri.out --genomes vigun25_phavu26_genomes.txt -o vigun25_phavu26.png
plotsr --sr phavu26_phalu27syri.out --genomes phavu26_phalu27_genomes.txt -o phavu26_phalu27.png
plotsr --sr phalu27_vigan28syri.out --genomes phalu27_vigan28_genomes.txt -o phalu27_vigan28.png
plotsr --sr vigan28_glyma29syri.out --genomes vigan28_glyma29_genomes.txt -o vigan28_glyma29.png
plotsr --sr glyma29_glyso30syri.out --genomes glyma29_glyso30_genomes.txt -o glyma29_glyso30.png
plotsr --sr glyso30_vigun31syri.out --genomes glyso30_vigun31_genomes.txt -o glyso30_vigun31.png
plotsr --sr vigun31_vigan32syri.out --genomes vigun31_vigan32_genomes.txt -o vigun31_vigan32.png
plotsr --sr vigan32_glyma33syri.out --genomes vigan32_glyma33_genomes.txt -o vigan32_glyma33.png
plotsr --sr glyma33_lotja34syri.out --genomes glyma33_lotja34_genomes.txt -o glyma33_lotja34.png
plotsr --sr lotja34_lotja35syri.out --genomes lotja34_lotja35_genomes.txt -o lotja34_lotja35.png
plotsr --sr lotja35_medtr36syri.out --genomes lotja35_medtr36_genomes.txt -o lotja35_medtr36.png
