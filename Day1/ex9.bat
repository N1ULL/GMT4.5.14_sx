psbasemap -R105/120/30/42 -JM16 -Ba5f1/a10f1:."HuaBei Map": -Xc -Yc -K > plot8.ps
pscoast -R105/120/30/42 -JM16 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot8.ps
psxy -R105/120/30/42 -JM16 China_earthquake.txt -Sc0.05 -W0.5p/255/0/0 -G0/0/0 -: -M -O >>plot8.ps
ps2raster plot8.ps -Tg -A -P