gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

rem 左下
rem 改色标
grd2cpt etopo1.grd -CGMT_gray.cpt -S-15000/-5000/1000 -D -Z >New_gray.cpt

grdgradient etopo1.grd -A90 -Ne0.8 -M -Getopo1.grd.int
grdimage etopo1.grd -R70/10/145/55r -JB100/34/10/60/6c -Ba10/a10:."中国大陆20Km深度P波速度分布图":neWS -Ietopo1.grd.int -CNew_gray.cpt -X2 -Y3 -K>plot.ps

rem 改速度条
surface Z_vp20.txt -R -I1m -Ll4.0 -Lu7.6 -GZ_vp20.grd
grd2cpt Z_vp20.grd -CGMT_seis.cpt -S5.0/7.6/0.01 >Z_vp20.cpt
psclip cn00_003.lb -J -R -O -K >> plot.ps
grdimage Z_vp20.grd -R -J -B -CZ_vp20.cpt -Ietopo1.grd.int -O -K >> plot.ps
psclip -C -O -K >> plot.ps
psscale -CZ_vp20.cpt -D3/-1/6/0.2h -B0.5:"P波速度":/0.2:"km/s": -O -K >>plot.ps
rem 断层、震中
psxy -R -J china_fault.dat -W0.2p,black -M -O -K>>plot.ps
gawk "{if($4>4) print $2,$1}" China_earthquake.txt | psxy -R -J -Sc0.05 -W0.05p/255/0/0 -G0/0/0 -M -O -K >>plot.ps
rem 图例
echo 50 50 | psxy -R -J -Sc0.05 -W1p/255/0/0 -G0/0/0 -M -O -K>> plot.ps

echo 51 51 10 0 38 LM 震中 >temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O -K>> plot.ps
del temp

rem 左上
rem 改色标
grdgradient etopo1.grd -A90 -Ne0.8 -M -Getopo1.grd.int
grdimage etopo1.grd -R70/10/145/55r -JB100/34/10/60/6c -Ba10/a10:."中国大陆10Km深度P波速度分布图":neWS -Ietopo1.grd.int -CNew_gray.cpt -Y10 -K -O>>plot.ps

rem 改速度条
surface Z_vp10.txt -R -I1m -Ll5.0 -Lu6.4 -GZ_vp10.grd
grd2cpt Z_vp10.grd -CGMT_seis.cpt -S5.0/6.4/0.01 >Z_vp10.cpt
psclip cn00_003.lb -J -R -O -K >> plot.ps
grdimage Z_vp10.grd -R -J -B -CZ_vp10.cpt -Ietopo1.grd.int -O -K >> plot.ps
psclip -C -O -K >> plot.ps
psscale -CZ_vp10.cpt -D3/-1/6/0.2h -B0.5:"P波速度":/0.2:"km/s": -O -K >>plot.ps
rem 断层、震中
psxy -R -J china_fault.dat -W0.2p,black -M -O -K>>plot.ps
gawk "{if($4>4) print $2,$1}" China_earthquake.txt | psxy -R -J -Sc0.05 -W0.05p/255/0/0 -G0/0/0 -M -O -K >>plot.ps
rem 图例
echo 50 50 | psxy -R -J -Sc0.05 -W1p/255/0/0 -G0/0/0 -M -O -K>> plot.ps

echo 51 51 10 0 38 LM 震中 >temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O -K>> plot.ps
del temp

rem 右上
rem 改色标
grdgradient etopo1.grd -A90 -Ne0.8 -M -Getopo1.grd.int
grdimage etopo1.grd -R70/10/145/55r -JB100/34/10/60/6c -Ba10/a10:."中国大陆10Km深度S波速度及震源机制分布图":neWS -Ietopo1.grd.int -CNew_gray.cpt -X11 -K -O>>plot.ps

