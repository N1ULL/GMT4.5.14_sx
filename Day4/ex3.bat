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
grdimage new2.grd -R -JM16 -Ba10f5g10/a10f5g10:."中国地形图":neWS -Inew2.grd.int -CNew_gray.cpt -Xc -Yc -K>plot2.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -O -K >> plot2.ps

rem 断层
psxy china_fault.dat -R -J -W0.5p,blue -M -O -K>>plot2.ps

rem 正
gawk "{ if($17>=40 && $17<52 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -Ba10f5/a10f5 -Sa8p -Gred -O -K>>plot2.ps
gawk "{ if($17>=52 && $21<35) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O -K>>plot2.ps

rem 走滑
gawk "{ if($17<40 && $19>45 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Ggreen -O -K>>plot2.ps
gawk "{ if($17<20 && $19>45 && $21<40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Ggreen -O -K>>plot2.ps

rem 逆
gawk "{ if($17<20 && $21<52 && $21>40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gblue -O -K>>plot2.ps
gawk "{ if($17<35 && $21>=52) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gblue -O -K>>plot2.ps

rem 图例
echo 130 12 1 0 45 -90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gred -O -K >> plot2.ps
echo 130 16 2 0 45 90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gblue -K -O >> plot2.ps
echo 130 21 3 0 90 180 6 0 0 | psmeca -R -J -L -Sa0.5 -Ggreen -O -K >> plot2.ps

echo 132 12 10 0 38 LM 正断 >temp
echo 132 16 10 0 38 LM 逆断 >>temp
echo 132 21 10 0 38 LM 走滑 >>temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O>> plot2.ps
del temp
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot2.ps -Tg -P