gawk "{print $3}" China_earthquake.txt | pshistogram -R0/40/0/300000 -JX9/9 -Ba10f2:,"Km":/100000:."Deep":WS -Z0 -G0/0/0 -W1 -Yc -X3 -K>plot5.ps
gawk "{print $4}" China_earthquake.txt | pshistogram -R0/7/0/220000 -J -Ba1/20000:."M":WS -Z0 -G0/0/0 -W0.5 -X13 -O >>plot5.ps
ps2raster plot5.ps -Tg -A -P