#!/bin/bash

cd /opt

# Install required packages
apt update -y
apt install -y openjdk-21-jdk unzip wget

# Verify Java
java -version

# Download SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.9.0.129388.zip

# Extract
unzip sonarqube-26.9.0.129388.zip

# Create sonar user if not exists
id sonar >/dev/null 2>&1 || useradd -m -s /bin/bash sonar

# Create sonar home directory
mkdir -p /home/sonar

# Set sonar home ownership
chown sonar:sonar /home/sonar

# Set SonarQube ownership
chown -R sonar:sonar /opt/sonarqube-26.9.0.129388

# Give execute permission to SonarQube scripts
chmod +x /opt/sonarqube-26.9.0.129388/bin/linux-x86-64/*.sh

echo "SonarQube ownership and permissions configured."

# Switch to sonar user
su - sonar

# ===================

above script automatically root privilege se chalega, kyunki poori script root se execute ho rahi hai.

Phir last line:

su - sonar

ke baad tum sonar user me aa jaoge:

sonar@server:~$

Then:

cd /opt/sonarqube-26.9.0.129388/bin/linux-x86-64
./sonar.sh start
./sonar.sh status

=======
curl -I http://localhost:9000
========================================
front-server-01@hostname:~$ sudo -s
root@hostname:/home/front-server-01#

root@hostname:/home/front-server-01# hostnamectl set-hostname sonar

root@hostname:/home/front-server-01# sudo -i
root@sonar:~#

root@sonar:~# vi sonar.sh
root@sonar:~# ls
snap  sonar.sh

before run need to remember
