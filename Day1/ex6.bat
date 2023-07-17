psbasemap -R0/100/0/10 -JX10/10 -Ba20f10:"X":/a2f1:."EX4"::"Y":neWS -Xc -Y2 -P -K>plot5.ps
psbasemap -R0/100/0/10 -JX10/10 -Ba20f10:"X":/a2f1:."EX4"::"Y":neWS -Y15 -P -O>>plot5.ps
ps2raster plot5.ps -Tg -A -P