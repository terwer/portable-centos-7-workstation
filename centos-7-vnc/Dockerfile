# 依赖的镜像
FROM centos/systemd

# 镜像创建者的信息
LABEL maintainer="Terwer Green <youweics@163.com>"

# 环境变量
ENV TZ=Asia/Shanghai \
    TZ=CST-8

# ===================================
# 镜像源设置开始
# ===================================
# 添加中科大centos7镜像源
RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak \
    && sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo

RUN yum makecache \
    && yum clean all

## ===================================
## 安装开发工具包、系统软件
## ===================================
# 安装epel源
RUN yum install epel-release -y

# 安装DNF
RUN yum install dnf -y
# 安装dnf插件及neofetch
RUN dnf install dnf-plugins-core -y
RUN dnf copr enable konimex/neofetch -y
RUN dnf install neofetch -y

# 安装开发工具
RUN dnf groupinstall "Development Tools" -y

RUN dnf groupinstall "X Window System" -y \
    && dnf groupinstall xfce -y \
    && dnf install pixman pixman-devel libXfont -y

# 升级git2
RUN dnf install \
    https://repo.ius.io/ius-release-el7.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    -y
RUN yum remove git -y
RUN yum install git224 -y

# 安装字体
RUN dnf -y groupinstall "fonts"

# 安装vncserver
RUN dnf install tigervnc-server -y

# 安装其他工具包
RUN dnf install sudo \
    vim \
    net-tools \
    wget \
    -y

# 安装zsh
RUN dnf install zsh -y

# 创建普通用户
RUN useradd --create-home --no-log-init --shell /bin/zsh -G root terwer
RUN echo 'terwer:123456' | chpasswd
RUN echo 'root:password' | chpasswd
RUN chown -R terwer:terwer /home

# ==========================
# zsh以及环境变量
# ==========================
# 给root用户安装oh-my-zsh
RUN git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && git clone https://gitee.com/playerfs/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://gitee.com/playerfs/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc \
    && chsh -s /bin/zsh

USER terwer
# 为普通用户再安装一次oh-my-zsh
RUN git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && git clone https://gitee.com/playerfs/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://gitee.com/playerfs/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc
# 添加自定义环境变量
RUN echo "source /config/my_profile.sh" >> ~/.zshrc

USER root
# ===============================
# 安装一些其他软件
# ==============================
# 浏览器
RUN dnf install firefox -y
# emacs
RUN dnf install emacs -y
# gedit
RUN dnf install gedit -y

# ibus中文输入法
# RUN dnf install ibus.x86_64 -y \
#     && dnf install ibus-libpinyin.x86_64 -y \
#     && dnf install im-chooser.x86_64 -y 
# RUN dnf install ibus-setup \
# libusbmuxd \
# ibus-libs \
# ibus-kkc \
# ibus-gtk3 \
# libuser-python \
# libusbx \
# ibus-gtk2 \
# ibus-table-chinese \
# libuser \
# ibus \
# ibus-table \
# libusal \
# ibus-libpinyin \
# -y

# fcitx输入法
RUN dnf remove ibus -y
RUN dnf remove imsettings imsettings-libs im-chooser -y
RUN dnf install fcitx fcitx-pinyin fcitx-configtool -y

# 更新软件
RUN yum -y upgrade
# 安装中文包
RUN yum install -y kde-l10n-Chinese
# 重新安装glibc-common
RUN yum -y reinstall glibc-common
# 编译生成语言库
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
# 设置语言默认值为中文，时区改为东八区
RUN echo 'LANG="zh_CN.UTF-8"' > /etc/locale.conf
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# =================================
# 从这里开始操作不再拥有ROOT权限
# =================================
# 切回普通用户
USER terwer

# 容器入口
COPY ./entrypoint.sh /entrypoint.sh
CMD ["zsh", "/entrypoint.sh"]
