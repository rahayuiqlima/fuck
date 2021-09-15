#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
clear
echo -e ""
echo -e "${BLUE}========================= ${RED}Menu Wireguard ${BLUE}========================${NC}"
echo -e ""
echo -e "*[1] : 	Create Wireguard Account" | lolcat
echo -e "*[2] : 	Delete Wireguard Account" | lolcat
echo -e "*[3] : 	Check User Login Wireguard" | lolcat
echo -e "*[4] : 	Extending Wireguard Account Active Life" | lolcat
echo -e ""
echo -e "${GREEN}=================================================================${NC}"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
