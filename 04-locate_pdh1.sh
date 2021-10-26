#BLAST the 12kb pdh1 region in Wm82.a4.v1 against reference of other legumes

conda create --name blast
conda activate blast
conda install -c bioconda blast

cat species.txt | while read line
do makeblastdb -dbtype nucl -in ${line}.fna
blastn -db ${line}.fna -query 12kb.fa -outfmt 6 > ${line}_12kb_blast.txt
blastn -db ${line}.fna -query 1kb_flank_glyma16_22580.fa -outfmt 6 > ${line}_1kbflank_blast.txt
done

#Hits for Glyma on Chr16 (2.5kb; 100%), Chr02 (1.1kb), Chr10 (150bp) and Chr14 (156bp)
#Hits for Phavu on Chr02 (550bp) and Chr03 (550bp)
#Hits for Phalu on Chr02 (550bp) and Chr03 (470bp)
#Hits for Vigun on Chr03 (two; at 559bp and 470bp)
#Hits for Vigan on NC_030637.1 (550bp)
