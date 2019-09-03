#!/usr/bin/gnuplot -persist

set title "Delay"
set xlabel "Paquetes"
set ylabel "Delay (s)"

set xtics font ", 6"

plot "/home/graph_dump/created/delay.txt" with linespoints
