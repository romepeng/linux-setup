#!/bin/bash
# 安装Docker
# step 1: 安装必要的一些系统工具
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# step 2: 安装GPG证书
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# Step 3: 写入软件源信息, arch=amd64 or arm64  uname -m check
sudo add-apt-repository "deb [arch=arm64] https://mirrors.cloud.tencent.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# Step 4: 更新并安装Docker-CE
sudo apt-get -y update
apt-cache policy docker-ce
sudo apt-get -y install docker-ce
# Step 5: 非root用户操作docker
### 官方说明里的设置方法，开始 ###
# 这里没有使用这种方法，因为会使脚本中断，原因不明
# 这种方法的好处是docker不用重启
# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker
### 官方说明里的设置方法，结束 ###
# 下面是非官方做法，好处是脚本不会中断，装完docker可以再接着装别的
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker
sudo chmod a+rw /var/run/docker.sock

# Step 6: 镜像加速 if vps in china
#sudo mkdir -p /etc/docker
#sudo tee /etc/docker/daemon.json <<-'EOF'
#{
#    "registry-mirrors": ["https://mirror.ccs.tencentyun.com"]
#}
#EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
echo -e $(docker -v)

# Step 7: 安装docker-compose if amd64
#sudo apt-get -y install docker-compose
# cpu arch=arm64 install docker=compose by pip3
sudo apt-get -y install python3-pip
pip3 install docker-compose
echo -e $(docker-compose -v)
