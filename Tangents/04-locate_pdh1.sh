##change all fastas to gespe.fna, all gffs to gespe.gff
##add gespe prefix to all chromosome names where needed

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


##still need to manually add species id to prefix and add annotation as a hit suffix

##then manually select the ones which seem like pdh1 based on matching regions within CDS of glyma.pdh1




##locate Gmscarecrow15
cat species.txt | while read line
do makeblastdb -dbtype nucl -in ../muscle_flanks/${line}.fna
blastn -db ../muscle_flanks/${line}.fna -query glyma16_scarecrow.fa -outfmt 6 -word_size 11 | grep 'e-' | grep -v 'e-0' > ${line}_scarecrow_blast.txt
done

##




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
#Hits for Vigun on Chr03 (two; 559bp and 470bp)
#Hits for Vigan on NC_030637.1 (550bp)
##
#Allhits
#glyma.Wm82.gnm4.Gm16    100.000 2552    0       0       1       2552    30160342        30162893        0.0     4713
#has scarecrow-like protein 5kb upstream
#note its inverted
#glyma.Wm82.gnm4.Gm02    88.842  475     38      9       792     1260    5243921 5244386 6.90e-160       569
#glyma.Wm82.gnm4.Gm02    87.629  388     29      10      1810    2195    5244635 5245005 9.44e-119       433
#glyma.Wm82.gnm4.Gm02    82.784  273     24      7       1512    1777    5244381 5244637 2.23e-55        222
#glyma.Wm82.gnm4.Gm14    78.846  156     30      3       1       156     26903289        26903137        3.02e-19        102
#glyma.Wm82.gnm4.Gm10    78.667  150     30      2       7       156     31336591        31336444        3.91e-18        99.0
#phalu.G27455.gnm1.Pl03  83.894  565     88      3       994     1557    40269058        40268496        3.91e-150       536
## ^^ THIS IS IN: 40268335-40269441 ID=phalu.G27455.gnm1.ann1.Pl03G0000340600;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
#note the BLAST appears to be inverted 40276363 
#has scarecrow-like TF 7kb downstream
#phalu.G27455.gnm1.Pl02  86.809  470     62      0       1001    1470    48608604        48609073        8.46e-147       525
## ^^ THIS IS IN: 48608604-48609149 ID=phalu.G27455.gnm1.ann1.Pl02G0000430800;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
## WHICH IS 7kb DOWNSTREAM OF ANOTHER DIRIGENT LIKE PROTEIN!!
#phavu.UI111.gnm1.Chr02  83.964  555     81      4       1001    1554    47218049        47218596        8.59e-147       525
## ^^ THIS IS IN: 47217828-47218674 ID=phavu.UI111.gnm1.ann1.PvUI111.02G289500;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
#phavu.UI111.gnm1.Chr03  83.126  563     92      3       991     1552    48538576        48538016        2.41e-142       510
#note the BLAST appears to be inverted
## ^^ THIS IS IN: 48538016-48538567 ID=phavu.UI111.gnm1.ann1.PvUI111.03G250500;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
#has scarecrow-like protein 5kb downstream
#NC_030637.1     83.333  558     86      4       1001    1556    25801312        25801864        7.27e-142       508
## ^^ THIS IS IN: 25801043-25801905 ID=gene-LOC108340760;gene_biotype=protein_coding
#note: scarecrow-like protein is present 10kb upstream
#vigun.IT97K-499-35.gnm1.Vu03    83.363  559     86      4       1001    1557    43982045        43982598        2.25e-142       510
## ^^ THIS IS IN: 43981712-43982682 ID=vigun.IT97K-499-35.gnm1.ann2.Vigun03g268500;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
#has scarecrow-like protein 16.6kb upstream
#vigun.IT97K-499-35.gnm1.Vu03    85.319  470     69      0       1001    1470    2990467 2989998 3.80e-135       486
#note the BLAST appears to be inverted
## ^^ THIS IS IN: 2989743-2990706 ID=vigun.IT97K-499-35.gnm1.ann2.Vigun03g039200;Note=Disease resistance-responsive (dirigent-like protein) family protein%3B IPR004265 (Plant disease resistance response protein)
