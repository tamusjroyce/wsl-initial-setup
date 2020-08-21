apt-get install -y openssh-server

ufw allow sshd

systemctl restart sshd.service
