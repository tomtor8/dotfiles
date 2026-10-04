function fzlist
    # Uses 'pacman -Q' to show name and version
    pacman -Q | fzf --header "Installed Packages (Read-Only)" \
        --preview 'pacman -Qi (echo {1})' \
        --bind 'enter:execute(pacman -Qi (echo {1}) | less)'
end
