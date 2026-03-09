# Overview
My neovim setup. I'm trying to be minimal with my config. I'd rather use defaults and default capabilities.

## General Keymaps

### Edit config

| Mode | Shortcut     | Command                          | Description |
|------|--------------|----------------------------------|-------------|
| n    | `<leader>rc` | `:e ~/.config/nvim/init.lua<CR>` | Edit config |

### Building and Quickfix

| Mode | Shortcut  | Command         | Description       |
|------|-----------|-----------------|-------------------|
| n, i | `<C-S-b>` | `:make<CR>`     | Build the project |
| n, i | `<C-M-j>` | `:cnext<CR>`    | Next Quickfix     |
| n, i | `<C-M-k>` | `:previous<CR>` | Previous quickfix |


### Saving

| Mode | Shortcut  | Command         | Description              |
|------|-----------|-----------------|--------------------------|
| n    | `<C-s>`   | `:w<CR>`        | Saves the current buffer |
| i    | `<C-s>`   | `:w<CR>`        | Saves the current buffer |
| n    | `<C-S-s>` | `:wa<CR>`       | Saves all open buffers   |
| i    | `<C-S-s>` | `<ESC>:wa<CR>a` | Saves all open buffers   |


### Quitting Neovim

| Mode | Shortcut  | Command        | Description              |
|------|-----------|----------------|--------------------------|
| n    | `C-q>`    | `:q<CR>`       | Close the current window |
| i    | `C-q>`    | `<ESC>:q<CR>`  | Close the current window |
| n    | `C-S-q> ` | `:qa<CR>`      | Closes all windows       |
| i    | `<C-S-q>` | `<ESC>:qa<CR>` | Closes all windows       |

### Center screen when jumping

| Mode | Shortcut | Command   | Description                      |
|------|----------|-----------|----------------------------------|
| n    | `n`      | `nzz`     | Next search result (centered)    |
| n    | `N`      | `Nzz`     | Prevous search result (centered) |
| n    | `<C-d>`  | `<C-d>zz` | Half page down (centered)        |
| n    | `<C-U>`  | `<C-U>zz` | Hald page up (centered)          |

### Buffer Navigation

| Mode | Shortcut     | Command      | Description     |
|------|--------------|--------------|-----------------|
| n    | `<leader>bn` | `:bnext<CR>` | Next buffer     |
| n    | `<leader>bp` | `:bnext<CR>` | Previous buffer |

### Window Navigation

| Mode | Shortcut | Command  | Description           |
|------|----------|----------|-----------------------|
| n    | `<C-h>`  | `<C-w>h` | Move to left window   |
| n    | `<C-j>`  | `<C-w>j` | Move to bottom window |
| n    | `<C-k>`  | `<C-w>k` | Move to top window    |
| n    | `<C-l>`  | `<C-w>l` | Move to right window  |

### Splitting and Resizing

| Mode | Shortcut    | Command                   | Description               |
|------|-------------|---------------------------|---------------------------|
| n    | `<leader>|` | `:vsplit<CR>`             | Split window vertically   |
| n    | `<leader>-` | `:split<CR>`              | Split window horizontally |
| n    | `<C-Up>`    | `:resize +2<CR>`          | Increase window height    |
| n    | `<C-Down>`  | `:resize -2<CR>`          | Decrease window height    |
| n    | `<C-Left>`  | `:vertical resize -2<CR>` | Decrease window width     |
| n    | `<C-Right>` | `:vertical resize +2<CR>` | Increase window width     |


### Move lines up/down

| Mode | Shortcut | Command        | Description    |
|------|----------|----------------|----------------|
| n    | `<A-j>`  | `:m .+1<CR>==` | Move line down |
| n    | `<A-k>`  | `:m .-2<CR>==` | Move line up   |
| v    | `<A-j>`  | `:m .+1<CR>==` | Move line down |
| v    | `<A-k>`  | `:m .-2<CR>==` | Move line up   |

### Delete without yanking

| Mode | Shortcut    | Command | Description                             |
|------|-------------|---------|-----------------------------------------|
| n, v | `<leader>d` | `"_d`   | Deletes without yanking into a register |

### Better indenting in visual mode

