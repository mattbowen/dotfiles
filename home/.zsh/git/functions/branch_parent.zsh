function branch_parent () {
    echo `git log -g --grep-reflog="checkout: moving from .* to $(current_branch)" --pretty=oneline | tail -1 | sed -E -e"s/.*moving from (.*) to.*/\1/" | tr -d '\n'`
}

autoload -U branch_parent

