#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
echo "Checking VPS"
izin
clear
IP=$(wget -qO- https://icanhazip.com);
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Usernew: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A Client Username Was Already Created, Please Enter New Username"
			exit 1
		fi
	done
read -p "Password: " pass
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
clear
cat <<EOF

============================
SSTP VPN Information Account
============================
Server IP     : $IP
Username      : $user
Password      : $pass
Port          : $sstp
Cert          : http://$IP:81/server.crt
Expired On    : $exp
============================
EOF
