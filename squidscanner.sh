#!/bin/bash

# Check if the proxy address is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <proxy_address> [proxy_port]"
    exit 1
fi

# Set the proxy address and port
proxy_address="$1"
proxy_port="${2:-3128}"  # Default to 3128 if not provided

# Target IP
target_ip="192.168.x.x"

# Expanded ports from the provided list with ranges
ports=(
    {7,9,13,21,22,23,25,26,37,53,79,80,88,106,110,111,113,119,135,139,143,144,179,199,389,427,443,444,465,513,514,515,543,544,548,554,587,631,646,873,990,993,995,1025,1026,1027,1028,1029,1110,1433,1720,1723,1755,1900,2000,2001,2049,2121,2717,3000,3128,3306,3389,3986,4899,5000,5009,5051,5060,5101,5190,5357,5432,5631,5666,5800,5900,6000,6001,6646,7070,8000,8008,8009,8080,8081,8443,8888,9100,9999,10000,32768,49152,49153,49154,49155,49156,49157}
)

# Loop over ports
for port in "${ports[@]}"; do
    # Make a request using curl with the proxy, and save the response and status code
    response=$(curl -s -o /dev/null -w "%{http_code}" --proxy "$proxy_address:$proxy_port" "$target_ip:$port")

    # Check if the status code is 200
    if [ "$response" -eq 200 ]; then
        echo "Response from $target_ip:$port with status code $response"
    fi
done
