source "${HOME}/.local/zgen/zgen.zsh"

function install-default-zgen() {
    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/sublime
    zgen oh-my-zsh plugins/fabric
    zgen oh-my-zsh plugins/fabric
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/bower
    zgen oh-my-zsh plugins/celery
    zgen oh-my-zsh plugins/celery
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/virtualenvwrapper
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/aws

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load unixorn/autoupdate-zgen
    zgen load sharat87/pip-app
    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/tonotdo

 
}

function update-zgen() {
    echo "Overwriting zgen save"
    zgen reset
    install-default-zgen()
    zgen save
}

if ! zgen saved; then
    echo "Creating a zgen save"
   # save all to init script
    install-default-zgen
    zgen save
fi
