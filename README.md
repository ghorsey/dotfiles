# dotFiles Repository

This dotfiles repository currently supports:
- Ubuntu Zsh
- DevPods

## Install on existing Linux Ubuntu system:
### Prerequisites
- Install zsh and set as the default shell

### Setup
1. Create a bare clone of the repo
```shell
git clone --bare git@github.com:ghorsey/dotfiles.git $HOME/.cfg
```

2. Create the `config` alias.

bash/zsh
```shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```
windows/powershell
```powershell
function config { git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args }
```

3. Checkout the content of the bare repo
```shell
config checkout
```

4. Run the `setup` script
```shell
~/setup
```
## Use as a DevPod customization
1. Set `--dotfiles` argument to this repository URL

## Windows
1. Install "Clang Compiler for Windows" via Visual Studio Installer
