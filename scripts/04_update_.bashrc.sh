printf `
# Personal Stuff
alias ls='ls --color=auto -la'
alias kubectl='kubectl.exe'
alias helm='helm.exe'
alias minikube='minikube.exe'

GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin
CODE=/mnt/c/coding_local
export KUBECONFIG=/mnt/c/Users/chris/.kube/config

# Settomg up powerline go
function _update_ps1() {

 PS1="$($GOPATH/bin/powerline-go -cwd-mode dironly -modules "cwd,git,node,docker,kube,root" $?)"

}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
` >> ~/.bashrc
