# custom command color - Peach
set -g fish_color_command fab387

# Catppuccin Mocha Pager Theme for Fish Shell
set -g fish_pager_color_prefix 94e2d5
set -g fish_pager_color_completion 7f849c
set -g fish_pager_color_description b4befe
set -g fish_pager_color_background --background=11111b
set -g fish_pager_color_secondary_background --background=181825
set -g fish_pager_color_selected_background --background=000000
set -g fish_pager_color_selected_completion f9e2af
set -g fish_pager_color_selected_description f2cdcd
set -g fish_pager_color_selected_prefix f9e2af
set -g fish_pager_color_progress 89dceb

# FZF default options - Catppuccin Mocha (with Sapphire selection) f38ba8 hl
set -gx FZF_DEFAULT_OPTS " \
--style default \
--height 50% --layout reverse --border \
--color=bg+:#1e1e2e,bg:-1,spinner:#f5e0dc,hl:#adc6ff \
--color=fg:#a6adc8,header:#f38ba8,info:#cba6f7,pointer:#adc6ff \
--color=marker:#adc6ff,fg+:#adc6ff,prompt:#cba6f7,hl+:#adc6ff \
--color=selected-bg:#1e1e2e \
--color='border:#6c7086,label:#cdd6f4' \
--color='preview-border:#6c7086,preview-label:#cdd6f4' \
--color='list-border:#313244,list-label:#94e2d5' \
--color='header-border:#89b4fa' \
--color='input-border:#585b70,input-label:#cdd6f4' \
--multi \
--pointer=''"
