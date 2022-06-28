cat soybean_prob_AUGonly_fin.aa | while read line; do if [[ ${line:0:1} == '>' ]]; then outfile=${line#>}.fa; echo $line > $outfile; else echo $line >> $outfile; fi; done

# mv glyso:AUGUSTUS:norm:dir:1502-2074:glyso.W05.gnm1.Chr05:41419993-41423693.fa glyso2.aa
# mv glyso:AUGUSTUS:norm:dir:1502-2071:glyso.W05.gnm1.Chr08:1641010-1644710.fa glyso3.aa
# mv glyso:AUGUSTUS:norm:.:1541-2026:glyso.W05.gnm1.Chr08:1647506-1651206.fa glyso30.aa
# mv glyma:AUGUSTUS:norm:dir:1502-2074:glyma.Wm82.gnm4.Gm05:39540285-39543985.fa glyma1.aa
# mv glyma:AUGUSTUS:norm:dir:1502-2071:glyma.Wm82.gnm4.Gm08:1631198-1634898.fa glyma4.aa
# mv glyma:AUGUSTUS:norm:dir:1502-2026:glyma.Wm82.gnm4.Gm08:1637518-1641218.fa glyma29.aa
# mv cicar:AUGUSTUS:inv:other:1745-2200:cicar_CDC_Ca6:4952122-4955822.fa cicar19.aa
# mv cajca:AUGUSTUS:norm:dir:1502-2080:cajca.ICPL87119.gnm1.Cc10:3358983-3362683.fa cajca5.aa
# mv cajca:AUGUSTUS:inv:.:1649-2200:cajca.ICPL87119.gnm1.Cc10:3373840-3377540.fa cajca23.aa
# mv vitvi:AUGUSTUS:norm:other:1502-2080:vitvi_2:773664-777364.fa vitvi14.aa
# mv vitvi:AUGUSTUS:norm:other:1502-2062:vitvi_2:776250-779950.fa vitvi15.aa
# mv vitvi:AUGUSTUS:norm:other:1502-2059:vitvi_2:783655-787355.fa vitvi38.aa
# mv vitvi:AUGUSTUS:norm:other:1502-2059:vitvi_2:779423-783123.fa vitvi37.aa
# mv vigun:AUGUSTUS:norm:.:1502-2050:vigun.IT97K-499-35.gnm1.Vu03:43980544-43984244.fa vigun31.aa
# mv vigun:AUGUSTUS:inv:dir:1673-2200:vigun.IT97K-499-35.gnm1.Vu03:2991636-2995336.fa vigun22.aa
# mv vigun:AUGUSTUS:inv:dir:1652-2200:vigun.IT97K-499-35.gnm1.Vu03:2988268-2991968.fa vigun25.aa
# mv vigra:AUGUSTUS:inv:dir:1673-2200:vigra.VC1973A.gnm6.Vr07:53483706-53487406.fa vigra24.aa
# mv vigra:AUGUSTUS:inv:.:1652-2200:vigra.VC1973A.gnm6.Vr07:1033298-1036998.fa vigra18.aa
# mv vigan:AUGUSTUS:norm:other:1502-2029:vigan_NC_030647.1:2098926-2102626.fa vigan8.aa
# mv vigan:AUGUSTUS:norm:other:1496-2047:vigan_NC_030647.1:2103403-2107103.fa vigan28.aa
# mv vigan:AUGUSTUS:norm:.:1502-2050:vigan_NC_030637.1:25799811-25803511.fa vigan32.aa
# mv pissa:AUGUSTUS:norm:other:1502-2068:pissa_chr7LG7:42859223-42862923.fa pissa13.aa
# mv pissa:AUGUSTUS:inv:other:1636-2199:pissa_chr7LG7:47125933-47129633.fa pissa20.aa
# mv phavu:AUGUSTUS:norm:dir:1502-2071:phavu.UI111.gnm1.Chr02:47208320-47212020.fa phavu7.aa
# mv phavu:AUGUSTUS:norm:.:1502-2047:phavu.UI111.gnm1.Chr02:47216548-47220248.fa phavu26.aa
# mv phavu:AUGUSTUS:inv:dir:1650-2201:phavu.UI111.gnm1.Chr03:48536367-48540067.fa phavu17.aa
# mv phalu:AUGUSTUS:norm:dir:1502-2047:phalu.G27455.gnm1.Pl02:48607103-48610803.fa phalu27.aa
# mv phalu:AUGUSTUS:norm:dir:1501-2070:phalu.G27455.gnm1.Pl02:48599898-48603598.fa phalu6.aa
# mv phalu:AUGUSTUS:inv:.:1650-2201:phalu.G27455.gnm1.Pl03:40266852-40270552.fa phalu16.aa
# mv medtr:AUGUSTUS:norm:other:1502-2071:medtr.jemalong_A17.gnm5.MtrunA17Chr8:45789426-45793126.fa medtr11.aa
# mv medtr:AUGUSTUS:norm:.:1502-1957:medtr.jemalong_A17.gnm5.MtrunA17Chr8:45809764-45813464.fa medtr36.aa
# mv lupal:AUGUSTUS:norm:dir:1502-2062:lupal.Amiga.gnm1.Lalb_Chr16:12629716-12633416.fa lupal10.aa
# mv lupal:AUGUSTUS:norm:dir:1502-2062:lupal.Amiga.gnm1.Lalb_Chr16:12621572-12625272.fa lupal9.aa
# mv lupal:AUGUSTUS:inv:.:1682-2200:lupal.Amiga.gnm1.Lalb_Chr09:9625919-9629619.fa lupal21.aa
# mv lotja:AUGUSTUS:norm:other:1502-2071:lotja.MG20.gnm3.Lj4:39623588-39627288.fa lotja12.aa
# mv lotja:AUGUSTUS:norm:other:1502-2047:lotja.MG20.gnm3.Lj4:8946504-8950204.fa lotja35.aa
# mv lotja:AUGUSTUS:norm:.:1502-2047:lotja.MG20.gnm3.Lj4:39629947-39633647.fa lotja34.aa

scp soybean_prob_AUGonly_fin.aa OF_input_AUG.aa
#remove the pissa with the downstream annotation match, add Gm16 pdh1

sed -i 's/glyso:AUGUSTUS:norm:dir:1502-2074:glyso.W05.gnm1.Chr05:41419993-41423693/glyso2/' OF_input_AUG.aa
sed -i 's/glyso:AUGUSTUS:norm:dir:1502-2071:glyso.W05.gnm1.Chr08:1641010-1644710/glyso3/' OF_input_AUG.aa
sed -i 's/glyso:AUGUSTUS:norm:.:1541-2026:glyso.W05.gnm1.Chr08:1647506-1651206/glyso30/' OF_input_AUG.aa
sed -i 's/glyma:AUGUSTUS:norm:dir:1502-2074:glyma.Wm82.gnm4.Gm05:39540285-39543985/glyma1/' OF_input_AUG.aa
sed -i 's/glyma:AUGUSTUS:norm:dir:1502-2071:glyma.Wm82.gnm4.Gm08:1631198-1634898/glyma4/' OF_input_AUG.aa
sed -i 's/glyma:AUGUSTUS:norm:dir:1502-2026:glyma.Wm82.gnm4.Gm08:1637518-1641218/glyma29/' OF_input_AUG.aa
sed -i 's/cicar:AUGUSTUS:inv:other:1745-2200:cicar_CDC_Ca6:4952122-4955822/cicar19/' OF_input_AUG.aa
sed -i 's/cajca:AUGUSTUS:norm:dir:1502-2080:cajca.ICPL87119.gnm1.Cc10:3358983-3362683/cajca5/' OF_input_AUG.aa
sed -i 's/cajca:AUGUSTUS:inv:.:1649-2200:cajca.ICPL87119.gnm1.Cc10:3373840-3377540/cajca23/' OF_input_AUG.aa
sed -i 's/vitvi:AUGUSTUS:norm:other:1502-2080:vitvi_2:773664-777364/vitvi14/' OF_input_AUG.aa
sed -i 's/vitvi:AUGUSTUS:norm:other:1502-2062:vitvi_2:776250-779950/vitvi15/' OF_input_AUG.aa
sed -i 's/vitvi:AUGUSTUS:norm:other:1502-2059:vitvi_2:783655-787355/vitvi38/' OF_input_AUG.aa
sed -i 's/vitvi:AUGUSTUS:norm:other:1502-2059:vitvi_2:779423-783123/vitvi37/' OF_input_AUG.aa
sed -i 's/vigun:AUGUSTUS:norm:.:1502-2050:vigun.IT97K-499-35.gnm1.Vu03:43980544-43984244/vigun31/' OF_input_AUG.aa
sed -i 's/vigun:AUGUSTUS:inv:dir:1673-2200:vigun.IT97K-499-35.gnm1.Vu03:2991636-2995336/vigun22/' OF_input_AUG.aa
sed -i 's/vigun:AUGUSTUS:inv:dir:1652-2200:vigun.IT97K-499-35.gnm1.Vu03:2988268-2991968/vigun25/' OF_input_AUG.aa
sed -i 's/vigra:AUGUSTUS:inv:dir:1673-2200:vigra.VC1973A.gnm6.Vr07:53483706-53487406/vigra24/' OF_input_AUG.aa
sed -i 's/vigra:AUGUSTUS:inv:.:1652-2200:vigra.VC1973A.gnm6.Vr07:1033298-1036998/vigra18/' OF_input_AUG.aa
sed -i 's/vigan:AUGUSTUS:norm:other:1502-2029:vigan_NC_030647.1:2098926-2102626/vigan8/' OF_input_AUG.aa
sed -i 's/vigan:AUGUSTUS:norm:other:1496-2047:vigan_NC_030647.1:2103403-2107103/vigan28/' OF_input_AUG.aa
sed -i 's/vigan:AUGUSTUS:norm:.:1502-2050:vigan_NC_030637.1:25799811-25803511/vigan32/' OF_input_AUG.aa
sed -i 's/pissa:AUGUSTUS:norm:other:1502-2068:pissa_chr7LG7:42859223-42862923/pissa13/' OF_input_AUG.aa
sed -i 's/pissa:AUGUSTUS:inv:other:1636-2199:pissa_chr7LG7:47125933-47129633/pissa20/' OF_input_AUG.aa
sed -i 's/phavu:AUGUSTUS:norm:dir:1502-2071:phavu.UI111.gnm1.Chr02:47208320-47212020/phavu7/' OF_input_AUG.aa
sed -i 's/phavu:AUGUSTUS:norm:.:1502-2047:phavu.UI111.gnm1.Chr02:47216548-47220248/phavu26/' OF_input_AUG.aa
sed -i 's/phavu:AUGUSTUS:inv:dir:1650-2201:phavu.UI111.gnm1.Chr03:48536367-48540067/phavu17/' OF_input_AUG.aa
sed -i 's/phalu:AUGUSTUS:norm:dir:1502-2047:phalu.G27455.gnm1.Pl02:48607103-48610803/phalu27/' OF_input_AUG.aa
sed -i 's/phalu:AUGUSTUS:norm:dir:1501-2070:phalu.G27455.gnm1.Pl02:48599898-48603598/phalu6/' OF_input_AUG.aa
sed -i 's/phalu:AUGUSTUS:inv:.:1650-2201:phalu.G27455.gnm1.Pl03:40266852-40270552/phalu16/' OF_input_AUG.aa
sed -i 's/medtr:AUGUSTUS:norm:other:1502-2071:medtr.jemalong_A17.gnm5.MtrunA17Chr8:45789426-45793126/medtr11/' OF_input_AUG.aa
sed -i 's/medtr:AUGUSTUS:norm:.:1502-1957:medtr.jemalong_A17.gnm5.MtrunA17Chr8:45809764-45813464/medtr36/' OF_input_AUG.aa
sed -i 's/lupal:AUGUSTUS:norm:dir:1502-2062:lupal.Amiga.gnm1.Lalb_Chr16:12629716-12633416/lupal10/' OF_input_AUG.aa
sed -i 's/lupal:AUGUSTUS:norm:dir:1502-2062:lupal.Amiga.gnm1.Lalb_Chr16:12621572-12625272/lupal9/' OF_input_AUG.aa
sed -i 's/lupal:AUGUSTUS:inv:.:1682-2200:lupal.Amiga.gnm1.Lalb_Chr09:9625919-9629619/lupal21/' OF_input_AUG.aa
sed -i 's/lotja:AUGUSTUS:norm:other:1502-2071:lotja.MG20.gnm3.Lj4:39623588-39627288/lotja12/' OF_input_AUG.aa
sed -i 's/lotja:AUGUSTUS:norm:other:1502-2047:lotja.MG20.gnm3.Lj4:8946504-8950204/lotja35/' OF_input_AUG.aa
sed -i 's/lotja:AUGUSTUS:norm:.:1502-2047:lotja.MG20.gnm3.Lj4:39629947-39633647/lotja34/' OF_input_AUG.aa

orthofinder -f OF_input_AUG.aa
