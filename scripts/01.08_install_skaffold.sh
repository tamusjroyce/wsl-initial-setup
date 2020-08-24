printf "\n\
==========================\n\
     INSTALLING SKAFFOLD\n\
==========================\n\
"

if [[ !$(command -v curl) ]]; then
  apt-get install -y curl
fi

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
install skaffold /usr/bin/
rm -rf skaffold
