psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">2 0-10": -X3 -Y2 -K> plot2.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot2.ps
gawk "{if($4>2 && $3<10) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K>>plot2.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">4 0-10": -Y10 -K -O>> plot2.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot2.ps
gawk "{if($4>4&& $3<10) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K>>plot2.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">2 10-20": -X14 -K -O>> plot2.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot2.ps
gawk "{if($4>2 && $3>10 && $3<20) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O -K >>plot2.ps

psbasemap -R70/135/10/55 -JM7 -Ba10f5/a10f5:.">4 10-20": -Y-10 -K -O>> plot2.ps
pscoast -R70/135/10/55 -JM7 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot2.ps
gawk "{if($4>4 && $3>10 && $3<20) print $2,$1}" China_earthquake.txt | psxy -R70/135/10/55 -JM7 -Sc0.05 -W0.05p,/255/0/0 -G255/0/0 -M -O>>plot2.ps

ps2raster plot2.ps -Tg -A -P
