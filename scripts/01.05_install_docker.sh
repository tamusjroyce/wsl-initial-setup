# apt-get install -y \
#   apt-transport-https \
#   ca-certificates \
#   software-properties-common \
#   libssl-dev \
#   libffi-dev \

# Add User to docker group
groupadd docker
usermod -aG docker $SUDO_USER

#add Docker Key and Repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update
apt-get update -y

# install docker
apt-get install -y docker-ce containerd.io
