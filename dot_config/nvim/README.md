# Overview
My neovim setup. I'm trying to be minimal with my config. I'd rather use defaults and default capabilities.

<dl>
    <dt>&lt;leader&gt;</dt>
    <dd>A space ` `</dd>
</dl>

## General Keymaps

### Saving

| Mode | Shortcut         | Command         | Description              |
|------|------------------|-----------------|--------------------------|
| n    | <kbd>C-s</kbd>   | `:w<CR>`        | Saves the current buffer |
| i    | <kbd>C-s</kbd>   | `:w<CR>`        | Saves the current buffer |
| n    | <kbd>C-S-s</kbd> | `:wa<CR>`       | Saves all open buffers   |
| i    | <kbd>C-S-s</kbd> | `<ESC>:wa<CR>a` | Saves all open buffers   |


### Quitting Neovim

| Mode | Shortcut         | Command   | Description              |
|------|------------------|-----------|--------------------------|
| n, i | <kbd>C-q</kbd>   | `:q<CR>`  | Close the current window |
| n, i | <kbd>C-S-q</kbd> | `:qa<CR>` | Closes all windows       |

### Center screen when jumping

| Mode | Shortcut       | Command   | Description                      |
|------|----------------|-----------|----------------------------------|
| n    | <kbd>n</kbd>   | `nzz`     | Next search result (centered)    |
| n    | <kbd>N</kbd>   | `Nzz`     | Prevous search result (centered) |
| n    | <kbd>C-d</kbd> | `<C-d>zz` | Half page down (centered)        |
| n    | <kbd>C-U</kbd> | `<C-U>zz` | Hald page up (centered)          |

### Buffer Navigation

| Mode | Shortcut             | Command      | Description     |
|------|----------------------|--------------|-----------------|
| n    | <kbd>leader-bn</kbd> | `:bnext<CR>` | Next buffer     |
| n    | <kbd>leader-bp</kbd> | `:bnext<CR>` | Previous buffer |
