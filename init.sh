#!/bin/bash

# SSH keys
# Not using Ansible to generate the ssh key because I want to use a passphrase
# and not have the passphrase in git in any way.

if [ ! -d "/home/will/.ssh" ]; then
  mkdir /home/will/.ssh
fi

EDKEYFILE="/home/will/.ssh/id_ed25519_$(date +'%Y')"
if [ ! -f $EDKEYFILE ]; then
  ssh-keygen -o -a 100 -t ed25519 -f $EDKEYFILE
fi

RSAKEYFILE="/home/will/.ssh/id_rsa_$(date +'%Y')"
if [ ! -f $RSAKEYFILE ]; then
  ssh-keygen -o -a 100 -t rsa -b 4096 -f $RSAKEYFILE
fi

# Ansible
apt update
apt install ansible

ansible-playbook ./playbook.yml
