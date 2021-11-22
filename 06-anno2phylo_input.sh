conda install -c bioconda seqkit
conda install -c bioconda bioawk

awk '{print $30}' musclesites_info.mtx >> namechanging_AUGUSTUS.temp
awk '{print $1":"$22":"$17":"$18":"$24"-"$25":"$19":"$20"-"$21}' musclesites_info.mtx | paste namechanging_AUGUSTUS.temp - > naming_AUG.tmp
sed 's/.t1//' soybean_prob.aa > AUG_pre.aa
seqkit replace -p "(.+)" -r '{kv}' -k naming_AUG.tmp AUG_pre.aa >> a.txt
cat a.txt | bioawk -c fastx ' $name ~ /.....:/ { print ">" $name "\n" $seq }' > soybean_prob_AUGonly_fin.aa
