# cluster.coreos.toolbox

Our special toolbox to use in our cloud-init file when installing CoreOS.

## Usage
`docker run -it epflsti/toolbox /bin/zsh`

## Output
```
core@c35 ~/cluster.coreos.toolbox $ docker run -it epflsti/toolbox /bin/zsh
--------------------------------------------------------------------------------
.       ____ _____ ___     ___ _____   _____           _ _                     .
.      / ___|_   _|_ _|   |_ _|_   _| |_   _|__   ___ | | |__   _____  __      .
.      \___ \ | |  | |_____| |  | |     | |/ _ \ / _ \| | '_ \ / _ \ \/ /      .
.       ___) || |  | |_____| |  | |     | | (_) | (_) | | |_) | (_) >  <       .
.      |____/ |_| |___|   |___| |_|     |_|\___/ \___/|_|_.__/ \___/_/\_\      .
.                                       v0.1   <stiitdev@groupes.epfl.ch>      .
.                      https://github.com/epfl-sti/cluster.coreos.toolbox      .
.                 https://hub.docker.com/r/epflsti/cluster.coreos.toolbox      .
--------------------------------------------------------------------------------
                   Note: this toolbox is poshed up with ZSH

    Welcome to 7c55b9317086 running on Ubuntu 14.04.3 LTS (kernel 4.0.5).

             System information as of: Wed Sep 30 21:41:48 UTC 2015

                                                                ╔═════════╗
        System load:    0.28    Memory usage:   88.3%           ║ STI-IT  ║
        Usage on /:     8%      Swap usage:     0               ║ toolbox ║
        Local users:    0       Updates:        0               ║   Roxxx ║
                                                                ╚═════════╝

╭─root@7c55b9317086  ~  
╰─$
```

![sti-it-cluster-coreos-toolbox.png](https://raw.githubusercontent.com/epfl-sti/cluster.coreos.toolbox/master/sti-it-cluster-coreos-toolbox.png)

[Screenshot: sti-it-cluster-coreos-toolbox.png](https://raw.githubusercontent.com/epfl-sti/cluster.coreos.toolbox/master/sti-it-cluster-coreos-toolbox.png)

## Content
* arping
* ca-certificates
* curl
* dmidecode
* ethtool
* file
* git
* htop
* ipmitool
* iproute2
* less
* ltrace
* man-db
* manpages
* net-tools
* nicstat
* nmap
* strace
* sysstat
* tcpdump
* vim
* wget
* zsh

## Cloud-init example
```
-write_files:
  - path: /home/core/.toolboxrc
    owner: core
    content: |
      TOOLBOX_DOCKER_IMAGE=epflsti/cluster.coreos.toolbox
      TOOLBOX_DOCKER_TAG=latest
```

## Thanks
* http://thepracticalsysadmin.com/change-coreos-default-toolbox/
