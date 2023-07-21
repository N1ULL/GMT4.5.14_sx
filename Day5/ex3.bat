gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

rem 改色标
grd2cpt etopo1.grd -CGMT_gray.cpt -S-15000/-5000/1000 -D -Z >New_gray.cpt

grdcut etopo1.grd -R70/135/10/55 -Gnew2.grd
grdgradient new2.grd -A90 -Ne0.8 -M -Gnew2.grd.int
grdimage new2.grd -R -JM10 -Ba5f1g5/a5f1g5:."中国大陆P波速度分布图":neWS -Inew2.grd.int -CNew_gray.cpt -X4 -Y5 -K>plot2.ps

rem 改速度条
surface Z_vp0.txt -R -I1m -Ll4.0 -Lu6.0 -GZ_vp0.grd
grd2cpt Z_vp0.grd -CGMT_seis.cpt -S4.3/5.2/0.01 >Z_vp0.cpt
psclip cn00_003.lb -J -R -O -K >> plot2.ps
grdimage Z_vp0.grd -R -J -B -CZ_vp0.cpt -Inew2.grd.int -O -K >> plot2.ps
psclip -C -O -K >> plot2.ps
psscale -CZ_vp0.cpt -D5/-1/10/0.2h -B0.2:"P波速度":/0.2:"km/s": -O -K>>plot2.ps

rem 改色标
grd2cpt etopo1.grd -CGMT_gray.cpt -S-15000/-5000/1000 -D -Z >New_gray.cpt

grdcut etopo1.grd -R70/135/10/55 -Gnew2.grd
grdgradient new2.grd -A90 -Ne0.8 -M -Gnew2.grd.int
grdimage new2.grd -R -JM10 -Ba5f1g5/a5f1g5:."中国大陆S波速度分布图":neWS -Inew2.grd.int -CNew_gray.cpt -X14 -K -O >>plot2.ps

rem 改速度条
surface Z_vs0.txt -R -I1m -Ll2.5 -Lu3.1 -GZ_vs0.grd
grd2cpt Z_vs0.grd -CGMT_seis.cpt -S2.5/3.1/0.01 >Z_vs0.cpt
psclip cn00_003.lb -J -R -O -K >> plot2.ps
grdimage Z_vs0.grd -R -J -B -CZ_vs0.cpt -Inew2.grd.int -O -K >> plot2.ps
psclip -C -O -K >> plot2.ps
psscale -CZ_vs0.cpt -D5/-1/10/0.2h -B0.2:"S波速度":/0.2:"km/s": -O>>plot2.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot2.ps -Tg -P