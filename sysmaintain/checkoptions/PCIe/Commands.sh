sudo dmidecode -t slot | grep -E 'Designation|Type|Width|Speed'
sudo hwinfo --pci | grep -E 'Speed|Width|PCI bridge'
lspci -vvv | grep -E 'PCI bridge|LnkCap|LnkSta'
sudo dmesg | grep -i pci
sudo lshw -class bridge -class network
