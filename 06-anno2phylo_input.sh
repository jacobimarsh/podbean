conda activate blast
conda install -c bioconda seqkit
conda install -c bioconda bioawk

awk '{print $30}' musclesites_info.mtx >> namechanging_AUGUSTUS.temp
awk '{print $1":"$22":"$17":"$18":"$24"-"$25":"$19":"$20"-"$21}' musclesites_info.mtx | paste namechanging_AUGUSTUS.temp - > naming_AUG.tmp
sed 's/.t1//' soybean_prob.aa > AUG_pre.aa
seqkit replace -p "(.+)" -r '{kv}' -k naming_AUG.tmp AUG_pre.aa >> a.txt
cat a.txt | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > soybean_prob_AUGonly_fin.aa


grep '>' muscle_flanks.fa | sed 's/>//' > name_changing_muscleflanks.tmp
awk '{print $1":"$22":"$17":"$18":"$2":"$7"-"$8}' musclesites_info.mtx | paste name_changing_muscleflanks.tmp - > naming_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k naming_MFs.tmp muscle_flanks.fa >> muscle_flanks_renamed.fa
grep AUGUSTUS naming_MFs.tmp > naming_AUG_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k naming_AUG_MFs.tmp muscle_flanks.fa >> AUG_MFaa.tmp
cat AUG_MFaa.tmp | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > muscle_flanks_AUG_renamed.fa

