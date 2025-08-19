if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
bob complete fish | source
set -gx EDITOR ~/.local/share/bob/nvim-bin/nvim

fish_add_path -a ~/.local/share/bob/nvim-bin

set fish_greeting ""
