# squidscanner
Script which checks ports (nmap top 100) on a target that is using a squid proxy on port 3128. 

Usage: `./squidscanner.sh <proxy_address> [proxy_port]`

This script requires a proxy address, but it will use port 3128 as a proxy_port by default, as that is the default port for squid. 

Ports are taken from [here](https://nullsec.us/top-1-000-tcp-and-udp-ports-nmap-default/), you will need to manually add them if you want to use more/less. 
