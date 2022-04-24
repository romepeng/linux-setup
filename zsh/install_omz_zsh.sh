#!/bin/sh
#Install Oh My Zsh Framework
#https://www.cherryservers.com/blog/how-to-install-and-start-using-oh-my-zsh-on-ubuntu-20-04

sudo apt update
sudo apt install zsh -y
which zsh

sudo chsh -s /usr/bin/zsh
echo $SHELL

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

 ls /home/tecmint/.oh-my-zsh/themes/
 #vi ~/.zshrc
 #source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# add git history colored-man-pages  jsontools
#zsh-autosuggestions plugins/zsh-syntax-highlighting to .zshrc
# source ~/.zshrc

# use end and Home keys
vi ~/.zshrc 
#add
# bindkey  "^[[1~"   beginning-of-line
#bindkey  "^[[4~"   end-of-line