gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 18P
gmtset HEADER_FONT 38
gawk "{if($4>4) print $2,$1}" China_earthquake.txt >new1.txt
gawk "{if($4<4 && $4>2) print $2,$1}" China_earthquake.txt >new2.txt
psbasemap -R70/135/10/55 -JM12 -Ba10f5/a10f5:."中国地图": -Xc -Y1 -P -K> plot.ps
pscoast -R70/135/10/55 -JM12 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot.ps
psxy -R70/135/10/55 -JM12 new1.txt -Sc0.05 -W0.05p/255/0/0 -G0/0/0 -M -O -K>>plot.ps
psbasemap -R70/135/10/55 -JM12 -Ba10f5/a10f5:."中国地图": -Y15 -P -K -O>> plot.ps
pscoast -R70/135/10/55 -JM12 -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot.ps
psxy -R70/135/10/55 -JM12 new2.txt -Sc0.05 -W0.05p/255/0/0 -G0/0/0 -M -O >>plot.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot.ps -Tg -P