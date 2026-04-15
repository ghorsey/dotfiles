if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR ~/.local/share/bob/nvim-bin/nvim

fish_add_path -a ~/.local/share/bob/nvim-bin

set fish_greeting ""

# enable ssh agent
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

starship init fish | source

bob complete fish | source

pay-respects fish --alias | source

zoxide init fish | source

