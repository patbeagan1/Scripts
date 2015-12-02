#!/usr/bin/env bash

echo "Network Diagnostics"

#Physical level
echo "Layer 1: Physical"
echo "\tMake sure that your machine is physically connected to networking device."
echo "\tIf wired, make sure that the ethernet cable is plugged in."
echo "\tChecking the wireless card"
lspci | grep -i wireless
read -p "Press enter to continue."

echo "Layer 2: Data Link"
echo "Layer 3: Network"
echo "Layer 4: Transport"
echo "Layer 5: Session"
echo "Layer 6: Presentation"
echo "Layer 7: Application"
