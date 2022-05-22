#!/bin/sh

# jenv
git clone https://github.com/jenv/jenv.git ~/.jenv
# Shell: bash
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile

# jdk1.8
cp /share/jdk/jdk-8u311-linux-x64.tar.gz /app

cd /app
tar -zxvf ./jdk-8u311-linux-x64.tar.gz
rm ./jdk-8u311-linux-x64.tar.gz
jenv add "/app/jdk1.8.0_311"
# jenv local 1.8
# jenv enable-plugin export

echo "jenv installed success."



