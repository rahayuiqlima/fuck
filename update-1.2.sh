#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);

# Validate Version Script
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "Automatical Update In 3s"
sleep 3
else 
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/menu.sh"
wget -O add-host "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-host.sh"
wget -O addd-ssh "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-ssh.sh"
wget -O trial-ssh "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/trial-ssh.sh"
wget -O change-port "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/port-vless.sh"
wget -O webmin "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/xp.sh"
wget -O speed-limiter "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/speed-limiter.sh"
wget -O add-sstp "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/add-tr.sh"
wget -O update "https://raw.githubusercontent.com/EvoTeamMalaysia/AutoScript/main/update-1.2.sh"
chmod +x change-port
chmod +x add-host
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x webmin
chmod +x xp
chmod +x speed-limiter
chmod +x update
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.3" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 3 Sec"
sleep 3
rm -f update.sh
reboot
