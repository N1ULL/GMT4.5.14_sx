psbasemap -R70/135/10/55 -JM17 -Ba10f5/a10f5:."China Map": -Xc -Yc -K > plot7.ps
pscoast -R70/135/10/55 -JM17 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot7.ps
psxy -R70/135/10/55 -JM17 China_earthquake.txt -Sc0.01 -W0.5p/255/0/0 -G0/0/0 -: -M -O >>plot7.ps
ps2raster plot7.ps -Tg -A -P