| Mode | Shortcut | Command | Description               |
|------|----------|---------|---------------------------|
| v    | `<`      | `<gv`   | Indent left and reselect  |
| v    | `>`      | `>gv`   | Indent right and reselect |

### Better Join behavior

| Mode | Shortcut | Command | Description                             |
|------|----------|---------|-----------------------------------------|
| n    | `J`      | ``mzJ`z``   | Join lines and keep the cursor position |

## Plugins

### Debugging (DAP)

The neovim Debugging Adapter Protocol client for neovim

| Mode | Shortcut  | Description                          |
|------|-----------|--------------------------------------|
| n    | `<F5>`    | Debug: Start/Continue                |
| n    | `<S-F5>`  | Debug: Stop                          |
| n    | `<F11>`   | Debug: Step into                     |
| n    | `<F10>`   | Debug: Step over                     |
| n    | `<S-F11>` | Debug: Step out                      |
| n    | `<F9>`    | Debug: Toggle breakpoint             |
| n    | `<C-F9>`  | Debug: Toggle bonditional breakpoint |
| n    | `<C-F5>`  | Debug: See last session result       |

### Mini

A collection of minimalistic plugins to enhance neovim

#### mini.surround

| Mode | Shortcut | Description                     |
|------|----------|---------------------------------|
| n, v | `gsa`    | Add surround                    |
| n    | `gsd`    | Delete surround                 |
| n    | `gsf`    | Find surrounding (to the left)  |
| n    | `gsF`    | Find surrounding (to the right) |
| n    | `gsh`    | Hilight surrounding             |
| n    | `gsr`    | Replace surrounding             |

### Neotest

A test runner library for neovim

| Mode | Shortcut     | Description         |
|------|--------------|---------------------|
| n    | `<leader>tt` | Run tests in file   |
| n    | `<leader>tT` | Run all test files  |
| n    | `<leader>tr` | Run nearest test    |
| n    | `<leader>ts` | Toggle summary      |
| n    | `<leader>to` | Show output         |
| n    | `<leader>tO` | Toggle output panel |
| n    | `<leader>tS` | Stop Tests          |
| n    | `<leader>td` | Debug nearest test  |

### Opencode

A plugin to integrate opencode into neovim

| Mode | Shortcut  | Description             |
|------|-----------|-------------------------|
| n, x | `<leader>oa`   | Ask opencode...         |
| n, x | `<leader>ox`   | Execute opencode action |
| n, t | `<leader>oo`   | Toggle opencode         |
| n, x | `go`      | Add range to opencode   |
| n    | `goo`     | Add line to open code   |
| n    | `<S-C-u>` | Scroll opencode up      |
| n    | `<S-C-d>` | Scroll opencode down    |


| Mode | Shortcut | Command | Description                       |
|------|----------|---------|-----------------------------------|
| n    | `+`      | `<C-a>` | Increment number under the cursor |
| n    | `-`      | `<C-x>` | Decrement number under the cursor |

### Persistence

A session manager for neovim

| Mode | Shortcut     | Description             |
|------|--------------|-------------------------|
| n    | `<leader>qs` | Loads a session         |
| n    | `<leader>qS` | Select a session        |
| n    | `<leader>ql` | Loadss the last session |
| n    | `<leader>qd` | Stops a session         |

### Snacks

A collection of QoL enhancements for neovim

#### Pickers

##### Top Pickers and Explorer
| Mode | Sortcut           | Description          |
|------|-------------------|----------------------|
| n    | `<leader><space>` | Smart find files     |
| n    | `<leader>n`       | Notification history |
| n    | `<leader>e`       | File explorer        |

##### Find
| Mode | Sortcut      | Description      |
|------|--------------|------------------|
| n    | `<leader>fb` | Buffers          |
| n    | `<leader>fc` | Find config file |
| n    | `<leader>ff` | Find files       |
| n    | `<leader>fg` | Find git files   |
| n    | `<leader>fp` | Projects         |
| n    | `<leader>fr` | Recent           |

##### Git

| Mode | Sortcut      | Description      |
|------|--------------|------------------|
| n    | `<leader>gb` | Git branches     |
| n    | `<leader>gl` | Git log          |
| n    | `<leader>gL` | Git log line     |
| n    | `<leader>gs` | Git status       |
| n    | `<leader>gS` | Git stash        |
| n    | `<leader>gd` | Git diff (hunks) |
| n    | `<leader>gf` | Git log file     |

##### Github Cli

| Mode | Sortcut      | Description               |
|------|--------------|---------------------------|
| n    | `<leader>gi` | GitHub issue (open)       |
| n    | `<leader>gI` | GitHub issues (all)       |
| n    | `<leader>gp` | GitHub pull request       |
| n    | `<leader>gP` | Github pull request (all) |

##### Grep

| Mode | Sortcut      | Description              |
|------|--------------|--------------------------|
| n    | `<leader>sb` | Buffer lines             |
| n    | `<leader>sB` | Grep Open Buffers        |
| n    | `<leader>sg` | Grep                     |
| n, x | `<leader>sw` | Visual selection or word |

##### Search

| Mode | Sortcut      | Description            |
|------|--------------|------------------------|
| n    | `<leader>s"` | Registers              |
| n    | `<leader>s/` | Search history         |
| n    | `<leader>sa` | Autocommands           |
| n    | `<leader>sb` | Buffer lines           |
| n    | `<leader>sc` | Command history        |
| n    | `<leader>sC` | Commands               |
| n    | `<leader>sd` | Diagnosstics           |
| n    | `<leader>sD` | Buffer Dianostics      |
| n    | `<leader>sh` | Help Pages             |
| n    | `<leader>sH` | Highlights             |
| n    | `<leader>si` | Icons                  |
| n    | `<leader>sj` | Jumps                  |
| n    | `<leader>sk` | Keymaps                |
| n    | `<leader>sl` | Location list          |
| n    | `<leader>sm` | Marks                  |
| n    | `<leader>sM` | Man pages              |
| n    | `<leader>sp` | Search for plugin spec |
| n    | `<leader>sq` | Quickfix list          |
| n    | `<leader>sR` | Resume                 |
| n    | `<leader>su` | Undo history           |
| n    | `<leader>uC` | Colorschemes           |

