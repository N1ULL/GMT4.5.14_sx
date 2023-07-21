gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

psbasemap -R70/10/140/55r -JB105/34/10/60/15c -Ba10f5/a10f5:."ÖÐ¹úµØÍ¼": -Xc -Yc -K> plot3.ps
pscoast -R -J -N1/0.5p,black -W1/0.5p,blue -I1/0.5p,gold -SROYALBLUE -G255/185/230 -CROYALBLUE -O >>plot3.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot3.ps -Tg -P