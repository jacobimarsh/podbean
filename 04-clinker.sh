##get all gffs just the region of interest, then trim down so its only region of interest
#gff to genbank
#Get just chromosome of interest

samtools faidx ../muscle_flanks/phavu.fna
samtools faidx ../muscle_flanks/phavu.fna phavu.UI111.gnm1.Chr03 > Chr03.fn

conda activate py3
python3 gff_to_genbank.py glyma_region.gff3 Gm16.fna

#run clinker
conda activate clinker
unset PYTHONPATH
clinker -ufo -j 15 -p pdh1_added -f whole_chr_gb/*.gb
