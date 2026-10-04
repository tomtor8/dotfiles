# custom command color
set -g fish_color_command 61afef

# One Dark Pager Theme for Fish Shell
set -g fish_pager_color_prefix 56b6c2
set -g fish_pager_color_completion abb2bf
set -g fish_pager_color_description 5c6370
set -g fish_pager_color_background --background=21252b
set -g fish_pager_color_secondary_background --background=282c34
set -g fish_pager_color_selected_background --background=3e4452
set -g fish_pager_color_selected_completion e5c07b
set -g fish_pager_color_selected_description e2c08d
set -g fish_pager_color_selected_prefix e5c07b
set -g fish_pager_color_progress 61afef

# FZF default options - One Dark
set -gx FZF_DEFAULT_OPTS " \
--style default \
--height 50% --layout reverse --border \
--color=bg+:#3e4452,bg:#282c34,spinner:#d19a66,hl:#e06c75 \
--color=fg:#abb2bf,header:#e06c75,info:#c678dd,pointer:#d19a66 \
--color=marker:#61afef,fg+:#abb2bf,prompt:#c678dd,hl+:#e06c75 \
--color=selected-bg:#4b5263 \
--color='border:#61afef,label:#abb2bf' \
--color='preview-border:#61afef,preview-label:#abb2bf' \
--color='list-border:#2e323b,list-label:#56b6c2' \
--color='header-border:#61afef' \
--color='input-border:#4b5263,input-label:#abb2bf' \
--multi"
