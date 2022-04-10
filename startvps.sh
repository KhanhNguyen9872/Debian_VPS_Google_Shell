#!/bin/bash
cd ~/ 2> /dev/null
unset DBUS_LAUNCH
export HOME="$(pwd)"
export DISPLAY=":0"
nohup ngrok tcp -region=ap 5900 &>/dev/null &
vncserver -kill :0
sudo rm -rf /tmp/* 2> /dev/null
vncserver :0
clear
printf "\nYour IP Here: "
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
printf "\n\n"
