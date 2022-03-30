## whole chrom align
module load gnuplot
nucmer -c 100 -p nucmer Vu3.fa Chr02.fa
mummerplot -x "[2000000,4000000]" -y "[46000000,48000000]"   --png nucmer.delta
sed -i 's/png.*/pngcairo/' out.gp
sed -i '/set mouse clipboardformat/d' out.gp
gnuplot out.gp

nucmer -c 100 -p vigun25_phavu26 vigun25.fa phavu26.fa
mummerplot -p vigun25_phavu26 --png vigun25_phavu26.delta
sed -i 's/png.*/pngcairo/' vigun25_phavu26.gp
sed -i '/set mouse clipboardformat/d' vigun25_phavu26.gp
gnuplot vigun25_phavu26.gp

nucmer -c 100 -p vigun25_phavu26 vigun25.fa phavu26.fa; mummerplot -p vigun25_phavu26 --png vigun25_phavu26.delta; sed -i 's/ png.*/ pngcairo/' vigun25_phavu26.gp; sed -i '/set mouse clipboardformat/d' vigun25_phavu26.gp; gnuplot vigun25_phavu26.gp

nucmer -c 100 -p glyma1_glyso2 glyma1.fa glyso2.fa; mummerplot -p glyma1_glyso2 --png	glyma1_glyso2.delta; sed -i 's/ png.*/ pngcairo/'	glyma1_glyso2.gp;	sed -i '/set mouse clipboardformat/d' glyma1_glyso2.gp; gnuplot	glyma1_glyso2.gp
nucmer -c 100 -p glyso2_glyso3 glyso2.fa glyso3.fa; mummerplot -p glyso2_glyso3 --png	glyso2_glyso3.delta; sed -i 's/ png.*/ pngcairo/'	glyso2_glyso3.gp;	sed -i '/set mouse clipboardformat/d' glyso2_glyso3.gp; gnuplot	glyso2_glyso3.gp
nucmer -c 100 -p glyso3_glyma4 glyso3.fa glyma4.fa; mummerplot -p glyso3_glyma4 --png	glyso3_glyma4.delta; sed -i 's/ png.*/ pngcairo/'	glyso3_glyma4.gp;	sed -i '/set mouse clipboardformat/d' glyso3_glyma4.gp; gnuplot	glyso3_glyma4.gp
nucmer -c 100 -p glyma4_cajca5 glyma4.fa cajca5.fa; mummerplot -p glyma4_cajca5 --png	glyma4_cajca5.delta; sed -i 's/ png.*/ pngcairo/'	glyma4_cajca5.gp;	sed -i '/set mouse clipboardformat/d' glyma4_cajca5.gp; gnuplot	glyma4_cajca5.gp
nucmer -c 100 -p cajca5_phalu6 cajca5.fa phalu6.fa; mummerplot -p cajca5_phalu6 --png	cajca5_phalu6.delta; sed -i 's/ png.*/ pngcairo/'	cajca5_phalu6.gp;	sed -i '/set mouse clipboardformat/d' cajca5_phalu6.gp; gnuplot	cajca5_phalu6.gp
nucmer -c 100 -p phalu6_phavu7 phalu6.fa phavu7.fa; mummerplot -p phalu6_phavu7 --png	phalu6_phavu7.delta; sed -i 's/ png.*/ pngcairo/'	phalu6_phavu7.gp;	sed -i '/set mouse clipboardformat/d' phalu6_phavu7.gp; gnuplot	phalu6_phavu7.gp
nucmer -c 100 -p phavu7_vigan8 phavu7.fa vigan8.fa; mummerplot -p phavu7_vigan8 --png	phavu7_vigan8.delta; sed -i 's/ png.*/ pngcairo/'	phavu7_vigan8.gp;	sed -i '/set mouse clipboardformat/d' phavu7_vigan8.gp; gnuplot	phavu7_vigan8.gp
nucmer -c 100 -p vigan8_lupal9 vigan8.fa lupal9.fa; mummerplot -p vigan8_lupal9 --png	vigan8_lupal9.delta; sed -i 's/ png.*/ pngcairo/'	vigan8_lupal9.gp;	sed -i '/set mouse clipboardformat/d' vigan8_lupal9.gp; gnuplot	vigan8_lupal9.gp
nucmer -c 100 -p lupal9_lupal10 lupal9.fa lupal10.fa; mummerplot -p lupal9_lupal10 --png lupal9_lupal10.delta; sed -i 's/ png.*/ pngcairo/' lupal9_lupal10.gp;	sed -i '/set mouse clipboardformat/d' lupal9_lupal10; gnuplot lupal9_lupal10.gp
nucmer -c 100 -p lupal10_medtr11 lupal10.fa medtr11.fa; mummerplot -p lupal10_medtr11 --png lupal10_medtr11.delta; sed -i 's/ png.*/ pngcairo/' lupal10_medtr11.gp; sed -i '/set mouse clipboardformat/d' lupal10_medtr11; gnuplot lupal10_medtr11.gp
nucmer -c 100 -p medtr11_lotja12 medtr11.fa lotja12.fa; mummerplot -p medtr11_lotja12 --png medtr11_lotja12.delta; sed -i 's/ png.*/ pngcairo/' medtr11_lotja12.gp; sed -i '/set mouse clipboardformat/d' medtr11_lotja12.gp; gnuplot	medtr11_lotja12.gp
nucmer -c 100 -p lotja12_pissa13 lotja12.fa pissa13.fa; mummerplot -p lotja12_pissa13 --png lotja12_pissa13.delta; sed -i 's/ png.*/ pngcairo/' lotja12_pissa13.gp;	sed -i '/set mouse clipboardformat/d' lotja12_pissa13.gp; gnuplot	lotja12_pissa13.gp
nucmer -c 100 -p pissa13_vitvi14 pissa13.fa vitvi14.fa; mummerplot -p pissa13_vitvi14 --png pissa13_vitvi14.delta; sed -i 's/ png.*/ pngcairo/' pissa13_vitvi14.gp;	sed -i '/set mouse clipboardformat/d' pissa13_vitvi14.gp; gnuplot	pissa13_vitvi14.gp
nucmer -c 100 -p vitvi14_vitvi15 vitvi14.fa vitvi15.fa; mummerplot -p vitvi14_vitvi15 --png vitvi14_vitvi15.delta; sed -i 's/ png.*/ pngcairo/' vitvi14_vitvi15.gp;	sed -i '/set mouse clipboardformat/d' vitvi14_vitvi15.gp; gnuplot	vitvi14_vitvi15.gp
nucmer -c 100 -p vitvi15_phalu16 vitvi15.fa phalu16.fa; mummerplot -p vitvi15_phalu16 --png vitvi15_phalu16.delta; sed -i 's/ png.*/ pngcairo/' vitvi15_phalu16.gp;	sed -i '/set mouse clipboardformat/d' vitvi15_phalu16.gp; gnuplot	vitvi15_phalu16.gp
nucmer -c 100 -p phalu16_phavu17 phalu16.fa phavu17.fa; mummerplot -p phalu16_phavu17 --png phalu16_phavu17.delta; sed -i 's/ png.*/ pngcairo/' phalu16_phavu17.gp;	sed -i '/set mouse clipboardformat/d' phalu16_phavu17.gp; gnuplot	phalu16_phavu17.gp
nucmer -c 100 -p phavu17_vigra18 phavu17.fa vigra18.fa; mummerplot -p phavu17_vigra18 --png phavu17_vigra18.delta; sed -i 's/ png.*/ pngcairo/' phavu17_vigra18.gp;	sed -i '/set mouse clipboardformat/d' phavu17_vigra18.gp; gnuplot	phavu17_vigra18.gp
nucmer -c 100 -p vigra18_cicar19 vigra18.fa cicar19.fa; mummerplot -p vigra18_cicar19 --png vigra18_cicar19.delta; sed -i 's/ png.*/ pngcairo/' vigra18_cicar19.gp;	sed -i '/set mouse clipboardformat/d' vigra18_cicar19.gp; gnuplot	vigra18_cicar19.gp
nucmer -c 100 -p cicar19_pissa20 cicar19.fa pissa20.fa; mummerplot -p cicar19_pissa20 --png cicar19_pissa20.delta; sed -i 's/ png.*/ pngcairo/' cicar19_pissa20.gp;	sed -i '/set mouse clipboardformat/d' cicar19_pissa20.gp; gnuplot	cicar19_pissa20.gp
nucmer -c 100 -p pissa20_lupal21 pissa20.fa lupal21.fa; mummerplot -p pissa20_lupal21 --png pissa20_lupal21.delta; sed -i 's/ png.*/ pngcairo/' pissa20_lupal21.gp;	sed -i '/set mouse clipboardformat/d' pissa20_lupal21.gp; gnuplot	pissa20_lupal21.gp
nucmer -c 100 -p lupal21_vigun22 lupal21.fa vigun22.fa; mummerplot -p lupal21_vigun22 --png lupal21_vigun22.delta; sed -i 's/ png.*/ pngcairo/' lupal21_vigun22.gp;	sed -i '/set mouse clipboardformat/d' lupal21_vigun22.gp; gnuplot	lupal21_vigun22.gp
nucmer -c 100 -p vigun22_cajca23 vigun22.fa cajca23.fa; mummerplot -p vigun22_cajca23 --png vigun22_cajca23.delta; sed -i 's/ png.*/ pngcairo/' vigun22_cajca23.gp;	sed -i '/set mouse clipboardformat/d' vigun22_cajca23.gp; gnuplot	vigun22_cajca23.gp
nucmer -c 100 -p cajca23_vigra24 cajca23.fa vigra24.fa; mummerplot -p cajca23_vigra24 --png cajca23_vigra24.delta; sed -i 's/ png.*/ pngcairo/' cajca23_vigra24.gp;	sed -i '/set mouse clipboardformat/d' cajca23_vigra24.gp; gnuplot	cajca23_vigra24.gp
nucmer -c 100 -p vigra24_vigun25 vigra24.fa vigun25.fa; mummerplot -p vigra24_vigun25 --png vigra24_vigun25.delta; sed -i 's/ png.*/ pngcairo/' vigra24_vigun25.gp;	sed -i '/set mouse clipboardformat/d' vigra24_vigun25.gp; gnuplot	vigra24_vigun25.gp
nucmer -c 100 -p vigun25_phavu26 vigun25.fa phavu26.fa; mummerplot -p vigun25_phavu26 --png vigun25_phavu26.delta; sed -i 's/ png.*/ pngcairo/' vigun25_phavu26.gp;	sed -i '/set mouse clipboardformat/d' vigun25_phavu26.gp; gnuplot	vigun25_phavu26.gp
nucmer -c 100 -p phavu26_phalu27 phavu26.fa phalu27.fa; mummerplot -p phavu26_phalu27 --png phavu26_phalu27.delta; sed -i 's/ png.*/ pngcairo/' phavu26_phalu27.gp;	sed -i '/set mouse clipboardformat/d' phavu26_phalu27.gp; gnuplot	phavu26_phalu27.gp
nucmer -c 100 -p phalu27_vigan28 phalu27.fa vigan28.fa; mummerplot -p phalu27_vigan28 --png phalu27_vigan28.delta; sed -i 's/ png.*/ pngcairo/' phalu27_vigan28.gp;	sed -i '/set mouse clipboardformat/d' phalu27_vigan28.gp; gnuplot	phalu27_vigan28.gp
nucmer -c 100 -p vigan28_glyma29 vigan28.fa glyma29.fa; mummerplot -p vigan28_glyma29 --png vigan28_glyma29.delta; sed -i 's/ png.*/ pngcairo/' vigan28_glyma29.gp;	sed -i '/set mouse clipboardformat/d' vigan28_glyma29.gp; gnuplot	vigan28_glyma29.gp
nucmer -c 100 -p glyma29_glyso30 glyma29.fa glyso30.fa; mummerplot -p glyma29_glyso30 --png glyma29_glyso30.delta; sed -i 's/ png.*/ pngcairo/' glyma29_glyso30.gp;	sed -i '/set mouse clipboardformat/d' glyma29_glyso30.gp; gnuplot	glyma29_glyso30.gp
nucmer -c 100 -p glyso30_vigun31 glyso30.fa vigun31.fa; mummerplot -p glyso30_vigun31 --png glyso30_vigun31.delta; sed -i 's/ png.*/ pngcairo/' glyso30_vigun31.gp;	sed -i '/set mouse clipboardformat/d' glyso30_vigun31.gp; gnuplot	glyso30_vigun31.gp
nucmer -c 100 -p vigun31_vigan32 vigun31.fa vigan32.fa; mummerplot -p vigun31_vigan32 --png vigun31_vigan32.delta; sed -i 's/ png.*/ pngcairo/' vigun31_vigan32.gp;	sed -i '/set mouse clipboardformat/d' vigun31_vigan32.gp; gnuplot	vigun31_vigan32.gp
nucmer -c 100 -p vigan32_glyma33 vigan32.fa glyma33.fa; mummerplot -p vigan32_glyma33 --png vigan32_glyma33.delta; sed -i 's/ png.*/ pngcairo/' vigan32_glyma33.gp;	sed -i '/set mouse clipboardformat/d' vigan32_glyma33.gp; gnuplot	vigan32_glyma33.gp
nucmer -c 100 -p glyma33_lotja34 glyma33.fa lotja34.fa; mummerplot -p glyma33_lotja34 --png glyma33_lotja34.delta; sed -i 's/ png.*/ pngcairo/' glyma33_lotja34.gp;	sed -i '/set mouse clipboardformat/d' glyma33_lotja34.gp; gnuplot	glyma33_lotja34.gp
nucmer -c 100 -p lotja34_lotja35 lotja34.fa lotja35.fa; mummerplot -p lotja34_lotja35 --png lotja34_lotja35.delta; sed -i 's/ png.*/ pngcairo/' lotja34_lotja35.gp;	sed -i '/set mouse clipboardformat/d' lotja34_lotja35.gp; gnuplot	lotja34_lotja35.gp
nucmer -c 100 -p lotja35_medtr36 lotja35.fa medtr36.fa; mummerplot -p lotja35_medtr36 --png lotja35_medtr36.delta; sed -i 's/ png.*/ pngcairo/' lotja35_medtr36.gp; sed -i '/set mouse clipboardformat/d'	lotja35_medtr36.gp; gnuplot	lotja35_medtr36.gp
