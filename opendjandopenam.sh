#!/bin/bash
# 更新并安装必要的软件
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk wget

# 下载并安装 OpenDJ
wget https://download.forgerock.org/downloads/opendj/3.0.0/opendj-3.0.0.zip
unzip opendj-3.0.0.zip -d /opt
/opt/opendj/setup --cli --baseDN "dc=example,dc=com" --ldapsPort 636 --adminConnectorPort 4444 --rootUserDN "cn=Directory Manager" --rootUserPassword password --acceptLicense --no-prompt

# 下载并安装 OpenAM
wget https://download.forgerock.org/downloads/openam/13.5.0/openam13.5.0.war
sudo mkdir -p /opt/tomcat/webapps
sudo mv openam13.5.0.war /opt/tomcat/webapps/openam.war

# 启动 Tomcat 并部署 OpenAM
sudo /opt/tomcat/bin/startup.sh
