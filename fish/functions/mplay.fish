function mplay --description "Minimalist mpv music player"
    mpv --no-video \
        --msg-level=all=status \
        --term-osd-bar=no \
        --term-status-msg=' \r\033[K[] %p %{time-pos} / %{duration} []  ${metadata/title}' \
        --directory-mode=recursive \
        --shuffle \
        $argv
end
