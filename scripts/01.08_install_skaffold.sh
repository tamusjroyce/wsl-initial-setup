printf "\n\
==========================\n\
     INSTALLING SKAFFOLD\n\
==========================\n\
"

if [[ !$(command -v curl) ]]
  apt-get install -y curl
fi

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 -o /usr/bin/skaffold
