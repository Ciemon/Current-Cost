#!/bin/sh
# for cron, change to the mqtt directory
cd ~/mqtt


#build the graphs
rrdtool graph ~/mqtt/graphs/power-10min-l.png \
--start end-10m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "10 minutes" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-10min-l.png \
--start end-10m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "10 minutes" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average" 

rrdtool graph ~/mqtt/graphs/power-60min-l.png \
--start end-60m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "60 minutes" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-60min-l.png \
--start end-60m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "60 minutes" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average" 

rrdtool graph ~/mqtt/graphs/power-6h-l.png \
--start end-360m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "6 Hours" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-6h-l.png \
--start end-360m --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "6 Hours" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average" 

rrdtool graph ~/mqtt/graphs/power-1day-l.png \
--start end-1d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "24 Hours" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-1day-l.png \
--start end-1d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "1 day" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average"

rrdtool graph ~/mqtt/graphs/power-7day-l.png \
--start end-7d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
--title "7 Days" \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-7day-l.png \
--start end-7d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "7 Days" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average"

rrdtool graph ~/mqtt/graphs/power-30day-l.png \
--start end-30d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "30 Days" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-30day-l.png \
--start end-30d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "30 Days" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average"

rrdtool graph ~/mqtt/graphs/power-365day-l.png \
--start end-365d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Watts --lower-limit 0 \
--alt-autoscale-max \
--title "1 Year" \
DEF:Power=powertemp.rrd:Power:AVERAGE \
DEF:PowerMin=powertemp.rrd:Power:MIN \
DEF:PowerMax=powertemp.rrd:Power:MAX \
CDEF:PowerRange=PowerMax,PowerMin,- \
LINE1:PowerMin: \
AREA:PowerRange#0000FF11:"Error Range":STACK \
LINE1:PowerMin#0000FF33:"Min" \
LINE1:PowerMax#0000FF33:"Max" \
LINE1:Power#0000FF:"Average"

rrdtool graph ~/mqtt/graphs/temp-1year-l.png \
--start end-365d --width 1100 --end now --slope-mode \
--no-legend --vertical-label Temperature --lower-limit 0 \
--alt-autoscale-max \
--title "1 Year" \
DEF:Temp=powertemp.rrd:Temperature:AVERAGE \
DEF:TempMin=powertemp.rrd:Temperature:MIN \
DEF:TempMax=powertemp.rrd:Temperature:MAX \
CDEF:TempRange=TempMax,TempMin,- \
LINE1:TempMin: \
AREA:TempRange#ff00FF11:"Error Range":STACK \
LINE1:TempMin#ff00FF33:"Min" \
LINE1:TempMax#ff00FF33:"Max" \
LINE1:Temp#ff00FF:"Average"

#upload to the server
scp graphs/* ciemon@waitingcloud.org:/home/ciemon/house/
