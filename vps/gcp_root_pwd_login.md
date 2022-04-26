sudo -I
passwd

vi /etc/ssh/sshd_config



PermitRootLogin yes

PasswordAuthentication yes

PubkeyAuthentication yes

systemctl restart ssh

