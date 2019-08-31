#!/usr/bin/gnuplot -persist

set title "Throughput"
set xlabel "Tiempo (s)"
set ylabel "bits/s"

set xtics font ", 6"

plot "/home/gabriel/graph_dump/created/solo_th.txt" with linespoints
