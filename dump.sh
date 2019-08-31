#!/bin/bash

grep IP /home/gabriel/graph_dump/created/trafico | grep id |awk '{print $1,$17}' | tr "," " " > /home/gabriel/graph_dump/created/traf_1
sed 's/)$//' /home/gabriel/graph_dump/created/traf_1 > /home/gabriel/graph_dump/created/traf_2
a=$(awk 'NR == 1 {print $1}' /home/gabriel/graph_dump/created/traf_2)
awk -v c="${a}" '{print $1-c, $2}' /home/gabriel/graph_dump/created/traf_2 > /home/gabriel/graph_dump/created/traf_3



