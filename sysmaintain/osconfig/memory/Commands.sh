sudo sysctl -w vm.nr_hugepages=40960
sudo mkdir /mnt/huge
sudo mount -t hugetlbfs nodev /mnt/huge
