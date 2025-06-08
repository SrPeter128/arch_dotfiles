if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    dysk
end

fish_add_path "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/matthias/tools/miniforge3/bin/conda
    eval /home/matthias/tools/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/matthias/tools/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/matthias/tools/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/matthias/tools/miniforge3/bin" $PATH
    end
end

if test -f "/home/matthias/tools/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/matthias/tools/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

fish_add_path /home/matthias/.pixi/bin
pixi completion --shell fish | source

