# Search and install packages
function fzinstall
    pacman -Slq | fzf --multi --header "Install Packages via Pacman" --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
end
