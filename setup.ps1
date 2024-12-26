if (-Not (Get-Command git -errorAction SilentlyContinue))
{
  winget install Git.Git
}

config config --local status.showUntrackedFiles no
function config { git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args }
config config --local status.showUntrackedFiles no


if (-Not (Get-Command starship -errorAction SilentlyContinue))
{
  "starship exists"
}
