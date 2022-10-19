#!/bin/bash

red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'

restart_service() {
    echo ""
    while true; do
        echo -n -e "$rset Enter util (Cancel: 1):$rset "; read util
        if [[ $util == "1" ]]; then
            break
        fi
        array[${#array[@]}]=$util
    done
    echo ""
    for i in ${array[@]}; do
        echo -e "$grn[*]$grn $ylo Restarting $i$ylo $red"; service $i restart 
    done
}

ls_catalog() {
    echo ""
    echo -e "$grn[*]$grn $ylo Show everything in the catalog $name$ylo";
    ls $name -a
}

clear
echo ""
echo -e "$grn             ██████╗░███████╗░██████╗████████╗░█████╗░██████╗░████████╗██╗███╗░░██╗░██████╗░░░░░░░░░░
             ██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║████╗░██║██╔════╝░░░░░░░░░░
             ██████╔╝█████╗░░╚█████╗░░░░██║░░░███████║██████╔╝░░░██║░░░██║██╔██╗██║██║░░██╗░░░░░░░░░░
             ██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██╔══██║██╔══██╗░░░██║░░░██║██║╚████║██║░░╚██╗░░░░░░░░░
             ██║░░██║███████╗██████╔╝░░░██║░░░██║░░██║██║░░██║░░░██║░░░██║██║░╚███║╚██████╔╝██╗██╗██╗
             ╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝╚═╝╚═╝
                                        Copyright by. Hellen$grn"
echo ""
echo -n -e "$blue Enter function [1. Restarting utils; 2. Show all in catalog]:$blue "; read input

if [ "$USER" != "root" ]; then
	echo ""
	echo -n -e "$red[-]$red$yellow Permission Denied$yellow\n"
	echo -n -e "$red[-]$red$yellow Can only be run by root$yellow"
	exit
fi

if [[ $input == '1' ]]; then
    restart_service
elif [[ $input == '2' ]]; then
    echo ""
    echo -n -e "$blue Enter catalog: $blue"; read etc
    name=$etc
    ls_catalog
fi
