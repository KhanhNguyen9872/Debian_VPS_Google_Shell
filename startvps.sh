#!/bin/bash
nohup ngrok tcp -region=ap 5900 &>/dev/null &
clear
printf "\nYour IP Here: "
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
printf "\n\n"
