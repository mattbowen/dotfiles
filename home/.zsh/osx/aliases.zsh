if [[ `uname -s` == "Darwin" ]]; then
    if [[ -e "/usr/local/Cellar/vim/7.4.712/bin/vim" ]]; then
        alias vim="/usr/local/Cellar/vim/7.4.712/bin/vim"
    fi
    if [[ -e "/opt/homebrew-cask/Caskroom/emacs-mac/emacs-24.5-z-mac-5.8/Emacs.app/Contents/MacOS/Emacs.sh" ]]; then
        alias Emacs="/opt/homebrew-cask/Caskroom/emacs-mac/emacs-24.5-z-mac-5.8/Emacs.app/Contents/MacOS/Emacs.sh"
    fi
fi
