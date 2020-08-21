printf "\n\
==========================\n\
INSTALLING OPEN SSH SERVER\n\
==========================\n\
"


apt-get install -y openssh-server

ufw allow ssh

systemctl restart sshd.service
