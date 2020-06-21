#!/bin/bash 

# all my favorite software! Make it work with ANY of my projects!


# MAKE A DEPLOY USER
# > adduser deploy
# > adduser deploy sudo
# > visudo -- then change this line to this: %sudo   ALL=(ALL:ALL) NOPASSWD: ALL

# PRIVATE GITHUB INSTALLS
# ssh-keygen -t rsa -C "seanhess@gmail.com"
# cat .ssh/id_rsa.pub
# add as a deploy key

install_basics() {
  echo "## BASICS ######################"
  apt-get update
  apt-get -y install git make
}

install_varnish() {
  echo "## VARNISH ######################"
  curl http://repo.varnish-cache.org/debian/GPG-key.txt | sudo apt-key add -
  echo "deb http://repo.varnish-cache.org/ubuntu/ lucid varnish-3.0" | sudo tee -a /etc/apt/sources.list
  apt-get update
  apt-get -y install varnish
}

install_nginx() {
  echo "## NGINX ######################"
  apt-get -y install nginx
}

install_node() {
  echo "## NODE ######################"
  apt-get -y install python-software-properties
  add-apt-repository ppa:chris-lea/node.js
  apt-get update
  apt-get -y install nodejs npm
}

install_basics
install_varnish
install_nginx
install_node
