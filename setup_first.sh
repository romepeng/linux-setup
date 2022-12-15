#!/usr/bin/bash
# use on adm64 or x86 ubuntu20.01LTS server

function check_system_arch(){
	ARCH=$(dpkg --print-architecture)
	echo -e " CPU arch : $ARCH"
	source '/etc/os-release'  
	OS=${ID}
	echo -e "linux OS : $OS"
}

# update os
function update_os(){
  	clear
	echo
	sudo apt-get -y update && sudo apt-get -y upgrade \
		&& sudo apt autoremove
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
	sudo apt install tree 
	#net-tools 
	#fuse
}

# install docker and docker commpose
function install_docker(){
	clear
	echo
  #if [[ 0 == $UID ]]; then
  #  echo -e "user is root, please change to no root"
  #  read -p " input user's name: " user_name
  #  su - $user_name
  #else i
 	check_system_arch
        
    	wget -O - https://raw.githubusercontent.com/romepeng/linux-onekey-setup/main/docker/install_docker_${ARCH}.sh | bash
  #fi
}

#git install and config
function git_config(){
	clear
	echo
	wget -O .gitconfig https://raw.githubusercontent.com/romepeng/linux-onekey-setup/main/git/gitconfig

}

install_nodejs(){
	clear
	curl -sL install-node.vercel.app/lts  | sudo bash  && sudo npm install -g yarn
	yarn global add neovim

	echo -e "node version: $(node -v)" && 
	echo -e "npm version: $(npm -v)" && 
	echo -e "yarn version: $(yarn -v)"
}

install_nvim(){
	clear
	# for ubuntu
	#udo snap install --beta nvim --classic
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	sudo chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	sudo mv squashfs-root /
        sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	nvim --version

}

install_vim-plug(){
	clear
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sudo sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	pip3 install pynvim --upgrade
	pip3 install --user neovim	
}

install_coc-nvim(){
	clear
	sudo mkdir -p ~/.local/share/nvim/site/pack/coc/start
	cd ~/.local/share/nvim/site/pack/coc/start
	sudo git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
	sudo nvim -c "helptags coc.nvim/doc/ | q"
}


nvim_config_plugins(){
	NVIM_CONFIG_DIR=$HOME/.config/nvim
	echo "nvim config and indtall plugins"
	if [[ -d "$NVIM_CONFIG_DIR" ]]; then 
	       mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.bak"
	fi	    
	git clone --depth=1 https://github.com/romepeng/nvim-config.git "$NVIM_CONFIG_DIR"
	echo "if install vim=plug ok"
	
	"$HOME/bin/nvim" -c "autocmd User vimplugComplete quitall" -c "vimplugsync " #TODO
	echo -e "finish nvim config and plugins"

}

install_miniconda(){
	clear
	wget https://raw.githubusercontent.com/romepeng/linux-onekey-setup/main/pyenv/Install_miniconda.sh  && bash Install_miniconda.sh
	conda update -y conda
}

install_poetry(){
	clear
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
}