rem 改速度条
surface Z_vs10.txt -R -I1m -Ll3.0 -Lu3.8 -GZ_vs10.grd
grd2cpt Z_vs10.grd -CGMT_seis.cpt -S3.0/3.8/0.01 >Z_vs10.cpt
psclip cn00_003.lb -J -R -O -K >> plot.ps
grdimage Z_vs10.grd -R -J -B -CZ_vs10.cpt -Ietopo1.grd.int -O -K >> plot.ps
psclip -C -O -K >> plot.ps
psscale -CZ_vs10.cpt -D3/-1/6/0.2h -B0.2:"S波速度":/0.2:"km/s": -O -K >>plot.ps
rem 断层、震源机制解
psxy -R -J china_fault.dat -W0.2p,black -M -O -K>>plot.ps
rem 正
gawk "{ if($10>4 && $17>=40 && $17<52 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gred -O -K>>plot.ps
gawk "{ if($10>4 && $17>=52 && $21<35) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gred -O -K>>plot.ps

rem 走滑
gawk "{ if($10>4 && $17<40 && $19>45 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Ggreen -O -K>>plot.ps
gawk "{ if($10>4 && $17<20 && $19>45 && $21<40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Ggreen -O -K>>plot.ps

rem 逆
gawk "{ if($10>4 && $17<20 && $21<52 && $21>40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gblue -O -K>>plot.ps
gawk "{ if($10>4 && $17<35 && $21>=52) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gblue -O -K>>plot.ps

rem 图例
echo 50.5 50.5 1 0 45 -90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gred -O -K >> plot.ps
echo 55.5 45.5 2 0 45 90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gblue -K -O >> plot.ps
echo 60.5 40.5 3 0 90 180 6 0 0 | psmeca -R -J -L -Sa0.5 -Ggreen -O -K >> plot.ps

echo 51.5 51.5 10 0 38 LM 正断 >temp
echo 56.5 46.5 10 0 38 LM 逆断 >>temp
echo 61.5 41.5 10 0 38 LM 走滑 >>temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O -K >> plot.ps
del temp

rem 右下
rem 改色标
grdgradient etopo1.grd -A90 -Ne0.8 -M -Getopo1.grd.int
grdimage etopo1.grd -R70/10/145/55r -JB100/34/10/60/6c -Ba10/a10:."中国大陆20Km深度S波速度及震源机制分布图":neWS -Ietopo1.grd.int -CNew_gray.cpt -Y-10 -K -O>>plot.ps

rem 改速度条
surface Z_vs20.txt -R -I1m -Ll3.1 -Lu4.6 -GZ_vs20.grd
grd2cpt Z_vs20.grd -CGMT_seis.cpt -S3.1/4.6/0.01 >Z_vs20.cpt
psclip cn00_003.lb -J -R -O -K >> plot.ps
grdimage Z_vs20.grd -R -J -B -CZ_vs20.cpt -Ietopo1.grd.int -O -K >> plot.ps
psclip -C -O -K >> plot.ps
psscale -CZ_vs20.cpt -D3/-1/6/0.2h -B0.2:"S波速度":/0.2:"km/s": -O -K >>plot.ps
rem 断层、震源机制解
psxy -R -J china_fault.dat -W0.2p,black -M -O -K>>plot.ps
rem 正
gawk "{ if($10>4 && $17>=40 && $17<52 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gred -O -K>>plot.ps
gawk "{ if($10>4 && $17>=52 && $21<35) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gred -O -K>>plot.ps

rem 走滑
gawk "{ if($10>4 && $17<40 && $19>45 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Ggreen -O -K>>plot.ps
gawk "{ if($10>4 && $17<20 && $19>45 && $21<40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Ggreen -O -K>>plot.ps

rem 逆
gawk "{ if($10>4 && $17<20 && $21<52 && $21>40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gblue -O -K>>plot.ps
gawk "{ if($10>4 && $17<35 && $21>=52) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -L -Sa5p -Gblue -O -K>>plot.ps

rem 图例
echo 50.5 50.5 1 0 45 -90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gred -O -K >> plot.ps
echo 55.5 45.5 2 0 45 90 6 0 0 | psmeca -R -J -L -Sa0.5 -Gblue -K -O >> plot.ps
echo 60.5 40.5 3 0 90 180 6 0 0 | psmeca -R -J -L -Sa0.5 -Ggreen -O -K >> plot.ps

echo 51.5 51.5 10 0 38 LM 正断 >temp
echo 56.5 46.5 10 0 38 LM 逆断 >>temp
echo 61.5 41.5 10 0 38 LM 走滑 >>temp
pstext temp -R -J -W255/255/255 -G0/0/0 -O>> plot.ps
del temp
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot.ps -Tg -P