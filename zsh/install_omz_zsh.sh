#!/bin/sh
sudo apt install zsh
#https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

 ls /home/tecmint/.oh-my-zsh/themes/