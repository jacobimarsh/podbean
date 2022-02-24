conda activate py2
conda install -c bioconda/label/cf201901 minimap2
minimap2 -ax asm5 -t 4 -eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
samtools index glyma1_glyso2.bam
minimap2 -ax asm5 -t 4 -eqx glyso2.fa glyma1.fa | samtools sort -O BAM - > glyso2_glyma1.bam
samtools index glyso2_glyma1.bam
