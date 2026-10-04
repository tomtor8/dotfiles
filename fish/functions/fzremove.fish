# Search and remove installed packages
function fzremove
    pacman -Qq | fzf --multi --header "Remove Package via Pacman" --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
end
