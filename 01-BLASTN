#conda create --name blast
conda activate blast
#conda install -c bioconda blast
module load bedtools

cat species.txt | while read line
do makeblastdb -dbtype nucl -in ${line}.fna
blastn -db ${line}.fna -query 1kb_flank_glyma16_22580.fa -outfmt 6 -word_size 11 | grep 'e-' | grep -v 'e-0' > ${line}_1kbflank_blast.txt
done

echo -e "shortID\tChromosome\theader\t%\tident\tlength\tmismatch\tgapopen\tqrystart\tqryend\tsubstart\tsubend\tEvalue\tbitscore\t100bp diff\t100bp in\tflank start\tflank end\tdirection" > all_1kbflank_blast_flanks.txt

cat *_1kbflank_blast.txt | 
  awk -vmaxval='1100' '{$13=maxval-$7;print $0, OFS = "\t"}' | 
    awk 'FS="\t" {if ($10>$9) $14 = $9 + $13; else $14 = $9 - $13; print $0, OFS = "\t"}' | 
      awk 'FS="\t" {if ($10>$9) $15 = $14 - 1600; else $15 = $14 + 1600; print $0, OFS = "\t"}' | 
        awk 'FS="\t" {if ($10>$9) $16 = $14 + 2100; else $16 = $14 - 2100; print $0, OFS = "\t"}' |
          awk 'FS="\t" {if ($10>$9) $17 = "norm"; else $17 = "inv"; print $0, OFS = "\t"}' >> all_1kbflank_blast_flanks.txt

cat species.txt | while read line
do
cat all_1kbflank_blast_flanks.txt | 
  grep ${line} | 
    awk '{if ($1 !~ /^#/) print($2"\t"$14-1"\t"$15)}' | 
      tail -n +2 | awk '{if ($2 > $3) print $1"\t"$3"\t"$2; else print}' | 
        bedtools intersect -nonamecheck -b stdin -a ${line}.gff* -wao | 
          grep -v '\-1' | 
            grep -P '\tgene\t' > ${line}_BLAST_hits.gff
done
cat *_BLAST_hits.gff > all_BLAST_hits.gff

##glyma has scaffolds
grep glyma all_1kbflank_blast_flanks.txt | grep -v scaffold | awk '{if ($1 !~ /^#/) print($2"\t"$14-1"\t"$15)}' |        
awk '{if ($2 > $3) print $1"\t"$3"\t"$2; else print}' | 
bedtools intersect -nonamecheck -b stdin -a glyma.gff3 -wao |            
grep -v '\-1' |              
grep -P '\tgene\t' > glyma_BLAST_hits.gff

##cicar doesn't have gene features
grep cicar all_1kbflank_blast_flanks.txt | awk '{if ($1 !~ /^#/) print($2"\t"$14-1"\t"$15)}'| 
awk '{if ($2 > $3) print $1"\t"$3"\t"$2; else print}' | 
bedtools intersect -nonamecheck -b stdin -a cicar.gff -wao |            
grep -v '\-1' > cicar_BLAST_hits.gff

cat *_BLAST_hits.gff > all_BLAST_hits.gff
cat all_1kbflank_blast_flanks.txt all_BLAST_hits.gff > BLASTHITS_excel_xport.txt

##vitvi has some missing gene features
grep vitvi all_1kbflank_blast_flanks.txt | awk '{if ($1 !~ /^#/) print($2"\t"$14-1"\t"$15)}'| 
awk '{if ($2 > $3) print $1"\t"$3"\t"$2; else print}' | 
bedtools intersect -nonamecheck -b stdin -a vitvi.gff3 -wao |            
grep -v '\-1' | 
grep -P '\tmRNA\t' > vitvi_BLAST_hits.gff

cat *_BLAST_hits.gff > all_BLAST_hits.gff
cat all_1kbflank_blast_flanks.txt all_BLAST_hits.gff > BLASTHITS_excel_xport.txt

##locate GmSCL15
cat species.txt | while read line
do makeblastdb -dbtype nucl -in ../muscle_flanks/${line}.fna
blastn -db ../muscle_flanks/${line}.fna -query glyma16_scarecrow.fa -outfmt 6 -word_size 11 | grep 'e-' | grep -v 'e-0' > ${line}_scarecrow_blast.txt
done
