#!/bin/sh

# nvm
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
sudo chmod +x /mnt/c/share/同步空间/nvm/install.sh
sh /mnt/c/share/同步空间/nvm/install.sh

# node
nvm install 16
npm install --global yarn

# 监听文件限制
# echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo "node env set success."



