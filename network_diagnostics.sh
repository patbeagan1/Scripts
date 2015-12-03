#!/usr/bin/env bash

echo "Network Diagnostics"

################################################
########                              ##########
########                              ##########
########                              ##########
################################################

function display_usage {
    echo "
    This script attempts to diagnose and fix network errors on linux and mac machines
    -v --verbose
    -f --fix_errors
    -h --help
    "
}

verbose=0
fixing=0
#option parsing
while [[ $# > 0 ]]
do
key="$1"
case $key in
    -v|--verbose)
    verbose=1
    shift # past argument
    ;;
    -f|--fis_errors)
    fixing=1
    shift # past argument
    ;;
    -h|--help)
    display_usage
    exit
    ;;
    *)
          # unknown option
    ;;
esac
shift # past argument or value
done


#ping
#traceroute/tracert
#ipconfig/ifconfig
#nslookup
#ip
#netstat
#dig
#pathping/mtr
#route
#apr

#verify network adapter
#     installed
#     detected
#     up to date
# wired network
#     cable is connected to computer and router
#     good cable
#     network card light is on, green
# wireless
#     wifi is turned on
#     correct wifi hotspot
#     correct network authentication (SSID)
# adapter
#     make sure that the network can ping itself
#     ping 127.0.0.1
#     if that fails, one of:
#         network card is not physically installed correctly,
#         wrong drivers
#         bad card
# router
#     make sure that the router is turned on
#     ipconfig to look at gateway address
#     try to ping the gateway
#         if no reply, 
#             eithr router is set up incorrectly or connection is bad.
#             turn off computer
#             unplug the router
#             leave disconnectedfor 10 seconds
#             turn router and comp back on and attempt to reconnect
# firewall
#     make sure all of the required ports are open, like 80
# dhcp
wired=0
echo "Is the machine using a wired connection? (y|n)" 
read -r wired
if [ $wired = 'y' ] || [ $wired = 'yes' ]
then echo Proceeding as a wired connection;
else echo Proceeding as a wireless connection; 
fi
echo

os=0
echo "Is this machine OSX(1) or Linux(2)? (1|2)" 
read -r os
if [ $os -eq '1' ] 
    then echo Proceeding as OSX;
    else if [ $os = '2' ]
        then echo Proceeding as Linux; 
        else echo unrecognized operating system.
    fi
fi
echo

#Physical level
# printf "\e[033;31mLayer 1: Link\e[0m\n"
# printf "Make sure that your machine is physically connected to networking device.\n"
# printf "If wired, make sure that the ethernet cable is plugged in.\n"
# printf "Make sure that the ethernet cable works when plugged into a different machine.\n"
# printf "Checking the wireless card"
# lspci | grep -i wireless
# read -p -e "Press enter to continue."; echo 

# #internet layer
# printf "\e[033;31mLayer 2: Internet\e[0m"
# read -p "Press enter to continue."; echo 

# #transport layer
# printf "\e[033;31mLayer 3: Transport\e[0m"
# read -p "Press enter to continue."; echo 

# #application layer
# printf "\e[033;31mLayer 4: Application\e[0m"
# read -p "Press enter to continue."; echo 
