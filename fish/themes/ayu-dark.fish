# custom command color
set -g fish_color_command e6b450

# Ayu Dark Pager Theme for Fish Shell
set -g fish_pager_color_prefix e6b450
set -g fish_pager_color_completion b3b1ad
set -g fish_pager_color_description 59c2ff
set -g fish_pager_color_background --background=0b0e14
set -g fish_pager_color_secondary_background --background=151a1e
set -g fish_pager_color_selected_background --background=1f2430
set -g fish_pager_color_selected_completion ffb454
set -g fish_pager_color_selected_description ffb454
set -g fish_pager_color_selected_prefix ffb454
set -g fish_pager_color_progress f29668

# FZF default options
set -gx FZF_DEFAULT_OPTS " \
--style default \
--height 50% --layout reverse --border \
--color=bg+:#151b23,bg:-1,spinner:#ff8f40,hl:#f07178 \
--color=fg:#b3b1ad,header:#36a3d9,info:#ff8f40,pointer:#f07178 \
--color=marker:#b4befe,fg+:#e6b450,prompt:#e6b450,hl+:#f07178 \
--color=selected-bg:#45475a \
--color 'border:#e6b450, label:#b3b1ad' \
--color 'preview-border:#ff8f40, preview-label:#b3b1ad' \
--color 'list-border:#b3b1ad, list-label:#94e2d5' \
--color 'header-border:#e6b450' \
--color 'input-border:#4c4f69, input-label:#4c4f69' \
--multi \
--pointer=''"
