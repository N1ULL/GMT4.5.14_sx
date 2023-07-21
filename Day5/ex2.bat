gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.1c
gmtset LABEL_FONT 38
gmtset LABEL_OFFSET 0.1c
gmtset LABEL_FONT_SIZE 17P

rem ��ɫ��
grd2cpt etopo1.grd -CGMT_gray.cpt -S-15000/-5000/1000 -D -Z >New_gray.cpt

grdcut etopo1.grd -R70/135/10/55 -Gnew2.grd
grdgradient new2.grd -A90 -Ne0.8 -M -Gnew2.grd.int
grdimage new2.grd -R -JM16 -Ba5f1g5/a5f1g5:."�й���½P���ٶȷֲ�ͼ":neWS -Inew2.grd.int -CNew_gray.cpt -Xc -Yc -K>plot1.ps

rem ���ٶ���
surface Z_vp0.txt -R -I1m -Ll4.0 -Lu6.0 -GZ_vp0.grd
grd2cpt Z_vp0.grd -CGMT_seis.cpt -S4.3/5.2/0.01 >Z_vp0.cpt
psclip cn00_003.lb -J -R -O -K >> plot1.ps
grdimage Z_vp0.grd -R -J -B -CZ_vp0.cpt -Inew2.grd.int -O -K >> plot1.ps
psclip -C -O -K >> plot1.ps
psscale -CZ_vp0.cpt -D8/-1/16/0.2h -B0.2:"P���ٶ�":/0.2:"Km/s": -O>>plot1.ps


ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot1.ps -Tg -P