echo '#!/bin/bash' > get_flanks_fa.sh
cat ../fasta_blasta2/species.txt | sed 's/$/.fna/' | sed 's/^/samtools faidx /' >> get_flanks_fa.sh
grep norm hi_conf_blasthits.mtx | awk '{print $1, $2, $15, $16}' | sed 's/ /:/g' | sed -r 's/:([^:]*)$/-\1/' | sed 's/:/.fna /' | sed 's/^/samtools faidx /' | sed 's/$/ \>> muscle_flanks.fa/' >> get_flanks_fa.sh
grep inv hi_conf_blasthits.mtx | awk '{print $1, $2, $16, $15}' | sed 's/ /:/g' | sed -r 's/:([^:]*)$/-\1/' | sed 's/:/.fna /' | sed 's/^/samtools faidx /' | sed 's/$/ \>> muscle_flanks.fa/' >> get_flanks_fa.sh
chmod u+x get_flanks_fa.sh
get_flanks_fa.sh
