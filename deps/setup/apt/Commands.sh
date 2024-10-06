#!/bin/bash

. $HOME/.zshrc

sudo apt update
sai


sudo apt install <-y>
sau
# basic utils
sai curl htop python3 build-essential gcc-9 gcc-13 autotools-dev automake python-pip numactl gdb fail2ban dkms libc6-dev gfortran
# compilation utils
sai ccache cmake libgtest-dev bison gcc-7 gcc-4.8
# hardware utils
sai hwinfo 
# management
sai rpm xauth

# dev tools
sai cloc tree tldr libz-dev bash-builtins bear neofetch autojump minicom

sai libcrypto++-dev libcrypto++-doc libcrypto++-utils libsnappy-dev libssl-dev

sai libjemalloc-dev libboost-all-dev

sai libsgutils2-dev

# virt toolkit
sai qemu qemu-kvm virt-manager bridge-utils

# profile
sai papi-tools libpapi-dev

# cpu toolkit
sai cpufrequtils intel-cmt-cat msr-tools

# ib toolkit
sai apt install libtbb-dev perftest infiniband-diags libpci-dev 

# ethernet
sai netplan.io

# benchmark
sai sysbench

# mpi
sai openmpi-bin openmpi-doc libopenmpi-dev

# visualization
sai lolcat catimg

# math
sai libopenblas-dev


sudo apt remove <-y>