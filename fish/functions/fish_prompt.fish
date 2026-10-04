function fish_prompt
    set -l last_status $status
    set -l stat

    # space between prompt, does not work fine for python venv
    echo ""
    # 1. Handle Vi Mode Logic
    set -l mode_color
    set -l mode_char ">"

    switch $fish_bind_mode
        case default
            set mode_color (set_color --bold red)
            set mode_char 
        case replace_one
            set mode_color (set_color --bold cyan)
            set mode_char 󰺕
        case visual
            set mode_color (set_color --bold magenta)
            set mode_char 󰮕
        case '*'
            set mode_color (set_color --bold green)
            set mode_char 
    end

    # 2. Status and Path
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status] "(set_color normal)
    end

    # 3. Output Single Line
    # Formats as: [Status] Path (Git) ModeChar
    echo -n -s $stat (set_color blue)(prompt_pwd) (set_color yellow)(fish_vcs_prompt) \n$mode_color $mode_char (set_color normal) " "
end
