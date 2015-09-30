# cluster.coreos.toolbox

Our special toolbox to use in our cloud-init file when installing CoreOS.

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
