if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR ~/.local/share/bob/nvim-bin/nvim

fish_add_path -a ~/.local/share/bob/nvim-bin

set fish_greeting ""

starship init fish | source

bob complete fish | source

pay-respects fish --alias | source

zoxide init fish | source

