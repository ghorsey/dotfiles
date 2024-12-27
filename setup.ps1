function WinGetInstall {
  param(
    [string]$Command,
    [string]$Package
  )

  if (-Not (Get-Command $Command -errorAction SilentlyContinue))
  {
    "winget install $Package"
  }
}


function WriteFile {
  param(
    [string]$Path,
    [string]$Value
  )

  if (-Not (Get-Content $Path | Select-String -SimpleMatch -Pattern "$Value"))
  {
    Add-Content -Path $Path "$Value"
  }
}

function CreateAlias {
  param(
    [string]$Alias,
    [string]$Command,
    [string]$Path
  )

  WriteFile -Path $Path -Value "function $Alias { $Command $args }"
}


WinGetInstall -Command git -Package Git.Git
WinGetInstall -Command rustup -Package Rustlang.Rustup

function config { git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args } # Create a function for within this script
config config --local status.showUntrackedFiles no

CreateAlias -Alias "config" -Path $profile -Command 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args'
#WriteFile -Path $profile -Value 'function config { git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args }'

if (-Not (Get-Command starship -errorAction SilentlyContinue))
{
  "starship exists"
}


. $profile
