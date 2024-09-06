#!/bin/bash

# Configure cpu frequency for all cores
# https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt
#
# @param1: enable | disable

# example: ./cpu-freq.sh enable 2801 2800

if [[ ! -z $1 && $1 != "enable" && $1 != "disable" ]]; then
    echo "cpu-freq.sh invalid argument: $1" >&2
    echo ""
    echo "Usage: $(basename $0) [disable|enable]"
    exit 1
fi

if [[ "$1" == "enable" ]]; then
    if [[ -z "$2" || -z "$3" ]]; then
        echo "Usage: $0 enable <max_cpu_freq(Mhz)> <min_cpu_freq(Mhz)>"
        exit 1
    fi
elif [[ "$1" == "disable" ]]; then
    if [[ -z "$2" || -z "$3" ]]; then
        echo "Usage: $0 disable <max_cpu_freq(Mhz)> <min_cpu_freq(Mhz)>"
        exit 1
    fi
fi

max_freq=$(expr $2 \* 1000)
min_freq=$(expr $2 \* 1000)

max_freq_default=2801000
max_freq_default_1=2800000
min_freq_default=1000000

if [[ -e /sys/devices/system/cpu/intel_pstate ]]; then
    echo "Error: userspace governor is unavailable with intel_pstate,"
    echo "please disable it in kernel cmdline with 'intel_pstate=disable'."
    exit 1
fi

cores=$(cat /proc/cpuinfo | grep processor | awk '{print $3}')

# Fix cpu frequency for experiment
if [[ $1 == "enable" ]]; then
    for i in $cores; do
        # 1. Enable userspace governor for acpi-cpufreq driver
        #    there is only performance and powersave govenors for intel_pstate driver
        #    disable it in kernel cmdline with "intel_pstate=disable".
        sudo sh -c "echo userspace > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
        # 2. Must set both of the max and min freq
        sudo sh -c "echo $max_freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq"
        sudo sh -c "echo $min_freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq"
    done
fi

# Recover to daily usage situation
if [[ $1 == "disable" ]]; then
    for i in $cores; do
        # 1. Enable userspace governor
        sudo sh -c "echo userspace > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
        # 2. Must set both of the max and min freq
        sudo sh -c "echo $max_freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq"
        sudo sh -c "echo $min_freq > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq"
        # 3. Enable ondemand governor
        sudo sh -c "echo ondemand > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
    done
fi

state=$(cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor)
echo "CPU5 freq governor: $state"
state=$(cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq)
echo "CPU5 freq max: $state"
state=$(cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq)
echo "CPU5 freq min: $state"
state=$(cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq)
echo "CPU5 freq cur: $state"
