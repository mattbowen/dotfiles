if [[ `uname -s` == "Darwin" ]]; then
    if [[ -e "/usr/local/Cellar/vim/8.0.1500/bin/vim" ]]; then
        alias vim="/usr/local/Cellar/vim/8.0.1500/bin/vim"
    fi
    if [[ -e "/usr/local/Cellar/emacs-plus/25.3/Emacs.app/Contents/MacOS/Emacs" ]]; then
        alias Emacs="/usr/local/Cellar/emacs-plus/25.3/Emacs.app/Contents/MacOS/Emacs"
    fi
    alias "${CMDLEADER}redns"="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
    alias "${CMDLEADER}pwdpbcopy"='echo $PWD | tr -d \n | pbcopy'
    alias "${CMDLEADER}noindex"='touch .metadata_never_index'
fi
