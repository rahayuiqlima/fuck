#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'

clear
echo -e ""
echo -e "${GREEN}=================================================================${NC}"
echo -e "${BLUE}======================= ${RED}Menu SSH & OpenVPN ${BLUE}======================${NC}"
echo -e ""
echo -e "* [1]    : Create SSH & OpenVPN Account" | lolcat
echo -e "* [2]    : Generate SSH & OpenVPN Trial Account" | lolcat
echo -e "* [3]    : Extending SSH & OpenVPN Account Active Life" | lolcat
echo -e "* [4]    : Delete SSH & OpenVPN Account" | lolcat
echo -e "* [5]    : Check User Login SSH & OpenVPN" | lolcat
echo -e "* [6]    : Daftar Member SSH & OpenVPN" | lolcat
echo -e "* [7]    : Delete User Expired SSH & OpenVPN" | lolcat
echo -e "* [8]    : Set up Autokill SSH" | lolcat
echo -e "* [9]    : Displays Users Who Do Multi Login SSH" | lolcat
echo -e "* [10]   : Restart Service Dropbear, Squid3, OpenVPN dan SSH" | lolcat
echo -e ""
echo -e "${GREEN}=================================================================${NC}"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
add-ssh
;;
2)
trial-ssh
;;
3)
renew-ssh
;;
4)
del-ssh
;;
5)
cek-ssh
;;
6)
list-ssh
;;
7)
delete
;;
8)
autokill
;;
9)
mulog
;;
10)
restart
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
