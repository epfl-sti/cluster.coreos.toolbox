# Ust phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.

# In case you want quickdev with the toolbox :
# docker pull epflsti/cluster.coreos.toolbox
# docker run --privileged -v $PWD:/cwd -it epflsti/cluster.coreos.toolbox /bin/bash

FROM phusion/baseimage:0.9.17
MAINTAINER STIIT Dev <stiitdev@groupes.epfl.ch>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Comment src sources
RUN sed -i "s/^deb\-src/\#deb\-src/" /etc/apt/sources.list
# Use ch mirror
RUN sed -i "s/archive.ubuntu.com/ch.archive.ubuntu.com/g" /etc/apt/sources.list
# and add multiverse package in case we need something else
RUN apt-add-repository multiverse

# Ubuntu update + upgrades
RUN apt-get -q update && apt-get -qy upgrade 

# Latest node version ('cause you know...)
#   https://github.com/nodejs/node-v0.x-archive/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
# Hopefully phusion/baseimage come with curl
# ... then nodejs installation can be ran with apt-get install
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash 

# Install STIIT tools
RUN apt-get install -y --no-install-recommends \
    arping \
    build-essential \
    ca-certificates \
    curl \
    dmidecode \
    ethtool \
    facter \
    file \
    git \
    htop \
    httpry \
    iftop \
    iperf \
    ipmitool \
    iproute2 \
    jq \
    less \
    lsof \
    ltrace \
    man-db \
    manpages \
    mtr \
    net-tools \
    nicstat \
    nmap \
    nodejs \
    rsync \
    sntop \
    strace \
    sysstat \
    tcpdump \
    tcptraceroute \
    telnet \
    vim \
    vnstat \
    wget \
    zsh

# Node again nodejs <-> node
#RUN ln -s /usr/bin/nodejs /usr/bin/node

# Oh-My-ZSH / zsh configuration
WORKDIR /root/
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh 
COPY zshrc .zshrc
#RUN mkdir -p /root/.zsh/completion/
#RUN curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/zsh/_docker-compose > /root/.zsh/completion/_docker-compose

RUN chsh -s `which zsh`

COPY motd motd
RUN chmod +x motd

# Get a "docker" PS1 prompt
RUN echo 'export "LANG=C.UTF-8"' >> /root/.bashrc 
RUN echo "PS1='⚠ DOCKER! \u@\h:\w\$ '" >> /root/.bashrc
RUN echo ". motd" >> /root/.bashrc

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
