source "${HOME}/.local/zgen/zgen.zsh"

if [[ -f "${HOME}/.zshrc.pre.local" ]]; then
    source "${HOME}/.zshrc.pre.local"
else
    export CMDLEADER='' # Necessary for customizations
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
    zgen load zsh-users/zsh-syntax-highlighting
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
for topic in .zsh/*(/); do
    # Source any alises
    . "${topic}/alises.sh"
    # Find and source any functions
    if [[ -d "${topic}/functions" ]]; then
        fpath=("${topic}/functions" $fpath)
        for functionfile in ${topic}/functions/**/*.zsh; do
            . $functionfile
        done
    fi
done

# Key bindings
if [ -n zce ]; then
    bindkey "^Xz" zce
fi

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-word
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    PROMPT_TIME="[%D{%K:%M:%S}]"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$PROMPT_TIME"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
