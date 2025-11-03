sudo sysctl -w vm.nr_hugepages=40960
sudo mkdir /mnt/huge
sudo mount -t hugetlbfs nodev /mnt/huge

# modify the hugepage size
hugepage_size_2MB=40000
echo $hugepage_size_2MB > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages