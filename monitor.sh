######################################################################################################
#! /bin/bash																						 #
#																									 #
# Author - Nithish vasala		                                                                     #
# A shell script to monitor linux health															 #
######################################################################################################

clear

btnormal=$(tput sgr0)

ping -c 1 google.com >/dev/null && echo -e "Internet :" '\e[38;5;42m' "Connected" $btnormal || echo -e "Internet :" '\e[38;5;196m' " Disconnected"

type_os=$(uname -o)
echo -e "Operating System Type : "'\e[34m'$type_os $btnormal

osname=$(hostnamectl | grep -i "operating system" | cut -d ":" -f 2)
echo -e "O.S name : "'\e[34m'$osname$btnormal

osrelease=$(lsb_release -a  | grep -i "release" | cut -d ":" -f 2)
echo -e "O.S Release : "'\e[34m'$osrelease $btnormal

architecture=$(hostnamectl | grep -i "architecture" | cut -d ":" -f 2)
echo -e "Architecture : "'\e[34m'$architecture $btnormal

versionid=$(uname -r)
echo -e "Kernal Version : "'\e[34m'$versionid $btnormal

hostname=$(hostname)
echo -e "Hostname : "'\e[34m'$hostname$btnormal

internalip=$(hostname -i)
echo -e "Internal IP : "'\e[34m'$internalip$btnormal

externalip=$(curl -s https://ipinfo.io/ip;echo)
echo -e "External IP : "'\e[34m'$externalip$btnormal

nameserver=$(cat /etc/resolv.conf | grep -i "nameserver" | awk '{print $2}')
echo -e "Name Server : "'\e[34m'$nameserver$btnormal

who | sort | uniq | head -2 >/tmp/whome
echo -e "Logged in users :"'\e[34m'
cat /tmp/whome
echo -e $btnormal
#userlogin=$(who | awk '{print $1}'|sort | uniq)
#echo -e "Logged in users :\n" $userlogin

free -h > /tmp/free
echo -e "Ram Usages : "'\e[34m'
cat /tmp/free | grep -v "Swap"
echo -e $btnormal
echo -e "Swap Usages :"'\e[34m'
cat /tmp/free | grep -v "Mem"
echo -e $btnormal

df -kh | head -4 >/tmp/diskspace1
echo -e "Disk Space : "'\e[34m'
cat /tmp/diskspace1
echo -e $btnormal


loadaverage=$(uptime | cut -d ":" -f 5)
echo -e "Load Average : "'\e[34m'$loadaverage $btnormal

systime=$(date | cut -d " " -f5)
echo -e "System Time (HH:MM:SS) : "'\e[34m' $systime$btnormal
