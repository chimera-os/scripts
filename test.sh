#!/bin/bash

PATHTOLIST="./packages.txt"

# Fail on error and report it, debug all lines
set -eu -o pipefail

# Check if script is run as sudo
USER=$(id -u)
test $USER -eq 0 || echo "You should have sudo privilege to run this script"

echo "Ready to install the following packages:"
echo "$(cat packages.list)"

while true; do
    read -p "Do you wish to continue? " yn
    case $yn in
        [Yy]* ) apt-get install $(cat $PATHTOLIST);;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done