install_ssl_cert_issue() {
    echo-E ""
    LOGD "******使用说明******"
    LOGI "该脚本将使用Acme脚本申请证书,使用时需保证:"
    LOGI "1.知晓Cloudflare 注册邮箱"
    LOGI "2.知晓Cloudflare Global API Key"
    LOGI "3.域名已通过Cloudflare进行解析到当前服务器"
    LOGI "4.该脚本申请证书默认安装路径为/root/cert目录"
    confirm "我已确认以上内容[y/n]""y"
    if [ $?-eq0 ]; then
        cd~
        LOGI "安装Acme脚本"
        curl https://get.acme.sh |sh
        if [ $?-ne0 ]; then
            LOGE "安装acme脚本失败"
            exit1
        fi
        CF_Domain=""
        CF_GlobalKey=""
        CF_AccountEmail=""
        certPath=/root/cert
        if [ !-d"$certPath"]; then
            mkdir $certPath
        else
            rm -rf $certPath
            mkdir $certPath
        fi
        LOGD "请设置域名:"
        read-p "Input your domain here:"CF_Domain
        LOGD "你的域名设置为:${CF_Domain}"
        LOGD "请设置API密钥:"
        read-p "Input your key here:"CF_GlobalKey
        LOGD "你的API密钥为:${CF_GlobalKey}"
        LOGD "请设置注册邮箱:"
        read-p "Input your email here:"CF_AccountEmail
        LOGD "你的注册邮箱为:${CF_AccountEmail}"
        ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
        if [ $?-ne0 ]; then
            LOGE "修改默认CA为Lets'Encrypt失败,脚本退出"
            exit1
        fi
        exportCF_Key="${CF_GlobalKey}"
        exportCF_Email=${CF_AccountEmail}
        ~/.acme.sh/acme.sh --issue --dns dns_cf -d ${CF_Domain}-d *.${CF_Domain}--log
        if [ $?-ne0 ]; then
            LOGE "证书签发失败,脚本退出"
            exit1
        else
            LOGI "证书签发成功,安装中..."
        fi
        ~/.acme.sh/acme.sh --installcert -d ${CF_Domain}-d *.${CF_Domain}--ca-file /root/cert/ca.cer \
        --cert-file /root/cert/${CF_Domain}.cer --key-file /root/cert/${CF_Domain}.key \
        --fullchain-file /root/cert/fullchain.cer
        if [ $?-ne0 ]; then
            LOGE "证书安装失败,脚本退出"
            exit1
        else
            LOGI "证书安装成功,开启自动更新..."
        fi
        ~/.acme.sh/acme.sh --upgrade --auto-upgrade
        if [ $?-ne0 ]; then
            LOGE "自动更新设置失败,脚本退出"
            ls -lah cert
            chmod 755 $certPath
            exit1
        else
            LOGI "证书已安装且已开启自动更新,具体信息如下"
            ls -lah cert
            chmod 755 $certPath
        fi
    else
        show_menu
    fi
}


function menu(){
	source /etc/os-release
	#check_system_arch
	clear
	echo -e "\t linux cpu arch: $(dpkg --print-architecture), OS: echo ${PRETTY_NAME}"
	echo -e "\t os setup first管理脚本 ${Red}${Font}"
	echo -e "\t---authored by romepeng---"
	echo -e "\t https://github.com/romepeng\n"
	echo -e "\t ---- cloud sever setup script ----\n"
	echo -e "\t Uaer: $USER, Home: $HOME Dir: $PWD \n"
	
	echo -e "\t21. Set passwd "
 	echo -e "\t2. Add user "
  	echo -e "\t3. Set timezone "
  	echo -e "\t4. Python3 dauflt "
  	echo -e "\t5. Install docker "
  	echo -e "\t6. Install tool app "
	echo -e "\t7. Gitconfig"
	echo -e "\t8. Install_nvim"
	echo -e "\t9. Install_inodejs"
	echo -e "\t10. Install_vim-plug"
	echo -e "\t11. Install_coc-nvim"
	echo -e "\t12. Install_miniconda"
	echo -e "\t13. Install_poetry"
	echo -e "\t14. install_ssl_cert_issue()"
	
	echo -e "\t0. Exit menu \n\n "
	echo -en "\t\tEnter an option: "
	read  option
} 

while [ 1 ]
do
	menu
	case $option in	
  	0)
    		break ;;
	21)
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
		git_config ;;	
	8)
		install_nvim ;;
	9)
		install_nodejs ;;
	10)
		install_vim-plug ;;
	11)
		install_coc-nvim ;;
	12)
		install_miniconda ;;
	13)    
		install_poetry ;;
		
	14 
		install_ssl_cert_issue() ;;
	
	*)
		clear
		echo -e "请输入正确的数字" ;;
	esac
	echo -en "\n\n\t\t\tHit any key to continue"
	read -n 1 line
done
clear

