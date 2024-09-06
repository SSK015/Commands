// Remember to check gcc versiion!

make oldconfig

make modules.builtin -j32

sudo make -j24

sudo make install -j24

sudo make headers_install INSTALL_HDR_PATH=/usr -j24
