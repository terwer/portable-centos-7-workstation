# .bash_profile

# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc
# fi

# User specific environment and startup programs
# PATH=$PATH:$HOME/.local/bin:$HOME/bin
# export PATH

echo "~/.bash_profile setup finished."
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
