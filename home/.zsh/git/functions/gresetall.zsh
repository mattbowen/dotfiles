function ${CMDLEADER}gresetall () {
    for i in `git status | grep modified: |sed -E -e"s/modified: *//" | tr -d '\n' | sed -E -e"s/[[:space:]]+/ /g" | sed -E -e"s/^ //"`; do
        git checkout -- $i
    done
}

