# debian install docker && docker-compose
# Debian 11 / Ubuntu 22.04 安装 Docker 以及 Docker Compose 教程
#  see :
#  https://u.sb/debian-install-docker/

install docker:

apt update && apt upgrade -y

apt install curl vim wget gnupg dpkg apt-transport-https lsb-release ca-certificates

curl -sSL https://download.docker.com/linux/debian/gpg | gpg --dearmor > /usr/share/keyrings/docker-ce.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-ce.gpg] \ 
https://download.docker.com/linux/debian $(lsb_release -sc) stable" \
> /etc/apt/sources.list.d/docker.list

china:

curl -sS https://download.docker.com/linux/debian/gpg | gpg --dearmor > /usr/share/keyrings/docker-ce.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-ce.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian $(lsb_release -sc) stable" > /etc/apt/sources.list.d/docker.list

then:

apt update

apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

docker version

add user rome to docker grp:

apt install docker-ce-rootless-extras

sudo usermod -aG docker $USER

dokcer-compose  also okokok

but install docker-compose :

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose version

also:

sudo apt update
sudo apt install -y python3-pip libffi-dev
sudo pip3 install docker-compose


# check docker

sudo systemctl status docker

docker run hello-world

docker ps 


# docker-compose 组合命令

# 运行 docker-compose.yml 文件

docker-compose up -d

#停止所有正在运行的容器

docker-compose down

#暂停和取消正在运行的容器

docker-compose pause docker-compose unpause

#列出所有正在运行的容器

docker-compose ps

#检查驱动服务的日志

docker-compose logs
