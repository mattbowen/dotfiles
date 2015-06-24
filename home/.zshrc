source "${HOME}/.local/zgen/zgen.zsh"
export CMDLEADER='' # Necessary for customizations, override in .pre.local
if [[ -f "${HOME}/.zshrc.pre.local" ]]; then
    source "${HOME}/.zshrc.pre.local"
fi

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
    zgen load hchbaw/opp.zsh
    zgen load chrissicool/zsh-256color
    zgen load s7anley/zsh-geeknote
    zgen load marzocchi/zsh-notify
    zgen load ascii-soup/zsh-url-highlighter
    zgen load caarlos0/zsh-add-upstream
    zgen load tarruda/zsh-autosuggestions

    # theme
    zgen oh-my-zsh themes/tonotdo

    # completions
    zgen load zsh-users/zsh-completions src

}

function ,zgen-update() {
    echo "Overwriting zgen save"
    zgen reset && source ~/.zshrc
}

if ! zgen saved; then
    echo "Creating a zgen save"
   # save all to init script
    install-default-zgen
    zgen save
fi

# Auto-load topics
for topic in ~/.zsh/*(/); do
    local topicname=${topic:t}
    # Source any alises
    if [[ -e "${topic}/aliases.zsh" ]]; then
        source "${topic}/aliases.zsh"
    fi
    # Find and source any functions
    if [[ -d "${topic}/functions" ]]; then
        fpath=("${topic}/functions" $fpath)
        for functionfile in ${topic}/functions/**/*.zsh; do
            source $functionfile
        done
    fi
    if [[ -e "${topic}/${topicname}.zsh" ]]; then
        source ${topic}/${topicname}.zsh
    fi
done

# My personal, basic defaults
export EDITOR=vim
export SHELL=zsh

# Overrides for anything defined in topics or above goes in
# ~/.zshrc.local
if [[ -f "${HOME}/.zshrc.local" ]]; then
    source "${HOME}/.zshrc.local"
fi
