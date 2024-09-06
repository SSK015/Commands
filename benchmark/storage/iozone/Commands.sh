// Pie
sudo curl https://raw.githubusercontent.com/TheRemote/PiBenchmarks/master/Storage.sh | sudo bash

// Server
wget https://www.iozone.org/src/current/iozone3_506.tar
tar -xvf iozone3_506.tar
cd iozone3_506/src/current
make -j
make linux
./iozone -a
# ./iozone -a > run.log 2>&1
