# My Basic Setup for WSL

Set of scripts to run on a freshly installed ubtuntu rootfs version. Current ones can be found here

https://cloud-images.ubuntu.com/focal/current/

My focus on wsl is to have a working setup to use for software-develpment. The features are listed below

## Included Features

- systemd
- powerline-go
- powerline-fonts
- microk8s
- kubectl
- helm
- skaffold
- node

## Prerequisites

You need at least 

## Usage

1. Enable WSL in Powershell

```
wsl --install
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

4. Start the script

Start the install script for the first time. This will install systemd. You will also get prompted too

```
wsl -d ubuntu /bin/bash /mnt/c/path/to/install.sh
```

5. Start the install script again as the user

Now we can install the rest of the applications as with systemd we also get access to snap. But this time we will run as the user we created.

During the installation you might see a GRUB installation prompt. Just choose one of the sba drives and continue.

Please make sure you run the script from inside wsl

```sh
wsl -d ubuntu --user [your-username]
# Inside of WSL
~ : sudo /bin/bash /mnt/c/path/to/install.sh
```

6. Enjoy!

## Working with VS Code

As snap utilizes systemd and WSL Remote does not user systemd as init process WSL Remote containers can be a little tricky and stuff you install with snap will not work inside of the WSL Remote Container. I always run VS Code on my host machine instead of using the remote containers but change the settings for the terminal to the following

```json
{
  #...
  "terminal.integrated.shell.windows": "powershell.exe",
  "terminal.integrated.shellArgs.windows": [
    "wsl", "--user", "your-username", "/bin/bash" 
  ],
}
```