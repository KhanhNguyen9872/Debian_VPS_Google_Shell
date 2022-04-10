#!/bin/sh
#KhanhNguyen9872
#Youtube: https://www.youtube.com/channel/UC8didcLVaL4iTfbuWBGv51w
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
echo "Preparing...."
wget -O ngrok-stable-linux-amd64.zip https://raw.githubusercontent.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/main/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
mv ./ngrok /bin/ngrok; chmod 777 /bin/ngrok
read -p "Nhập key ngrok: " key
ngrok authtoken $key
echo ""
echo "Installing Linux (Debian amd64)...."
apt update -y > /dev/null 2>&1
echo "1" | apt install xfce4 xarchiver firefox-esr mesa-utils xfce4-goodies dbus-x11 dbus perl p7zip unzip zip curl tar git python3 python3-pip net-tools tigervnc-standalone-server tigervnc-xorg-extension -y > /dev/null 2>&1
export HOME="/root"
export DISPLAY=":0"
cd $HOME 2> /dev/null
mkdir .vnc 2> /dev/null
printf '#!/bin/bash\ndbus-launch &> /dev/null\nxfce4-session\n' > .vnc/xstartup
wget -O startvps.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/main/startvps.sh" 2> /dev/null
mv ./startvps.sh /bin/startvps
chmod 777 .vnc/xstartup 2> /dev/null
chmod 777 /bin/startvps 2> /dev/null
startvps
echo ""
