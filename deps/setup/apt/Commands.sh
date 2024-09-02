#!/bin/bash

. $HOME/.zshrc

sudo apt update
sai


sudo apt install <-y>
sau 
# basic utils
sai curl htop python3 build-essential gcc-9 gcc-13 autotools-dev automake python-pip numactl gdb fail2ban dkms
# compilation utils
sai ccache cmake libgtest-dev bison

# dev tools
sai cloc tree tldr libz-dev bash-builtins bear

sai libcrypto++-dev libcrypto++-doc libcrypto++-utils libsnappy-dev libssl-dev

sai libjemalloc-dev libboost-all-dev

# virt toolkit
sai qemu qemu-kvm virt-manager bridge-utils

# profile
sai papi-tools libpapi-dev

# cpu toolkit
sai cpufrequtils intel-cmt-cat

# ib toolkit
sai apt install libtbb-dev perftest infiniband-diags libpci-dev 

# ethernet
sai netplan.io

# benchmark


sudo apt remove <-y>