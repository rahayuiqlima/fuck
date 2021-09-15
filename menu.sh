#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
echo "Checking VPS"
izin
clear
COUNTRY=$(curl -s ipinfo.io/country )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(TZ='Asia/Jakarta' date +%R)
hari=$(date +"%A")
tnggl=$(date +"%C %B %Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
#swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

figlet SCRIPT PREMIUM | lolcat
echo -e ""
echo -e "=================================================================" | lolcat
echo -e "                        [ INFORMASI VPS ]" | lolcat
echo -e "=================================================================" | lolcat
echo -e " Zona Waktu             :   Asia/Jakarta"
echo -e " Waktu                  :   $jam WIB"
echo -e " Hari                   :   $hari"
echo -e " Tanggal                :   $tnggl"
#echo -e "=================================================================" | lolcat
#echo -e " Model CPU              :  $cname "
#echo -e " Core                   :   $cores Core"
#echo -e " Frekuensi CPU          :  $freq MHz "
#echo -e " RAM                    :   $tram MB "
#echo -e " Uptime                 :  $up "
echo -e " ISP                    :   $ISP "
echo -e " COUNTRY                :   $COUNTRY "
echo -e " CITY                   :   $CITY "
echo -e " IP                     :   $IPVPS "
echo -e " Host                   :   $domain "
echo -e "=================================================================" | lolcat
echo -e "                        [ Menu Tunneling ]" | lolcat
echo -e "=================================================================" | lolcat
echo -e ""
echo -e " *	  [1]  Menu SSH & OpenVPN  	" 
echo -e " *	  [2]  Menu Wireguard      	"
echo -e " *	  [3]  Menu L2TP/PPTP/SSTP  	"
echo -e " *	  [4]  Menu Shadowsocks/R		"
echo -e " *	  [5]  Menu VMESS/VLESS  		"
echo -e " *	  [6]  Menu Trojan			"
echo -e ""
echo -e "	  [x]  Exit"
echo -e " *	  [99] Menu SYSTEM"
echo -e ""
echo -e "================================================================" | lolcat
read -p "     Select From Options [number or x] :  " num
echo -e "================================================================" | lolcat
echo -e ""
case $num in
1)
menu-ssh
;;
2)
menu-wr
;;
3)
menu-l2tp
;;
4)
menu-ss
;;
5)
menu-v2ray
;;
6)
menu-tr
;;
99)
menu-system
;;
x)
clear
exit
;;
*)
echo "Please enter an correct number"
;;
esac
