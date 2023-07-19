gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c

grdcut etopo2.grd -R70/135/10/55 -Gnew.grd
grdgradient new.grd -A90 -Ne0.8 -M -Gnew.grd.int
grdimage new.grd -R -JM15 -Ba10f5g10/a10f5g10:."中国地形图":neWS -Inew.grd.int -CGMT_globe.cpt -Xc -Yc -K>plot2.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -O -K >> plot2.ps
psscale -CGMT_globe.cpt -D7.4/-1/15/0.2h -B2000:"高程":/1000:"m": -O>>plot2.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot2.ps -Tg -P