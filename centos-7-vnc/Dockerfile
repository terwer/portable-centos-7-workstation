# 依赖的镜像
FROM terwer/centos-with-dev-env:1.0.0

# 镜像创建者的信息
LABEL maintainer="Terwer Green <youweics@163.com>"

# 环境变量
ENV TZ=Asia/Shanghai \
    TZ=CST-8

# 权限调整
RUN chown terwer: /home/terwer
RUN chown -R terwer: /home/terwer/*

# 备份镜像源
RUN rm -rf /etc/yum.repos.d/bak \
    mkdir /etc/yum.repos.d/bak \
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak  
    
# 添加中科大centos7镜像源
COPY /env/CentOS-Base.repo /etc/yum.repos.d
RUN yum makecache \
    && yum clean all

# cleanup
 RUN rm /home/terwer/.zshrc \
     && rm /home/terwer/.zsh_history \
     && rm /home/terwer/.zcompdump-*

# 切回普通用户
USER terwer

# 容器入口
COPY ./entrypoint.sh /entrypoint.sh
CMD ["bash", "/entrypoint.sh"]

