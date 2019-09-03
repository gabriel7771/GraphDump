#!/bin/bash

grep IP /home/graph_dump/created/traffic | grep id |awk '{print $1,$17}' | tr "," " " > /home/graph_dump/created/traf_1
sed 's/)$//' /home/graph_dump/created/traf_1 > /home/graph_dump/created/traf_2
a=$(awk 'NR == 1 {print $1}' /home/graph_dump/created/traf_2)
awk -v c="${a}" '{print $1-c, $2}' /home/graph_dump/created/traf_2 > /home/graph_dump/created/traf_3
perl solo_th.pl /home/graph_dump/created/traf_3 1 > /home/graph_dump/created/solo_th.txt
gnuplot -p "trafico.plt"
