#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
echo -e ""
echo -e ""
echo -e "\033[0;37m Script Ini Version LifeTime "
echo -e " Tuk Infonya Silahkan Hubungi Admin"
echo -e " Version Multiport "
echo -e " By Arya Blitar 087721815317 "
echo -e "\033[0;32m"
kunci="GRATIS";
read -s -p "Masukkan Password : " pass
if [ $pass == $kunci ]
then cat login.sh
clear
else
echo -e "\033[0;31m Password Salah Sayank...!!"
echo -e "\033[0;32m Segera Hub. Admin 087721815317 "
exit
fi
echo -e "\033[0;32m SELAMAT ANDA BERHASIL MASUK & INSTALL"
sleep 3
# ==========================================
MYIP=$(wget -qO- icanhazip.com);
clear
clear
clear
# ==========================================
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
akbarvpn="raw.githubusercontent.com/copy47/kontol/main/ssh"
# Link Hosting Kalian Untuk Xray
akbarvpnnnnnn="raw.githubusercontent.com/copy47/kontol/main/xray"
# Link Hosting Kalian Untuk Ipsec
akbarvpnnnnnnn="raw.githubusercontent.com/copy47/kontol/main/ipsec"
# Link Hosting Kalian Untuk Backup
akbarvpnnnnnnnn="raw.githubusercontent.com/copy47/kontol/main/backup"
# Link Hosting Kalian Untuk Websocket
akbarvpnnnnnnnnn="raw.githubusercontent.com/copy47/kontol/main/websocket"
# Link Hosting Kalian Untuk Ohp
akbarvpnnnnnnnnnn="raw.githubusercontent.com/copy47/kontol/main/ohp"
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/fsidvpn;
echo "IP=" >> /var/lib/fsidvpn/ipvps.conf
echo -e "[ ${green}INFO$NC ] Downloading & Configuration Domain"
sleep 3
wget https://${akbarvpn}/cf.sh >/dev/null 2>&1
chmod +x cf.sh >/dev/null 2>&1
./cf.sh >/dev/null 2>&1
#install v2ray
echo -e "[ ${green}INFO$NC ] Downloading & Installing xray/v2ray"
sleep 3
wget https://${akbarvpnnnnnn}/ins-xray.sh >/dev/null 2>&1
chmod +x ins-xray.sh >/dev/null 2>&1
screen -S xray ./ins-xray.sh >/dev/null 2>&1
#install ssh ovpn
echo -e "[ ${green}INFO$NC ] Downloading & Installing OpenVpn"
sleep 3
wget https://${akbarvpn}/ssh-vpn.sh >/dev/null 2>&1
chmod +x ssh-vpn.sh >/dev/null 2>&1
screen -S ssh-vpn ./ssh-vpn.sh >/dev/null 2>&1
#installwg
#echo -e "[ ${green}INFO$NC ] Downloading & Installing wireguard"
#sleep 3
#wget https://${akbarvpnnnnn}/wg.sh >/dev/null 2>&1
#chmod +x wg.sh >/dev/null 2>&1
#screen -S wg ./wg.sh >/dev/null 2>&1
#install L2TP
echo -e "[ ${green}INFO$NC ] Downloading & Installing l2tp"
sleep 3
wget https://${akbarvpnnnnnnn}/ipsec.sh >/dev/null 2>&1
chmod +x ipsec.sh >/dev/null 2>&1
screen -S ipsec ./ipsec.sh >/dev/null 2>&1
echo -e "[ ${green}INFO$NC ] Downloading & Installing autobackup"
sleep 3
wget https://${akbarvpnnnnnnnn}/set-br.sh >/dev/null 2>&1
chmod +x set-br.sh >/dev/null 2>&1
./set-br.sh >/dev/null 2>&1
# Websocket
echo -e "[ ${green}INFO$NC ] Downloading & Installing SSH Websocket"
sleep 3
wget https://${akbarvpnnnnnnnnn}/edu.sh >/dev/null 2>&1
chmod +x edu.sh >/dev/null 2>&1
./edu.sh >/dev/null 2>&1
# Ohp Server
echo -e "[ ${green}INFO$NC ] Downloading & Installing OHP"
sleep 3
wget https://${akbarvpnnnnnnnnnn}/ohp.sh >/dev/null 2>&1
chmod +x ohp.sh >/dev/null 2>&1
./ohp.sh >/dev/null 2>&1

rm -f /root/ssh-vpn.sh
#rm -f /root/wg.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -r -f domain
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/fer1dev

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
echo -e "[ ${green}INFO$NC ] Finnishing"
sleep 2
wget -O /etc/set.sh "https://${akbarvpn}/set.sh" >/dev/null 2>&1
chmod +x /etc/set.sh >/dev/null 2>&1
history -c
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
importantfile
menu
END
chmod 644 /root/.profile

echo "1.2" > /home/ver
echo " "
echo "Install Udah Selesai Sayank"
echo " "
echo "=============-AutoScript By EtilSsh-=============" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   Info Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 777, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143 "  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 80"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - TrGo                    : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Whatsapp      : 087721815317"  | tee -a log-install.txt
echo "   - City          : Aris Stya Udanawu Blitar" | tee -a log-install.txt
echo "=============-AutoScript By EtilSsh-=============" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
echo ""
rm -f setup.sh
reboot
