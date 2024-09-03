#!/bin/bash

# Configure turbo boost for all cores
# @param1: disable | enable

if [[ -z $(which rdmsr) ]]; then
    echo "msr-tools is not installed." >&2
    echo "Run 'sudo apt-get install msr-tools' to install it." >&2
    exit 1
fi

if [[ ! -z $1 && $1 != "enable" && $1 != "disable" ]]; then
    echo "turbo-boost.sh invalid argument: $1" >&2
    echo ""
    echo "Usage: $(basename $0) [disable|enable]"
    exit 1
fi

sudo modprobe msr

# For all cores
if [[ $1 == "disable" ]]; then
    sudo wrmsr -a 0x1a0 0x4000850089
fi
if [[ $1 == "enable" ]]; then
    sudo wrmsr -a 0x1a0 0x850089
fi
state=$(sudo rdmsr -p5 0x1a0 -f 38:38)
if [[ $state -eq 1 ]]; then
    echo "CPU5 turbo boost: disabled"
else
    echo "CPU5 turbo boost: enabled"
fi

# For specific cores
#cores=$(cat /proc/cpuinfo | grep processor | awk '{print $3}')
#for core in $cores;
#do
#  if [[ $1 == "disable" ]]; then
#    sudo wrmsr -p${core} 0x1a0 0x4000850089
#  fi
#  if [[ $1 == "enable" ]]; then
#    sudo wrmsr -p${core} 0x1a0 0x850089
#  fi
#  state=$(sudo rdmsr -p${core} 0x1a0 -f 38:38)
#  if [[ $state -eq 1 ]]; then
#    echo "core ${core}: disabled"
#  else
#    echo "core ${core}: enabled"
#  fi
#done
