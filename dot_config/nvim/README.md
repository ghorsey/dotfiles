# Overview
My neovim setup. I'm trying to be minimal with my config. I'd rather use defaults and default capabilities.

<dl>
    <dt>&lt;leader&gt;</dt>
    <dd>A space ` `</dd>
</dl>

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
| n, x | `<C-a>`   | Ask opencode...         |
| n, x | `<C-x>`   | Execute opencode action |
| n, t | `<C-.>`   | Toggle opencode         |
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
| Mode | Sortcut | Description |
|------|---------|-------------|
| n    | `<leader>fb` | Buffers |
| n    | `<leader>fc` | Find config file |
| n    | `<leader>ff` | Find files |
| n    | `<leader>fg` | Find git files |
| n    | `<leader>fp` | Projects |
| n    | `<leader>fr` | Recent |

##### Git

| Mode | Sortcut | Description |
|------|---------|-------------|
| n    | `<leader>gb` | Git branches |
| n    | `<leader>gl` | Git log |
| n    | `<leader>gL` | Git log line |
| n    | `<leader>gs` | Git status |
| n    | `<leader>gS` | Git stash |
| n    | `<leader>gd` | Git diff (hunks) |
| n    | `<leader>gf` | Git log file |

##### Github Cli

