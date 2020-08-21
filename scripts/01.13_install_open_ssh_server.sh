apt-get install -y openssh-server

ufw allow ssh

systemctl restart sshd.service
