#!/bin/bash

grep IP /home/graph_dump/created/traffic_host | grep id |awk '{print $8,$1}' | tr "," " " > /home/graph_dump/created/traffic_host_1
grep IP /home/graph_dump/created/traffic_server | grep id |awk '{print $8,$1}' | tr "," " " > /home/graph_dump/created/traffic_server_1
sort /home/graph_dump/created/traffic_host_1 > /home/graph_dump/created/traffic_host_1_sorted
sort /home/graph_dump/created/traffic_server_1 > /home/graph_dump/created/trafico_server_1_sorted
join /home/graph_dump/created/traffic_server_1_sorted /home/graph_dump/created/traffic_host_1_sorted > /home/graph_dump/created/combined
nl /home/graph_dump/created/combined | awk '{if ($1 > 1 ) {print $1, sqrt(($4-$3)*($4-$3))}}' > /home/graph_dump/created/delay.txt

gnuplot -p "delay.plt"
