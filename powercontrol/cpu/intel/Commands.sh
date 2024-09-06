./turbo-boost.sh disable

./cpu-freq.sh enable 2800 2801
./cpu-freq.sh disable 1000 1001

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
