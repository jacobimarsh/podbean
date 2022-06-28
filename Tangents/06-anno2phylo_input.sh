conda activate blast
conda install -c bioconda seqkit
conda install -c bioconda bioawk

cd muscle_flanks

awk '{print $30}' musclesites_info.mtx > namechanging_AUGUSTUS.temp
awk '{print $1":"$22":"$17":"$18":"$24"-"$25":"$19":"$20"-"$21}' musclesites_info.mtx | paste namechanging_AUGUSTUS.temp - > naming_AUG.tmp
sed 's/.t1//' soybean_prob.aa > AUG_pre.aa
seqkit replace -p "(.+)" -r '{kv}' -k naming_AUG.tmp AUG_pre.aa > a.txt
cat a.txt | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > soybean_prob_AUGonly_fin.aa
# soybean_prob_AUGonly_fin.aa represents the AUGUSTUS predicted proteins from muscle_flanks.fa

grep '>' muscle_flanks.fa | sed 's/>//' > name_changing_muscleflanks.tmp
##need a way to match lines from each before doing the next step..
#did manually, but need to check if repeating
awk '{print $1":"$22":"$17":"$18":"$2":"$7"-"$8":"$12}' musclesites_info.mtx | paste name_changing_muscleflanks.tmp - > naming_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k naming_MFs.tmp muscle_flanks.fa > muscle_flanks_renamed.fa
grep AUGUSTUS naming_MFs.tmp > naming_AUG_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k naming_AUG_MFs.tmp muscle_flanks.fa > AUG_MFaa.tmp
cat AUG_MFaa.tmp | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > muscle_flanks_AUG_renamed.fa
#muscle_flanks_renamed.fa is muscle_flanks.fa for all, AUG is for only those with an AUG hit


##WITHOUT THE 5 PISSAs

awk '{print $30}' pruned_musclesites_info.mtx > pruned_namechanging_AUGUSTUS.temp
awk '{print $1":"$22":"$17":"$18":"$24"-"$25":"$19":"$20"-"$21}' pruned_musclesites_info.mtx | paste pruned_namechanging_AUGUSTUS.temp - > pruned_naming_AUG.tmp
sed 's/.t1//' pruned_soybean_prob.aa > pruned_AUG_pre.aa
seqkit replace -p "(.+)" -r '{kv}' -k pruned_naming_AUG.tmp pruned_AUG_pre.aa > pruned_a.txt
cat pruned_a.txt | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > pruned_soybean_prob_AUGonly_fin.aa
# soybean_prob_AUGonly_fin.aa represents the AUGUSTUS predicted proteins from muscle_flanks.fa

grep '>' pruned_muscle_flanks.fa | sed 's/>//' > pruned_name_changing_muscleflanks.tmp
##need a way to match lines from each before doing the next step..
#did manually, but need to check if repeating
awk '{print $1":"$22":"$17":"$18":"$2":"$7"-"$8":"$12}' pruned_musclesites_info.mtx | paste pruned_name_changing_muscleflanks.tmp - > pruned_naming_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k pruned_naming_MFs.tmp pruned_muscle_flanks.fa > pruned_muscle_flanks_renamed.fa
grep AUGUSTUS pruned_naming_MFs.tmp > pruned_naming_AUG_MFs.tmp
seqkit replace -p "(.+)" -r '{kv}' -k pruned_naming_AUG_MFs.tmp pruned_muscle_flanks.fa > pruned_AUG_MFaa.tmp
cat AUG_MFaa.tmp | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > pruned_muscle_flanks_AUG_renamed.fa
