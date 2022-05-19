#!/bin/sh

# tomcat
mkdir /app/apache-tomcat-8.5.59
cp /mnt/c/share/同步空间/java/apache-tomcat-8.5.59.zip /app/apache-tomcat-8.5.59

cd /app/apache-tomcat-8.5.59
unzip ./apache-tomcat-8.5.59.zip
rm ./apache-tomcat-8.5.59.zip

echo "jenv installed success."



