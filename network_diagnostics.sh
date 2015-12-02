#!/usr/bin/env bash

echo "Network Diagnostics"

#Physical level
echo "Layer 1: Link"
echo -e "\tMake sure that your machine is physically connected to networking device."
echo -e "\tIf wired, make sure that the ethernet cable is plugged in."
echo -e "\tMake sure that the ethernet cable works when plugged into a different machine.\n"
echo -e "\tChecking the wireless card"
lspci | grep -i wireless
read -p "Press enter to continue."; echo 

#internet layer
echo "Layer 2: Internet"
read -p "Press enter to continue."; echo 

#transport layer
echo "Layer 3: Transport"
read -p "Press enter to continue."; echo 

#application layer
echo "Layer 4: Application"
read -p "Press enter to continue."; echo 
