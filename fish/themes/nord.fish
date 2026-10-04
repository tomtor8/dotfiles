# custom command color
set -g fish_color_command 88c0d0

# Nord Pager Theme for Fish Shell
set -g fish_pager_color_prefix 88c0d0
set -g fish_pager_color_completion d8dee9
set -g fish_pager_color_description 81a1c1
set -g fish_pager_color_background --background=2e3440
set -g fish_pager_color_secondary_background --background=3b4252
set -g fish_pager_color_selected_background --background=434c5e
set -g fish_pager_color_selected_completion ebcb8b
set -g fish_pager_color_selected_description ebcb8b
set -g fish_pager_color_selected_prefix ebcb8b
set -g fish_pager_color_progress d08770

# FZF default options
set -gx FZF_DEFAULT_OPTS " \
--style default \
--height 50% --layout reverse --border \
--color=bg+:#3b4252,bg:-1,spinner:#ebcb8b,hl:#81a1c1 \
--color=fg:#d8dee9,header:#88c0d0,info:#ebcb8b,pointer:#bf616a \
--color=marker:#b48ead,fg+:#88c0d0,prompt:#88c0d0,hl+:#81a1c1 \
--color=selected-bg:#434c5e \
--color 'border:#88c0d0, label:#d8dee9' \
--color 'preview-border:#ebcb8b, preview-label:#d8dee9' \
--color 'list-border:#d8dee9, list-label:#8fbcbb' \
--color 'header-border:#88c0d0' \
--color 'input-border:#4c566a, input-label:#4c566a' \
--multi"
