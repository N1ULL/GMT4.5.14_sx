psbasemap -R70/135/10/55 -JM18 -Ba10f5/a10f5:."China Map": -Xc -Yc -K> plot6.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot6.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot6.ps
gawk "{print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O>>plot6.ps
ps2raster plot6.ps -Tg -A -P