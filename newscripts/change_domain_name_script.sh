#!/bin/bash
# Ava Gailliot
# Find and replace domain name from system files
 
olddomain=olddomain.com
newdomain=newdomain.com
 
configs=( '/etc/hosts' '/etc/exports' '/etc/fstab' '/etc/sysconfig/network' )
for file in "${configs[@]}"
do
        # Replace domain name and create backup file
        sed -i.bak -e 's/$olddomain/$newdomain/g' $file
done
 
# Find SSH keys for all users
sed -i.bak -e 's/$olddomain/$newdomain/g' /home/*/.ssh/*
 
# change $HOSTNAME
set $HOSTNAME=$(echo "${HOSTNAME%%.*}.$newdomain")
 
# Restart network
service network restart
 
# Update NFS
exportfs -a