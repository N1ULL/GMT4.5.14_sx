psbasemap -R70/135/10/55 -JM17 -Ba10f5/a10f5:."China Map": -Xc -Yc -K > plot6.ps
pscoast -R70/135/10/55 -JM17 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O >> plot6.ps
ps2raster plot6.ps -Tg -A -P