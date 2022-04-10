#!/bin/sh
#KhanhNguyen9872
#Youtube: https://www.youtube.com/channel/UC8didcLVaL4iTfbuWBGv51w
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
echo "Preparing...."
wget -O ngrok-stable-linux-amd64.zip "https://github.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/blob/main/ngrok-stable-linux-amd64.zip?raw=true" > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
sudo mv ./ngrok /bin/ngrok; chmod 777 /bin/ngrok
read -p "Nhập key ngrok: " key
ngrok authtoken $key
echo ""
echo "Installing Linux (Debian amd64)...."
sudo apt update -y > /dev/null 2>&1
sudo apt install xfce4 xarchiver firefox-esr mesa-utils git xfce4-goodies pv nano apt-utils dialog terminator autocutsel dbus-x11 dbus neofetch perl p7zip unzip zip curl tar git python3 python3-pip net-tools tigervnc-standalone-server tigervnc-xorg-extension -y
export HOME="$(pwd)"
export DISPLAY=":0"
cd $HOME 2> /dev/null
sudo mkdir ~/.vnc 2> /dev/null
sudo printf '#!/bin/bash\ndbus-launch &> /dev/null\nxfce4-session\nautocutsel -fork\n' > ~/.vnc/xstartup
wget -O startvps.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/main/startvps.sh" 2> /dev/null
wget -O setupPS.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/main/setupPS.sh" 2> /dev/null
wget -O vscode.deb "https://github.com/KhanhNguyen9872/Ubuntu_VPS_Google_Shell/blob/main/app/vscode_1.66.1_amd64.deb?raw=true" 2> /dev/null
sudo mv ./startvps.sh /bin/startvps 2> /dev/null
sudo mv ./setupPS.sh ~/.bashrc 2> /dev/null
sudo chmod 777 ~/.vnc/xstartup 2> /dev/null
sudo chmod 777 ~/.bashrc 2> /dev/null
sudo chmod 777 /bin/startvps 2> /dev/null
dpkg -i vscode.deb
rm -rf ./vscode.deb 2> /dev/null
printf "\n\n\n - Installation completed!\n Run: [startvps] to start VNC Server!\n\n"
exit 0
