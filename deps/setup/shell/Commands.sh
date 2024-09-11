#!/bin/bash

ssh-keygen 

cat ~/.ssh/id_rsa.pub 

mkdir tools && cd tools

git clone https://github.com/SSK015/dotfiles.git
cd dotfiles/zsh/
./getohmyzsh.sh 
./deployzsh.sh 
