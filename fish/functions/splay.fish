function splay
    set -l music_dir "/mnt/sam_ssd/music"
    
    # We use fd to get full paths, then tell fzf to hide the prefix
    set -l selection (fd -e mp3 -e m4a . $music_dir | fzf \
        --header "Select a song" \
        --with-nth 2.. \
        --delimiter "$music_dir/")

    # If a selection was made (not escaped with ESC), play it
    if test -n "$selection"
        kew play "$selection"
    end
end
