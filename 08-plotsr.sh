conda create --name plotsr
conda activate plotsr
conda install -c bioconda plotsr
conda install -c bioconda 'minimap2>=2.7'
minimap2 -ax asm5 -t 4 -eqx glyma1.fa glyso2.fa | samtools sort -O BAM - > glyma1_glyso2.bam
samtools index glyma1_glyso2.bam
minimap2 -ax asm5 -t 4 -eqx glyso2.fa glyma1.fa | samtools sort -O BAM - > glyso2_glyma1.bam
samtools index glyso2_glyma1.bam
