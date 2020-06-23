snap install microk8s --classic
usermod -a -G microk8s $(whoami)
chown -f -R $(whoami) ~/.kube 

exit;