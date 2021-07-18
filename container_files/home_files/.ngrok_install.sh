#!/bin/bash
if [ -z "$NGROK_TOKEN" ]
then
	echo "[!] Token not found, skipping installation..."
	rm -rf $CUSTOM_HOME/$0
else
	echo -e "[+] Token found, installing Ngrok..."
	wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -P /tmp > /dev/null 2>&1
	unzip /tmp/ngrok-stable-linux-amd64.zip -d /usr/local/ > /dev/null 2>&1
	ngrok authtoken $NGROK_TOKEN > /dev/null 2>&1
	mv /root/.ngrok2 /
	rm -rf $CUSTOM_HOME/$0
fi
