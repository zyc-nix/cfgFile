#!/bin/bash

export http_proxy='http://proxy.vmware.com:3128'
export https_proxy='http://proxy.vmware.com:3128'

firstUpdate() {
    if [ ! -d /etc/apt/apt.conf ]; then
        sudo touch /etc/apt/apt.conf
    fi
    sudo cat /etc/apt/apt.conf | grep "proxy.vmware.com" > /dev/null 2>&1
    if [ $? != 0 ];then
        sudo chmod 777 /etc/apt/apt.conf
        sudo echo 'Acquire::http::Proxy "http://proxy.vmware.com:3128";' >> /etc/apt/apt.conf
        sudo chmod 644 /etc/apt/apt.conf
    fi

    sudo apt-get update -y && sudo apt-get upgrade -y
}

installEmacs () {
    sudo apt-add-repository -y ppa:cassou/emacs
    sudo apt-get update -y
    sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
}

installJava () {
    sudo apt-add-repository -y ppa:webupd8team/java
    sudo apt-get update -y
    sudo apt-get install -y oracle-java8-installer 
}

installLein () {
    wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -P ~/.
    chmod 755 ~/lein
    sudo mv ~/lein /usr/bin/.
}

installR () {
    sudo apt-add-repository -y ppa:marutter/rrutter
    sudo apt-get update -y
    sudo apt-get install -y r-base r-base-dev
}

installGo () {
    sudo apt-get install -y python-software-properties  # 12.04
    sudo add-apt-repository -y ppa:duh/golang
    sudo apt-get update -y
    sudo apt-get install -y golang
}
installNvidia-Driver () {
    sudo apt-add-repository -y ppa:ubuntu-x-swat/x-updates
    sudo apt-get install -y nvidia-current
}

configDocker () {
    wget -qO- https://get.docker.com/ | sh
    sudo groupadd docker
    sudo chown root:docker /var/run/docker.sock
    username=$(whoami)
    sudo usermod -a -G docker $username
    sudo gpasswd -a $username docker
}

#firstUpdate
#installEmacs
#installJava
#installLein
#installGo
#installR
configDocker
