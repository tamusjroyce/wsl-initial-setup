# My Basic Setup for WSL

Set of scripts to run on a freshly installed ubtuntu rootfs version. Current ones can be found here

https://cloud-images.ubuntu.com/focal/current/

## Included Features

- systemd
- powerline-go
- powerline-fonts
- microk8s
- kubectl
- helm
- node

## Prerequisites

You need at least 

## Usage

1. Enable WSL in Powershell

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
 
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

2. Download rootfs Ubuntu

Example
```sh
curl https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-wsl.rootfs.tar.gz --output focal-server.amd64-wsl.tar.gz
```

3. Install WSL

I use a folder to keep sources and one for the distros as

- C:\wsl\distro
- C:\wsl\source

If you choose to store it somewhere else adjust folder names accordingly

```sh
wsl --import ubuntu c:\wsl\distro\ubuntu c:\wsl\distro\focal-server.amd64-wsl.tar.gz
```

4. Start Script inside of WSL

```
wsl -d ubuntu
```

```
# cd ~
# git clone https://gitlab.com/relief-melone/wsl-initial-setup.git
# sh ./wsl-initial-setup/install.sh
```
