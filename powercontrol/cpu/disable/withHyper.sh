#!/bin/bash

total_cpus=$(nproc --all)

# 计算 25%-50% 和 75%-100% 范围内的 CPU 核心
quarter=$((total_cpus / 4))
half=$((total_cpus / 2))
three_quarters=$((3 * total_cpus / 4))

echo "Total CPUs: $total_cpus"
echo "Offline CPUs: $quarter-$(($half - 1)) and $three_quarters-$(($total_cpus - 1))"


for ((i = quarter; i < half; i++)); do
        # echo "1" | sudo tee /sys/devices/system/cpu/cpu$i/online
        # echo $i
        echo "CPU $i set to offline."
    else
        echo "CPU $i does not exist or cannot be set offline."
    fi
done

# 禁用 75%-100% 范围的 CPU 核心
for ((i = three_quarters; i < total_cpus; i++)); do
    if [ -f /sys/devices/system/cpu/cpu$i/online ]; then
        echo "0" | sudo tee /sys/devices/system/cpu/cpu$i/online
        # echo "1" | sudo tee /sys/devices/system/cpu/cpu$i/online
        # echo $i
        echo "CPU $i set to offline."
    else
        echo "CPU $i does not exist or cannot be set offline."
    fi
done

echo "Script completed."
