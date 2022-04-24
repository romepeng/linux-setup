#!/bin/sh
sudo apt update
sudo apt install zsh -y
which zsh

udo chsh -s /usr/bin/zsh
echo $SHELL

#https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

 ls /home/tecmint/.oh-my-zsh/themes/
 #vi ~/.zshrc
 #source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# add git zsh-autosuggestions plugins/zsh-syntax-highlighting to .zshrc
# source ~/.zshrc
