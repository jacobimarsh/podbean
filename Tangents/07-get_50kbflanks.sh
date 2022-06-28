#Only AUG
echo '#!/bin/bash' > get_50kbflanks_fa.sh
cat ../fasta_blasta2/species.txt | sed 's/$/.fna/' | sed 's/^/samtools faidx /' >> get_50kbflanks_fa.sh
awk '{print $1, $2, $15, $16}' Phylog_clades.mtx | sed 's/ /:/g' | sed -r 's/:([^:]*)$/-\1/' | sed 's/:/.fna /' | sed 's/^/samtools faidx /' | sed 's/$/ \>> 50kb_flanks.fa/' >> get_50kbflanks_fa.sh
chmod u+x get_50kbflanks_fa.sh
get_50kbflanks_fa.sh
awk '/^>/ {OUT=substr($0,2) ".fa"}; OUT {print >OUT}' 50kb_flanks.fa
