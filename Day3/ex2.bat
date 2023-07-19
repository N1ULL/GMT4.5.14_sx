gmtset BASEMAP_TYPE plain
gmtset HEADER_FONT_SIZE 17P
gmtset HEADER_FONT 38
gmtset HEADER_OFFSET 0.08c

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."Õý¶Ï¼æ×ß»¬Í¼":neWS -X2 -Y1 -P -K> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{ if($17>=40 && $17<52 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gblue -O -K>>plot1.ps

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."Õý¶ÏÍ¼":neWS -Y10 -P -O -K>> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{ if($17>=52 && $21<35) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gblue -O -K>>plot1.ps

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."ÖÐ¹úÕðÔ´»úÖÆ½âÍ¼":neWS -Y10 -P -O -K>> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O -K>>plot1.ps

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."×ß»¬Í¼":neWS -X10 -P -O -K>> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{ if($17<40 && $19>45 && $21<20) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O -K>>plot1.ps
gawk "{ if($17<20 && $19>45 && $21<40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O -K>>plot1.ps

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."Äæ¶Ï¼æ×ß»¬Í¼":neWS -Y-10 -P -O -K>> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{ if($17<20 && $21<52 && $21>40) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O -K>>plot1.ps

psbasemap -R70/135/10/55 -JM8 -Ba10f5/a10f5:."Äæ¶ÏÍ¼":neWS -Y-10 -P -O -K>> plot1.ps
pscoast -R -J -N1/0.5p,black -W1/1p,blue -SROYALBLUE -G255/185/230 -CROYALBLUE -O -K >> plot1.ps
psxy -R -J china_fault.dat -W0.2p,blue -M -O -K >>plot1.ps
gawk "{ if($17<35 && $21>=52) print $7,$8,$9,$11,$12,$13,$10,0,0}" China_fm.txt | psmeca -R -J -B -Sa8p -Gred -O>>plot1.ps
ps2raster -C-sFONTPATH="C:\Windows\Fonts" plot1.ps -Tg -P