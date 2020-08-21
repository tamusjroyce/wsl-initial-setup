printf "\n\
==========================\n\
     INSTALLING HELM\n\
==========================\n\
"

if [[ !$(command -v curl) ]]; then
  apt-get install -y curl
fi

curl https://helm.baltorepo.com/organization/signing.asc | sudo apt-key add -
apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update
apt-get install helm
