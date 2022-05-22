# portable-centos-7-workstation

# how to run

```bash
docker-compose up -d
```

then，all of your workspace is ready now!

# how to connect xfce4 desktop via vnc

open `realvnc-viewer` , and type

```bash
localhost:1
```

enter.

That's all.

Enjory!

# how to Recover apps and workstation

copy apps to app forder, like

```
# macOS
cp -r /Users/terwer/Documents/share/portable-linux-sync/app ./centos-7-vnc

# windows
cp -r /mnt/c/share/同步空间/portable-linux-sync/app ./centos-7-vnc

# then
cd /app
./install_all.sh
./set_env_all.sh
```

after that, `jdk` , `node` , `yarn` all are ok.also, `tomcat7` , `tomcat8` , `idea2021` , `idea2022` all are here.

test

```bash
java -version
node -v
npm -v
yarn -v
```

copy workspace files to workspace forder, like

```
# macOS
cp -r /Users/terwer/Documents/share/portable-linux-sync/workspace ./centos-7-vnc

# windows
cp -r /mnt/c/share/同步空间/portable-linux-sync/workspace ./centos-7-vnc
```

then visit then via

```
/app
/workspace
```

# how to set env

change file `config/my_config.sh`, then RESTART project via `docker-compose up -d`,that's all.