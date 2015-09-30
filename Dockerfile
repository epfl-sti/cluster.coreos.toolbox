# Ust phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.

FROM phusion/baseimage:0.9.17
MAINTAINER STIIT Dev <stiitdev@groupes.epfl.ch>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Comment src sources
RUN sed -i "s/^deb\-src/\#deb\-src/" /etc/apt/sources.list

# Ubuntu update + upgrades
RUN apt-get -q update && apt-get -qy upgrade 

# Install STIIT tools
RUN apt-get install -y --no-install-recommends \
        file     \
        git      \
        less     \
        man-db   \
        manpages \
        vim      \
        zsh      \
        htop     \
        strace   \ 
        ltrace   \
        sysstat  \
        arping   \
        curl     \
        ca-certificates \
        ethtool  \
        tcpdump  \
        iproute2 \
        nmap     \
        nicstat  \
        net-tools \
        ipmitool \
        dmidecode \
        wget 

# Oh-My-ZSH
RUN wget –no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh  
RUN chsh -s /bin/zsh

# Get a "docker" PS1 prompt
RUN echo 'export "LANG=C.UTF-8"' >> /root/.bashrc 
RUN echo "PS1='⚠ DOCKER! \u@\h:\w\$ '" >> /root/.bashrc

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
