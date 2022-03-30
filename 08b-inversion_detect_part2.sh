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
