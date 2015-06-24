echo "Sourcing osx aliases"
if [[ `uname -s` == "Darwin" ]]; then
    if [[ -f "/usr/local/Cellar/vim/7.4.712/bin/vim" ]]; then
        alias vim="/usr/local/Cellar/vim/7.4.712/bin/vim"
    fi
fi
