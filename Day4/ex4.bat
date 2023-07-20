gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

rem 改色标
grd2cpt topo30.grd -CGMT_gray.cpt -S-15000/10000/1000 -D -Z >New_gray.cpt

grdcut topo30.grd -R80/90/40/50 -Gnew2.grd
grdgradient new2.grd -A90 -Ne0.8 -M -Gnew2.grd.int
grdimage new2.grd -R -JM12 -Ba5f1g5/a5f1g5:."天山GPS位移图":neWS -Inew2.grd.int -CNew_gray.cpt -Xc -Yc -K>plot3.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -O -K>> plot3.ps

rem GPS位移
gawk "{print $1,$2,$3,$4,$5,$6}" gps_campagin.txt | psvelo -Se0.2/0.95/0.5 -Gred -R -J -O -K >>plot3.ps
gawk "{print $1,$2,$3,$4,$5,$6}" gps_continuous.txt | psvelo -Se0.2/0.95/0.5 -Gblue -R -J -O -K >>plot3.ps

rem 图例
echo 80 49.5 5 0 0.5 0.5 | psvelo -Se0.3/0.95/0.5 -Gred -R -J -O -K >> plot3.ps
echo 80 49 5 0 0.5 0.5 | psvelo -Se0.3/0.95/0.5 -Gblue -R -J -O -K >> plot3.ps

echo 82 49.5 10 0 38 LM 流动 >temp
echo 82 49 10 0 38 LM 台站 >>temp
echo 80.5 48.5 10 0 4 LM 50\2615mm/a >>temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O>> plot3.ps
del temp

ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot3.ps -Tg -P