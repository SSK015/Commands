

# change the root passwd of an image 
sudo virt-customize -a <image_path> --root-password password:123456

sudo guestfish -a <image_path> 

run