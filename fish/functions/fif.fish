function fif
    set -l rg_prefix "rg --column --line-number --no-heading --color=always --smart-case "
    
    # We use --disabled so fzf acts as a dynamic interface for ripgrep
    fzf --ansi --disabled --query "$argv" \
        --bind "start:reload:$rg_prefix {q}" \
        --bind "change:reload:sleep 0.1; $rg_prefix {q} || true" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'right,60%,border-bottom,+{2}+3/3' \
        --bind 'enter:become(nvim {1} +{2})'
end
