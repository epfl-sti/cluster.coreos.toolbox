# cluster.coreos.toolbox

Our special toolbox to use in our cloud-init file when installing CoreOS.

This github repository triggers automatic builds on [https://hub.docker.com/r/epflsti/cluster.coreos.toolbox/](hub.docker.com).

## Usage
`docker run -it epflsti/cluster.coreos.toolbox bash`

## Output
```
core@c35 ~/cluster.coreos.toolbox $ docker run -it epflsti/toolbox bash
--------------------------------------------------------------------------------
.       ____ _____ ___     ___ _____   _____           _ _                     .
.      / ___|_   _|_ _|   |_ _|_   _| |_   _|__   ___ | | |__   _____  __      .
.      \___ \ | |  | |_____| |  | |     | |/ _ \ / _ \| | '_ \ / _ \ \/ /      .
.       ___) || |  | |_____| |  | |     | | (_) | (_) | | |_) | (_) >  <       .
.      |____/ |_| |___|   |___| |_|     |_|\___/ \___/|_|_.__/ \___/_/\_\      .
.                                       v0.10  <stiitdev@groupes.epfl.ch>      .
.                      https://github.com/epfl-sti/cluster.coreos.toolbox      .
.                 https://hub.docker.com/r/epflsti/cluster.coreos.toolbox      .
--------------------------------------------------------------------------------

     Welcome to 7c55b9317086 running on Ubuntu 16.04 LTS (kernel 4.0.5).

╭─root@7c55b9317086  ~  
╰─$
```
A more comple motd can be used, but it's way slower !

![sti-it-cluster-coreos-toolbox.png](https://raw.githubusercontent.com/epfl-sti/cluster.coreos.toolbox/master/sti-it-cluster-coreos-toolbox.png)

[Screenshot: sti-it-cluster-coreos-toolbox.png](https://raw.githubusercontent.com/epfl-sti/cluster.coreos.toolbox/master/sti-it-cluster-coreos-toolbox.png)

## Content
Installed packages are listed in the [Dockerfile](https://github.com/epfl-sti/cluster.coreos.toolbox/blob/master/Dockerfile).

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
