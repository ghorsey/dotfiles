function CargoInstall
{
  param(
    [string]$Command,
    [string]$Package
  )
  if ([string]::IsNullOrEmpty($Package))
  {
    $Package = $Command
  }

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
    New-Item -ItemType Junction -Path $Destination -Value $Source
  }
}

function DownloadFile
{
  param(
    [string]$Url,
    [string]$OutFile
  )

  Invoke-WebRequest -Uri $Url -OutFile $OutFile
}

if (-Not (Get-Command "rustup" -errorAction SilentlyContinue))
{
  $rustup_url="https://gist.github.com/fnichol/699d3c2930649a9932f71bab8a315b31/raw/a368104a422672c0594574fb53eefbb0c878d914/rustup-init.ps1"
  & ([scriptblock]::Create((New-Object System.Net.WebClient).DownloadString($rustup_url))) -y
}

# Create a function for within this script
function config
{ 
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args
}

# Disable showing untracked files
config config --local status.showUntrackedFiles no

WinGetInstall -Command "win32yank" -Package "equalsraf.win32yank"
WinGetInstall -Command "nu" -Package "nushell"
WinGetInstall -Command clang  -Package LLVM.LLVM
WinGetInstall -Command sudo   -Package gerardog.gsudo
WinGetInstall -Command git    -Package Git.Git
WinGetInstall -Command rustup -Package Rustlang.Rustup

WriteFile -Path $profile -Value '$env:PATH += ";C:\Program Files\LLVM\bin"'

CargoInstall -Command rg -Package ripgrep
CargoInstall -Command starship
CargoInstall -Command bob -Package "bob-nvim"
CargoInstall -Command "bat"
CargoInstall -Command "eza"
CargoInstall -Command "tldr" -Package "tealdeer"
CargoInstall -Command "coreutils" -Package "coreutils"

if (-Not (Get-Command "nvim" -errorAction SilentlyContinue))
{
  bob install stable
  bob use stable
}

# create a function to have c as an alias to clear
#CreateFunction -Name "c" -Path $profile -Command "clear"
# Map the nvim config to the correct location
CreateFolderJunction -Source "$HOME\.config\nvim" "$env:LocalAppData\nvim"

DownloadFile -Url "https://github.com/mickimnet/myth-prompt-themes/raw/refs/heads/main/colorful/slanted/starship/left_only/starship.toml" -OutFile '.config/starship.toml'

# Create Aliases
CreateAlias -Alias "c" -Path $profile -Command "clear"
CreateAlias -Alias "cat" -Path $profile -Command "bat"
CreateAlias -Alias "ls" -Path $profile -Command "eza"
CreateAlias -Alias "touch" -Command "coreutils touch" -Path $PROFILE
CreateAlias -Alias "mkdir" -Command "coreutils mkdir" -Path $PROFILE
CreateAlias -Alias "rm" -Command "coreutils rm" -Path $PROFILE
CreateAlias -Alias "rmdir" -Command "coreutils rmdir" -Path $PROFILE
CreateAlias -Path $profile -Alias "config" -Command "git --git-dir='$HOME/.cfg' --work-tree='$HOME'"

. $profile
