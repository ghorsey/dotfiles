# Overview
My neovim setup. I'm trying to be minimal with my config. I'd rather use defaults and default capabilities.

<dl>
    <dt>&lt;leader&gt;</dt>
    <dd>A space ` `</dd>
</dl>

## General Keymaps

### Saving

| Mode | Shortcut  | Command         | Description              |
|------|-----------|-----------------|--------------------------|
| n    | `<C-s>`   | `:w<CR>`        | Saves the current buffer |
| i    | `<C-s>`   | `:w<CR>`        | Saves the current buffer |
| n    | `<C-S-s>` | `:wa<CR>`       | Saves all open buffers   |Des
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

| Mode | Shortcut             | Command      | Description     |
|------|----------------------|--------------|-----------------|
| n    | `<leader>bn`        | `:bnext<CR>` | Next buffer     |
| n    | `<leader>bp`        | `:bnext<CR>` | Previous buffer |

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
left

