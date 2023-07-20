gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

rem 改色标
grd2cpt etopo2.grd -CGMT_gray.cpt -S-15000/-10000/1000 -D -Z >New_gray.cpt

grdcut etopo2.grd -R70/135/10/55 -Gnew2.grd
grdgradient new2.grd -A90 -Ne0.8 -M -Gnew2.grd.int
grdimage new2.grd -R -JM16 -Ba10f5g10/a10f5g10:."中国地形图":neWS -Inew2.grd.int -CNew_gray.cpt -Xc -Yc -K>plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -O -K >> plot1.ps
psscale -CNew_gray.cpt -D8/-1/15/0.2h -B5000:"高程":/1000:"m": -O -K>>plot1.ps

rem 断层
psxy china_fault.dat -R -J -W0.5p,blue -M -O>>plot1.ps

ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot1.ps -Tg -P