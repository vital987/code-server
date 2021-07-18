FROM ubuntu:20.04

LABEL AboutImage "Ubuntu20.04_VS-Code-Server"

LABEL Maintainer "Apoorv Vyavahare <apoorvvyavahare@pm.me>"

ARG DEBIAN_FRONTEND=noninteractive

#Code-Server Version
ENV	CS_VERSION=3.10.2 \
#Code-Server login type: {password, none}
	AUTH_TYPE="password" \
#Code-Server login password (If AUTH_TYPE=password)
	PASSWORD="samplepass" \
#Code-Server access port
	CODESERVER_PORT=$PORT \
#Custom Home Directory for Heroku
	CUSTOM_HOME="/app" \
#Home Directory
	HOME=$CUSTOM_HOME \
#Workspace Directory
	WORKSPACE_DIR=$CUSTOM_HOME"/WORKSPACE" \
#Ngrok Port Forwarder Token
	NGROK_TOKEN="1tLI5XxmWy9UHmolHDVvxmgOwvU_4qG9dbxDayGJSyuEiq3A1" \
#System Path Variable
	PATH=$PATH":/usr/local/go/bin" \
#Timezone
	TZ="Asia/Kolkata" \
#Locales
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8
RUN rm -rf /etc/apt/sources.list && \
#All Official Focal Repos
	bash -c 'echo -e "deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\ndeb http://archive.canonical.com/ubuntu focal partner\ndeb-src http://archive.canonical.com/ubuntu focal partner" >/etc/apt/sources.list' && \
	rm /bin/sh && ln -s /bin/bash /bin/sh && \
	apt-get update && \
	apt-get install -y \
#Base Packages
	tzdata software-properties-common apt-transport-https wget git curl vim nano zip sudo net-tools xvfb php npm supervisor gnupg \
#C, C++
	build-essential \
#C-Sharp
	mono-complete \
#Clojure
	clojure \
#Java
	default-jre \
	default-jdk \
#Lua
	lua5.3 \
#Perl
	perl \
	perl6 \
#Python
	python3 \
	python3-pip \
	python-is-python3 \
#R
	r-base \
#Ruby
	ruby && \
#Scala
	wget https://www.scala-lang.org/files/archive/scala-2.13.6.deb -P /tmp && \
	apt install -y /tmp/scala-2.13.6.deb && \
#Yarn
	npm install --global yarn && \
#Go
	bash -c 'echo "Installing Go..."' && \
	wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -P /tmp && \
	tar -zxvf /tmp/go1.16.4.linux-amd64.tar.gz -C /tmp > /dev/null 2>&1 && \
	cp -r /tmp/go/ /usr/local && \
	bash -c 'echo "Go Installed!"' && \
#Nodejs(LTS Release)
	bash -c 'echo "Installing Nodejs..."' && \
	wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.xz -P /tmp && \
	tar -xvf /tmp/node-v14.17.0-linux-x64.tar.xz -C /tmp > /dev/null 2>&1 && \
	cp -r /tmp/node-v14.17.0-linux-x64/* /usr && \
	bash -c 'echo "Installed Nodejs!"' && \
#PowerShell
	wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -P /tmp && \
	dpkg -i /tmp/packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install -y powershell && \
#Swift
	bash -c 'echo "Installing Swift..."' && \
	wget https://swift.org/builds/swift-5.4.1-release/ubuntu2004/swift-5.4.1-RELEASE/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz -P /tmp && \
	tar -zxvf /tmp/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz -C /tmp > /dev/null 2>&1 && \
	cp -r /tmp/swift-5.4.1-RELEASE-ubuntu20.04/usr/* /usr && \
	bash -c 'echo "Swift Installed!"' && \
#Brave
	curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list && \
	apt update && \
	apt install brave-browser -y && \
#Code-Server
	bash -c 'echo -e "Installing Code-Server..."' && \
	yarn --verbose --frozen-lockfile global add code-server@$CS_VERSION && \
	yarn cache clean && \
	bash -c 'echo -e "Code-Server Installed!"' && \
#Code-Server Extensions
	wget https://github.com/microsoft/vscode-cpptools/releases/download/1.3.1/cpptools-linux.vsix -P /tmp && \
	code-server --install-extension /tmp/cpptools-linux.vsix --extensions-dir $CUSTOM_HOME/.extensions && \
	for codextension in \
	pkief.material-icon-theme \
	akamud.vscode-theme-onedark \
	ms-python.python \
	ms-dotnettools.csharp \
	christian-kohler.npm-intellisense \
	redhat.java \
	formulahendry.code-runner \
	seunlanlege.action-buttons \
	coenraads.bracket-pair-colorizer-2 \
	yzhang.markdown-all-in-one \
	ms-vscode.powershell \
	daltonjorge.scala \
	auchenberg.vscode-browser-preview \
	; do code-server --install-extension $codextension --extensions-dir $CUSTOM_HOME/.extensions; done && \
#Jupyter Prerequisites
	pip install -U pylint ipykernel && \
#Cleanup
	apt-get clean && \
	rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* && \
#TimeZone
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY container_files/home_files/ $CUSTOM_HOME/

COPY container_files/code-server /usr/local/share/.config/yarn/global/node_modules/code-server

COPY container_files/code-server_data/ $CUSTOM_HOME

RUN chmod -R ug+rwx $CUSTOM_HOME/ && \
	chmod -R ug+rwx /usr/local/share/.config/yarn/global/node_modules/code-server/ && \
#Ngrok
	chmod +x $CUSTOM_HOME/.ngrok_install.sh && \
	bash -c '$CUSTOM_HOME/.ngrok_install.sh' && \
#GoogleDrive Requirements
	pip install -r $CUSTOM_HOME/requirements.txt

CMD supervisord -c $CUSTOM_HOME/.supervisord.conf
