# ADD DIRS TO PATH {{{1
fish_add_path ~/.local/bin ~/bin ~/.cargo/bin
# REMOVE GREETING {{{1
set -g fish_greeting

# GLOBAL ENVIRONMENT VARIABLES {{{1
set -gx EDITOR /usr/bin/nvim
set -gx VISUAL $EDITOR
# Fix ugly green background for other-writable directories
set -gx LS_COLORS "$LS_COLORS:ow=34;01:tw=34;01"
# use nvim as a MAN pager
set -gx MANPAGER "nvim +Man!"
# set -gx HYPRSHOT_DIR /home/tom/Pictures/Screenshots

# THEME {{{1

set -l HOST (hostnamectl hostname)
set -l theme_dir ~/.local/share/dotfiles/fish/themes

switch $HOST
    case nucarch
        set theme_path "$theme_dir/tropical-island-morning.fish"
    case hp13arch hp16arch
        set theme_path "$theme_dir/ayu-dark.fish"
    case '*'
        set theme_path "$theme_dir/ayu-dark.fish" # default fallback theme
end

if test -f "$theme_path"
    source "$theme_path"
end

# FZF SETTINGS {{{1
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix"
set -gx FZF_CTRL_T_COMMAND "fd --type f --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_OPTS "
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

set -gx FZF_CTRL_R_OPTS "
  --with-nth 2..
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
set -gx FZF_ALT_C_OPTS "
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

fzf --fish | source

if status is-interactive
    # VI MODE SETTINGS {{{1
    fish_vi_key_bindings
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external line
    # This binds the sequence j,k to switch to normal mode in vi mode.
    bind -M insert -m default j,k cancel repaint-mode
    # After setting this, fish only waits 200ms for the "k",
    # or decides to treat the "j" as a separate sequence, inserting it.
    set -g fish_sequence_key_delay_ms 200

    # ABBREVIATIONS {{{1

    # open txt, md ... files directly in nvim e.g. somefile.txt and enter
    function vim_edit
        echo nvim $argv
    end
    abbr -a vim_edit_texts --position command --regex ".+\.(md|txt|toml|kdl|json)" --function vim_edit
    # open tree command with custom level of depth, e.g. tree1, tree2, tree3
    # using named capturing group with name level
    # named groups are automatically converted to local variables with the same name
    function custom_tree
        set matches (string match --regex "tree(?<level>\d+)" $argv[1])
        echo "tree -sh --du -L $level"
    end
    abbr -a tree_custom_level --regex "tree\d+" --function custom_tree

    # SYNC RCLONE
    abbr -a dotfiles-down 'rclone sync pcloud:backup_linux/dotfiles ~/Code/dotfiles -v -i'
    abbr -a dotfiles-up 'rclone sync ~/Code/dotfiles pcloud:backup_linux/dotfiles -v -i'
    abbr -a templates-down 'rclone sync pcloud:backup_linux/templates ~/Templates -v -i'
    abbr -a templates-up 'rclone sync ~/Templates pcloud:backup_linux/templates -v -i'
    abbr -a notes-down 'rclone sync pcloud:notes ~/Documents/notes -v -i'
    abbr -a notes-up 'rclone sync ~/Documents/notes pcloud:notes -v -i'

    # cd up with .. ... ....
    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    # ALIASES {{{1
    alias mount-klips='udisksctl mount -b /dev/disk/by-uuid/E2CD-8BAD'
    alias unmount-klips='udisksctl unmount -b /dev/disk/by-uuid/E2CD-8BAD'
    alias nn="nvim"
    # check lua files: luacheck . or luacheck some/dir/
    alias luacheck="lua-language-server --check"
    # check python files: pycheck filename
    alias pycheck="basedpyright"
    alias ls="eza --group-directories-first --icons"
    alias la="eza -a --group-directories-first --icons"
    alias ll="eza -lhmH --group-directories-first --icons"
    alias llt="eza -lhmH --tree --level=2 --group-directories-first --icons"
    alias lla="eza -alhmH --group-directories-first --icons"
    # sort by time modified fromt the newest
    alias llm="eza -lhm --group-directories-first --icons -s=modified -r"
    # sort by size from the biggest
    alias lls="eza -lhm --group-directories-first --icons -s=size -r"
    alias cp="cp -i"
    alias mplay="mpv --no-video --term-osd-bar=yes --term-osd-bar-chars='|--|' --msg-level=all=status,ao=no,ffmpeg=no,cplayer=warn"
    alias mplays="mpv --no-video --term-osd-bar=yes --term-osd-bar-chars='|--|' --msg-level=all=status,ao=no,ffmpeg=no,cplayer=warn --shuffle"
    # alias ncdu="ncdu --color dark"
    alias ocr-ru="sed -i 's/-l [a-z]\{3\} /-l rus /g' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh"
    alias ocr-es="sed -i 's/-l [a-z]\{3\} /-l spa /g' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh"
    alias ocr-sk="sed -i 's/-l [a-z]\{3\} /-l slk /g' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh"
    alias ocr-en="sed -i 's/-l [a-z]\{3\} /-l eng /g' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh"
    alias ocr-hu="sed -i 's/-l [a-z]\{3\} /-l hun /g' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh"
    alias ocr-lang="rg 'tesseract stdin stdout' /home/tom/Code/shell/ocr_screenshot_in_clipboard/ocr-screenshot-in-clipboard.sh | sed -E 's/.*-l ([a-z]{3}).*/\1/'"
end

# ZOXIDE AND STARFISH INTEGRATION {{{1
zoxide init fish | source
starship init fish | source
enable_transience
