# my profile

# alias
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -l -a'
# echo "alias setup finished"

# 输入法
export LC_CTYPE=zh_CN.UTF-8
export XIM=fcitx
export XIM_PROGRAM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
# eval `dbus-launch --sh-syntax --exit-with-session`
# exec fcitx &

source /config/my_profile_auto.sh