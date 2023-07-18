psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">2 0-10": -X3 -Y2 -K> plot3.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot3.ps
psxy -R70/135/10/55 -JM7 china_fault.dat -W0.2p,blue -M -O -K>>plot3.ps
gawk "{if($4>2 && $3<10) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K>>plot3.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">4 0-10": -Y10 -K -O>> plot3.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot3.ps
psxy -R70/135/10/55 -JM7 china_fault.dat -W0.2p,blue -M -O -K>>plot3.ps
gawk "{if($4>4&& $3<10) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K>>plot3.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">2 10-20": -X14 -K -O>> plot3.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot3.ps
psxy -R70/135/10/55 -JM7 china_fault.dat -W0.2p,blue -M -O -K>>plot3.ps
gawk "{if($4>2 && $3>10 && $3<20) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K >>plot3.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">4 10-20": -Y-10 -K -O>> plot3.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot3.ps
psxy -R70/135/10/55 -JM7 china_fault.dat -W0.2p,blue -M -O -K>>plot3.ps
gawk "{if($4>4 && $3>10 && $3<20) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O>>plot3.ps

ps2raster plot3.ps -Tg -A -P