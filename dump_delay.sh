#!/bin/bash

grep IP /home/gabriel/graph_dump/created/trafico_host | grep id |awk '{print $8,$1}' | tr "," " " > /home/gabriel/graph_dump/created/trafico_host_1
grep IP /home/gabriel/graph_dump/created/trafico_server | grep id |awk '{print $8,$1}' | tr "," " " > /home/gabriel/graph_dump/created/trafico_server_1
sort /home/gabriel/graph_dump/created/trafico_host_1 > /home/gabriel/graph_dump/created/trafico_host_1_ordenado
sort /home/gabriel/graph_dump/created/trafico_server_1 > /home/gabriel/graph_dump/created/trafico_server_1_ordenado
join /home/gabriel/graph_dump/created/trafico_server_1_ordenado /home/gabriel/graph_dump/created/trafico_host_1_ordenado > /home/gabriel/graph_dump/created/combinado
nl /home/gabriel/graph_dump/created/combinado | awk '{if ($1 > 1 ) {print $1, sqrt(($4-$3)*($4-$3))}}' > /home/gabriel/graph_dump/created/delay.txt

gnuplot -p "delay.plt"
