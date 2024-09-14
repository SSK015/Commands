#!/bin/bash

while true; do
    cat /proc/cpuinfo | grep -i "mhz"
    echo "elapsed"
    sleep 1
done