##### LSP

| Mode | Sortcut      | Description            |
|------|--------------|------------------------|
| n    | `gd`         | Goto definition        |
| n    | `gD`         | Goto declaration       |
| n    | `gr`         | References             |
| n    | `gI`         | Goto implementation    |
| n    | `gy`         | Goto t[y]pe definition |
| n    | `gai`        | C[a]lls [i]ncoming     |
| n    | `gao`        | C[a]lls [o]utgoing     |
| n    | `<leader>ss` | LSP symbols            |
| n    | `<leader>sS` | LSP workspace symbols  |


#### Zen

| Mode | Sortcut     | Description            |
|------|-------------|------------------------|
| n    | `<leader>z` | Toggle zen zoomed mode |
| n    | `<leader>Z` | Toggle zen mode        |

#### Scratch

| Mode | Sortcut     | Description           |
|------|-------------|-----------------------|
| n    | `<leader>.` | Toggle scratch buffer |
| n    | `<leader>S` | Select scratch buffer |

#### Notifier

| Mode | Sortcut      | Description               |
|------|--------------|---------------------------|
| n    | `bd`         | Delete buffer             |  
| n    | `<leader>un` | Dismiss all notifications |

#### Rename

| Mode | Sortcut | Description |
|------|---------|-------------|
| n    | `cR`    | Rename file |

#### Git Browse

| Mode | Sortcut      | Description |
|------|--------------|-------------|
| n, v | `<leader>gB` | Git browse  |

#### Lazygit

| Mode | Sortcut      | Description |
|------|--------------|-------------|
| n    | `<leader>gg` | Lazygit     |

#### Terminal

| Mode | Sortcut      | Description |
|------|--------------|-------------|
| n    | ``<C-`>`` | Toggle terminal

#### Words
*I need to test this one...*

| Mode | Sortcut | Description        |
|------|---------|--------------------|
| n    | `]]`    | Next Reference     |
| n    | `[[`    | Previous Reference |

#### Misc

| Mode | Sortcut     | Description |
|------|-------------|-------------|
| n    | `<leader>N` | Neovim News |

### Which Key

| Mode | Sortcut     | Description           |
|------|-------------|-----------------------|
| n    | `<leader>?` | Buffer local keymaps" |

