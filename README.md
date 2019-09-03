# GraphDump
Software that calculates and plot Throughput, Delay and other metrics from a tcpdump script.

Dependencies (most come installed in Unix): Python, Perl, AWK, Grep, Sed, GNUPlot, Sort, Join. 

Run the program with:
python graphdump.py

The tcpdump file must be created following (at least) these commands: -nn -v -tt

Example:
tcpdump -i h1-eth0 -nn -v -tt > /home/graph_dump/created/traffic_host
