# GraphDump
Software that calculates and plot Throughput, Delay and other metrics from a tcpdump script.

Run program with:
python graphdump.py

The tcpdump file must be created following (at least) this commands: -nn -v -tt

Example:
tcpdump -i h1-eth0 -nn -v -tt > /home/gabriel/graph_dump/created/H265/trafico_host
