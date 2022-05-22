#!/bin/sh

# update code
# yum upgrade
# yum update

# update git
# 移除旧的git
sudo yum -y remove git
# 添加repository
sudo yum install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm -y
# 安装新的git
sudo yum upgrade git -y
sudo yum -y install git

git config --global user.name tangyw
git config --global user.email tangyw@landray.com.cn

# git config user.name terwer
# git config user.email youweics@163.com

# ssh-keygen -t rsa -C 'tangyw@landray.com.cn'
# ssh-keygen -t rsa -C 'youweics@163.com'

# Host github.com
#     HostName ssh.github.com
#     User youweics@163.com
#     PreferredAuthentications publickey
#     IdentityFile ~/.ssh/id_rsa_wsl_github
#     Port 443 
# Host git.landray.com.cn
#     HostName git.landray.com.cn
#     User tangyw
#     PreferredAuthentications publickey
#     IdentityFile ~/.ssh/id_rsa_wsl_landray

echo "update success."



