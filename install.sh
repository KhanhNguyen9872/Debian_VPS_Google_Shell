#!/bin/sh
#KhanhNguyen9872
#Youtube: https://youtube.com/channel/UCG48mG78znU95DSxyCBffOg
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
echo "Preparing...."
wget -O ngrok-stable-linux-amd64.zip "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/ngrok-stable-linux-amd64.zip?raw=true" > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
sudo mv ./ngrok /bin/ngrok; chmod 777 /bin/ngrok
read -p "INSERT authtoken ngrok: " key
ngrok authtoken $key
echo ""
echo "Installing Linux (Debian amd64)...."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -y > /dev/null 2>&1
sudo apt install libc-bin base-files sysvinit-utils tzdata bazel apt-transport-https sublime-text xfce4 xarchiver firefox-esr mesa-utils git xfce4-goodies pv nmap nano apt-utils dialog terminator autocutsel dbus-x11 dbus neofetch perl p7zip unzip zip curl tar git python3 python3-pip net-tools openjdk-17-jdk openssl libreoffice hardinfo docker-compose tigervnc-standalone-server tigervnc-xorg-extension docker -y
export HOME="$(pwd)"
export DISPLAY=":0"
cd $HOME 2> /dev/null
sudo mkdir ~/.vnc 2> /dev/null
sudo printf '#!/bin/bash\ndbus-launch &> /dev/null\nautocutsel -fork\nxfce4-session\n' > ~/.vnc/xstartup
wget -O startvps.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/startvps.sh" 2> /dev/null
wget -O setupPS.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/setupPS.sh" 2> /dev/null
wget -O vscode.deb "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/vscode_1.66.1_amd64.deb?raw=true" 2> /dev/null
sudo mv ./startvps.sh /bin/startvps 2> /dev/null
sudo rm -rf ~/.bashrc 2> /dev/null
sudo mv ./setupPS.sh ~/.bashrc 2> /dev/null
sudo chmod 777 ~/.vnc/xstartup 2> /dev/null
sudo chmod 777 ~/.bashrc 2> /dev/null
sudo chmod 777 /bin/startvps 2> /dev/null
dpkg -i vscode.deb
rm -rf ./vscode.deb 2> /dev/null
sudo apt update -y > /dev/null 2>&1
sudo apt autoremove -y > /dev/null 2>&1
if [ ! -d /usr/share/themes/Windows-10-Dark-master ] 2> /dev/null; then
  cd /usr/share/themes/ 2> /dev/null
  sudo rm -rf /usr/share/themes/* 2> /dev/null
  wget -O Windows-10-Dark-master.zip "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/Windows-10-Dark-master.zip?raw=true" 2> /dev/null
  unzip -qq Windows-10-Dark-master.zip 2> /dev/null
  rm -f Windows-10-Dark-master.zip 2> /dev/null
fi
cd $HOME 2> /dev/null
clear
printf "\n\n\n - Installation completed!\n Run: [startvps] to start VNC Server!\n\n"
exit 0
