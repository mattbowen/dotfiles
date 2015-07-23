# Initialize other CLI utils that don't fit in another topic

# Get Z going for quick CLI jumping
if hash brew 2>/dev/null; then
    if [[ -f `brew --prefix`/etc/profile.d/z.sh ]]; then
        . `brew --prefix`/etc/profile.d/z.sh
    fi
fi

