#!/bin/zsh

# =========================
# 备份
# =========================
# backup
# source /scripts/backup.sh

# =========================
# 初始化
# =========================
# init
source /scripts/init.sh

# =========================
# 启动应用
# =========================
# vncserver
source /scripts/start_vncserver.sh

# office
# dnf install libreoffice -y

echo "centos 7 is successfully started"
echo "back to zsh shell=>"
zsh