gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

grdcut topo30.grd -R80/90/40/50 -Gnew1.grd
grdgradient new1.grd -A90 -Ne0.8 -M -Gnew1.grd.int
grdimage new1.grd -R -JM10 -Ba5f1g1/a5f1g1:."天山地形图":neWS -Inew1.grd.int -CGMT_globe.cpt -Xc -Y3 -K>plot3.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -O -K >> plot3.ps
psscale -CGMT_globe.cpt -D5/-1/10/0.2h -B3500:"高程":/1000:"m": -O>>plot3.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot3.ps -Tg -P