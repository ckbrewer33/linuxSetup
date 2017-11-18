#!/bin/bash

# Google Chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

dnf install -y google-chrome-stable

# node
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
dnf -y install nodejs

# VS Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf -y check-update
dnf -y install code

# Sublime Text 3
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
dnf -y install sublime-text

# Brave
dnf config-manager --add-repo https://s3-us-west-2.amazonaws.com/brave-rpm-release/x86_64/
rpm --import https://s3-us-west-2.amazonaws.com/brave-rpm-release/keys.asc
dnf -y install brave

# Docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install docker-ce
systemctl start docker

  	# Plex
	docker pull linuxserver/plex
	docker create \
		--name=plex \
		--net=host \
		--restart=always \
		-e VERSION=latest \
		-e PUID=1001 -e PGID=1001 \
		-e TZ=America/Denver \
		-v /home/docker/plex/config:/config \
		-v /mnt/MediaServer2/TV:/data/tvs \
		-v /mnt/MediaServer2/Movies:/data/movies \
		-v /mnt/MediaServer2/"Micky Mouse Clubhouse":/data/mickey \
		linuxserver/plex

