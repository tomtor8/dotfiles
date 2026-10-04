function wayland_translate --description "Translate selected Wayland text and display via Fuzzel"
    # 1. Grab the current primary selection (text you highlighted with the mouse)
    # If primary is empty, fall back to the standard clipboard
    set -l text (wl-paste --primary 2>/dev/null)
    if test -z "$text"
        set text (wl-paste 2>/dev/null)
    end

    # Exit early if no text is found to avoid opening an empty popup
    if test -z "$text"
        return 1
    end

    # 2. Run Translate Shell
    # '-b' gives brief output, ':es' targets Spanish (change to :ru, :hu, etc., as needed)
    # 'no-ansi' ensures no weird raw color escape codes break Fuzzel's rendering
    # set -l translation (trans -d --show-original n --show-languages n --show-prompt-message n -no-ansi es:en "$text")
    set -l translation (trans -b -no-ansi es:en "$text")

    # Send to Mako notification daemon
    # notification stays on
    notify-send -u critical "Translation" "$translation"
end
