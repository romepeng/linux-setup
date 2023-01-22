#!/bin/bash

# update os
function update_os(){
        clear
        echo
        sudo apt-get -y update && sudo apt-get -y upgrade
}

#change passwd
function set_root_passwd(){
        clear
        echo
        sudo passwd
}

#add user
function adduser(){
        clear
        echo
        read -p  "inpout add user's name :" user_name
        #echo "user name: $user_name"
        if id -u $user_name > /dev/null 2>&1; then
                echo "user $user_name exists"
        else
                sudo adduser $user_name
                sudo usermod -aG sudo  $user_name

                #su $USER
                touch /home/$user_name/.sudo_as_admin_successful
        fi
}

#change or set timezone
function set_timedatezone(){
        clear
        echo
        sudo timedatectl set-timezone Asia/Shanghai
        echo
        echo -e  $(timedatectl)
}

# set python default and pip3
function set_python3_install_pip3(){
        clear
        echo
        sudo ln -s /usr/bin/python3 /usr/bin/python
        sudo apt -y install python3-pip
}

# install tool app
function install_tool_app(){
        clear
        echo
        sudo apt install tree net-tools
}

# install docker and docker commpose
function install_docker(){
        clear
        echo
  #if [[ 0 == $UID ]]; then
  #  echo -e "user is root, please change to no root"
  #  read -p " input user's name: " user_name
  #  su - $user_name
  #else
        wget -O - https://raw.githubusercontent.com/romepeng/linux-onekey-setup/main/docker/install_docker_amd64.sh | bash
  #fi
        sudo apt update
        sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
        
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs)   stable"
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io -y
        
        sudo usermod -aG docker $USER
        newgrp docker
        
        sudo apt update
        sudo apt install docker-compose-plugin
        
}

#git install and config
function git_config(){
        clear
        echo

}


function menu(){
        clear
        echo
        echo -e "\t os setup first管理脚本 ${Red}${Font}"
        echo -e "\t---authored by romepeng---"
        echo -e "\t https://github.com/romepeng\n"

        echo -e "\t8. OS升级 "
        echo -e "\t1. Set passwd "
        echo -e "\t2. Add user "
        echo -e "\t3. Set timezone "
        echo -e "\t4. Python3 dauflt "
        echo -e "\t5. Install docker "
        echo -e "\t6. Install tool app "
        echo -e "\t0. Exit menu \n\n "
        echo -en "\t\tEnter an option: "
        read -n 1 option
}

while [ 1 ]
do
        menu
        case $option in
        0)
                break ;;
        1)
                set_root_passwd ;;
        2)
                adduser ;;
        3)
                set_timedatezone ;;
        4)
                set_python3_install_pip3 ;;
        5)
                install_docker ;;
        6)
                install_tool_app ;;
        7)
                install_nodejs_npm ;;
        8)
                update_os ;;
        *)
                clear
                echo -e "请输入正确的数字" ;;
        esac
        echo -en "\n\n\t\t\tHit any key to continue"
        read -n 1 line
done
clear
