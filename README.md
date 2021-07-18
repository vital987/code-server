<p align="center">
  <a href="code.visualstudio.com"><img alt="VSCode Logo" src="https://secrethub.io/img/vs-code.svg" width="100px" > &nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="https://coder.com/"><img alt="Coder Logo" src="https://i.imgur.com/UCqOwFC.png" width="130px" height="95px" /></a>
  <h1 align="center">Visual Studio Code Server</h1>
</p>

[![Debian Version](https://img.shields.io/static/v1?label=Debian&message=10&color=E95420&logo=Debian)]() [![Maintainer](https://img.shields.io/static/v1?label=Maintainer&message=apoorvvyavahare@pm.me&color=1e90ff)]() [![Maintainance](https://img.shields.io/badge/Maintenance-inactive-yellow.svg)]() [![Pulls](https://img.shields.io/docker/pulls/vital987/code-server.svg)](https://hub.docker.com/r/vital987/code-server) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)]()<br>[![VS Code](https://img.shields.io/static/v1?label=VSCode&message=v1.57&color=1e90ff&logo=visual-studio-code&logoColor=1e90ff)]()<br>[![CodeServer](https://img.shields.io/static/v1?label=CodeServer&message=v3.11.0&color=34AD7A&logo=visual-studio-code&logoColor=34AD7A)]()<br><a href="https://heroku.com/deploy?template=https://github.com/vital987/code-server" target="_blank"><img src="https://www.herokucdn.com/deploy/button.svg"></a>

## Table of contents :
  * [Specifications](#specifications-)
  * [Environment Variables](#environment-variables-)
  * [Installation](#installation-)
  * [Usage](#usage-)
  * [Screenshots](#screenshots-)
  * [Credits](#credits-)

## Specifications : 
  * **Theme : Atom One Dark**
  * **Icon Theme : Material Icon Theme**
  * **Font : Monospace**
  * **Extensions Installed :**
    * Bracket Pair Colorizer 2
    * C# Intellisense
    * C/C++ Intellisense
    * Code Runner
    * Draw.io Integration
    * Language Support for Java(TM) by Red Hat
    * Markdown All in One
    * NPM Intellisense
    * PowerShell
    * Python Intellisense
    * VSCode Action Buttons
    * Rust-Lang
  * **Google Drive Upload**
  * **Languages Installed :**<br><br>
     [![C](https://img.shields.io/static/v1?label=C&message=%20&logo=c)]()&nbsp; [![C++](https://img.shields.io/static/v1?label=C%2b%2b&message=%20&logo=c%2b%2b&logoColor=1e90ff&color=1e90ff)]()&nbsp; [![C Sharp](https://img.shields.io/static/v1?label=C%23&message=%20&logo=c-sharp&logoColor=green&color=green)]()&nbsp; [![Clojure](https://img.shields.io/static/v1?label=Clojure&message=%20&logo=clojure&logoColor=brightgreen&color=brightgreen)]()&nbsp; [![Go](https://img.shields.io/static/v1?label=Go&message=%20&logo=go&logoColor=1e90ff&color=1e90ff)]()&nbsp; [![Java](https://img.shields.io/static/v1?label=Java&message=%20&logo=java&logoColor=f89820&color=f89820)]()&nbsp; [![Javascript](https://img.shields.io/static/v1?label=Javascript&message=%20&color=f7df1e&logo=javascript&logoColor=f7df1e)]()&nbsp; [![Lua](https://img.shields.io/static/v1?label=Lua&message=%20&color=blueviolet&logo=lua&logoColor=9638E7)]()&nbsp; [![Perl](https://img.shields.io/static/v1?label=Perl&message=%20&logo=perl&logoColor=cc99ff&color=cc99ff)]()&nbsp; [![PowerShell](https://img.shields.io/static/v1?label=PowerShell&message=%20&logo=powershell&color=03A9F4&logoColor=03A9F4)]()&nbsp; [![Python](https://img.shields.io/static/v1?label=Python&message=%20&logo=python&color=blue)]()&nbsp; [![R](https://img.shields.io/static/v1?label=R&message=%20&logo=r&logoColor=blue&color=blue)]()&nbsp; [![Raku](https://img.shields.io/static/v1?label=Raku&message=%20&color=red&logo=perl&logoColor=red)]()&nbsp; [![Ruby](https://img.shields.io/static/v1?label=Ruby&message=%20&logo=ruby&logoColor=9b111e&color=9b111e)]()&nbsp; [![Shellscript](https://img.shields.io/static/v1?label=Shellscript&message=%20&color=4eaa25&logo=gnu-bash&logoColor=4eaa25)]()&nbsp; [![Scala](https://img.shields.io/static/v1?label=Scala&message=%20&color=red&logo=scala&logoColor=red)]()&nbsp; [![Swift](https://img.shields.io/static/v1?label=Swift&message=%20&color=red&logo=swift&logoColor=red)]()

## **Environment Variables :**
| CS_VERSION | 3.11.0 |
|:-:|:-:|
| AUTH_TYPE | Code-Server login type: {password, none} |
| PASSWORD | Code-Server login password (If AUTH_TYPE=password) |
| CODESERVER_PORT | Code-Server web access port |
| CUSTOM_HOME | Custom home directory for Heroku |
| WORKSPACE_DIR | Code-Server working directory |
| NGROK_TOKEN | Ngrok Token |

## **Installation :**
* **For Heroku Users :**
  * Hit the Heroku Deploy button on the forked repo's readme.
  * [ ! ] Set ```AUTH_TYPE``` value to ```none``` if you dont want any login password prompt.
* **For Non-Heroku Users :**
    Edit & Run Command :
      ```
      docker run --name code-server \
      -e AUTH_TYPE="password" \
      -e PASSWORD="samplepass" \
      -e CODESERVER_PORT="9870" \
      -e NGROK_TOKEN="<YOUR NGROK TOKEN>" \
      -d -p 8080:9870 vital987/code-server && \
      ```
      [ ! ] Set ```AUTH_TYPE``` value to ```none``` if you dont want any login password prompt.

## **Usage :**
  * Open the heroku app URL, non-heroku users, port-forward the <HOST HTTP PORT> using Ngrok: ```ngrok http $CODESERVER_PORT```
  * Login with the password (value of $PASSWORD).
  * Buttons present at the bottom bar :
    * **↻** : Refresh the buttons.
    * **ClearWorkspace :** Deletes all the folders in workspace directory.
    * **ResetWorkspace :** Resets the workspace folder with all sample  files.
    * [ ! ] The buttons need to be refreshed everytime after use.
  
## **Screenshots :**
  * ![SS1](https://i.imgur.com/Wx3cZXz.png)
  * ![SS2](https://imgur.com/nBYSJqq.png)
  
## **Credits :**
  * **Coder** : [Website](https://coder.com), [Github](https://github.com/cdr)
  * **vital987** : [Github](https://github.com/vital987)
  * **nv2k3** : [Github](https://github.com/nv2k3)
