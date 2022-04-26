sudo -I
passwd

vi /etc/ssh/sshd_config

修改下面两个参数把no改为yes
PermitRootLogin no
PasswordAuthentication no



systemctl restart ssh

