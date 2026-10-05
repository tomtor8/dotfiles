#!/usr/bin/env fish

# Path to your dotfiles directory
set -l DOTFILES $HOME/.local/share/dotfiles

# Machine identifier: directly read system hostname (e.g., nucarch, hp13arch, hp16arch)
set -l HOST (hostnamectl hostname)

echo "==> Running dotfiles setup for host: $HOST"

# Directory & File mappings: "repo_path:target_path"
set -l links \
    "$DOTFILES/fish/config.fish:$HOME/.config/fish/config.fish" \
    "$DOTFILES/fish/functions:$HOME/.config/fish/functions" \
    "$DOTFILES/bat/config:$HOME/.config/bat/config" \
    "$DOTFILES/btop/btop.conf:$HOME/.config/btop/btop.conf" \
    "$DOTFILES/fastfetch/config.jsonc:$HOME/.config/fastfetch/config.jsonc" \
    "$DOTFILES/foot/foot.ini:$HOME/.config/foot/foot.ini" \
    "$DOTFILES/fuzzel/fuzzel.ini:$HOME/.config/fuzzel/fuzzel.ini" \
    "$DOTFILES/kitty/kitty.conf:$HOME/.config/kitty/kitty.conf" \
    "$DOTFILES/imv/config:$HOME/.config/imv/config" \
    "$DOTFILES/gtk/gtk.css:$HOME/.config/gtk-3.0/gtk.css" \
    "$DOTFILES/gtk/gtk.css:$HOME/.config/gtk-4.0/gtk.css" \
    "$DOTFILES/gtk/settings.ini:$HOME/.config/gtk-3.0/settings.ini" \
    "$DOTFILES/gtk/settings.ini:$HOME/.config/gtk-4.0/settings.ini" \

for item in $links
    set -l parts (string split ":" $item)
    set -l base_src $parts[1]
    set -l dest $parts[2]

    # Look for host-specific variant for files (e.g., config.fish.nucarch)
    set -l host_src "$base_src.$HOST"
    set -l actual_src $base_src

    if test -e $host_src
        set actual_src $host_src
    else if not test -e $base_src
        echo "[WARN] Neither $host_src nor $base_src exists. Skipping..."
        continue
    end

    # Ensure parent directory exists
    mkdir -p (dirname $dest)

    # Handle existing destination
    if test -e $dest -o -L $dest
        # Check if destination is already a valid symlink pointing to the exact target
        if test -L $dest; and test (realpath $dest) = (realpath $actual_src)
            echo "[OK] Symlink already up to date: $dest"
            continue
        end

        # Prompt user before backing up or replacing the item
        echo -n "[PROMPT] Existing item found at $dest. Replace with symlink? (y/N): "
        read -l confirm

        # Default to No if input is empty or not 'y' / 'Y'
        if not string match -rq '^[yY]$' -- "$confirm"
            echo "[SKIP] Skipped $dest"
            continue
        end

        # Back up existing real directory or file
        set -l backup "$dest.bak"
        echo "[BACKUP] Moving existing item $dest -> $backup"
        mv -f $dest $backup
    end

    # Force symlink creation (-s: symlink, -f: force, -v: verbose)
    echo "Linking -> $actual_src to $dest"
    ln -sfv $actual_src $dest
end
