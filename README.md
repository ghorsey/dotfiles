# dotFiles Repository

This dotfiles repository currently supports:
- Ubuntu Zsh
- DevPods

## Install on existing Linux Ubuntu system:
### Prerequisites
- Install zsh and set as the default shell

### Setup
1. Create a bare clone of the repo
```bash
git clone --bare git@ghorsey.github:ghorsey/dotfiles.git $HOME/.cfg
```

2. Create the `config` alias.
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

3. Checkout the content of the bare repo
```bash
config checkout
```

4. Run the `setup` script
```bash
~/setup
```
## Use as a DevPod customization
1. Set `--dotfiles` argument to this repository URL
