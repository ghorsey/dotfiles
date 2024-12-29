function CargoInstall
{
  param(
    [string]$Command,
    [string]$Package
  )
  $Package ??= $Command

  if (-Not (Get-Command $Command -errorAction SilentlyContinue))
  {
    cargo install $Package --locked
  }
}

function WinGetInstall
{
  param(
    [string]$Command,
    [string]$Package
  )

  if (-Not (Get-Command $Command -errorAction SilentlyContinue))
  {
    winget install $Package
  }
}

function WriteFile
{
  param(
    [string]$Path,
    [string]$Value
  )

  if (-Not (Get-Content $Path | Select-String -SimpleMatch -Pattern "$Value"))
  {
    Add-Content -Path $Path "$Value"
  }
}

function CreateFunction
{
  param(
    [string]$Name,
    [string]$Command,
    [string]$Path
  )

  WriteFile -Path $Path -Value "function $Name { $Command `$args }"
}

function CreateAlias
{
  param(
    [string]$Alias,
    [string]$Command,
    [string]$Path
  )
  CreateFunction -Name "Invoke_$Alias" -Command $Command -Path $Path
  WriteFile -Path $Path -Value "Set-Alias -Name $Alias -Value Invoke_$Alias"
}

function CreateFolderJunction
{
  param(
    [string]$Source,
    [string]$Destination
  )
  if (-not (Test-Path $Destination))
  {
    sudo New-Item -ItemType Junction -Path $Destination -Value $Source
  }
}

if (-Not (Get-Command "rustup" -errorAction SilentlyContinue))
{
  $rustup_url="https://gist.github.com/fnichol/699d3c2930649a9932f71bab8a315b31/raw/a368104a422672c0594574fb53eefbb0c878d914/rustup-init.ps1"
  & ([scriptblock]::Create((New-Object System.Net.WebClient).DownloadString($rustup_url))) -y
}

WinGetInstall -Command "nu" -Package "nushell"
WinGetInstall -Command clang  -Package LLVM.LLVM
WriteFile -Path $profile -Value '$env:PATH += ";C:\Program Files\LLVM\bin"'

WinGetInstall -Command sudo   -Package gerardog.gsudo
WinGetInstall -Command git    -Package Git.Git
WinGetInstall -Command rustup -Package Rustlang.Rustup

function config
{ 
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args
}
# Create a function for within this script
config config --local status.showUntrackedFiles no

CreateAlias -Path $profile -Alias "config" -Command "git --git-dir='$HOME/.cfg' --work-tree='$HOME'"
# CreateFunction -Name "config" -Path $profile -Command 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args'
CreateFunction -Name "c" -Path $profile -Command "clear"

CargoInstall -Command starship
CargoInstall -Command bob -Package "bob-nvim"

CargoInstall -Command bat
CreateAlias -Alias "cat" -Path $profile -Command "bat"

CreateFolderJunction -Source "$HOME\.config\nvim" "$HOME\nvim"

CargoInstall -Command "eza"
CreateAlias -Alias "ls" -Path $profile -Command "eza"

. $profile
