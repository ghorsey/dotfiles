-- Key mappings
vim.g.mapleader = " "                                -- Set leader key to space
vim.g.maplocalleader = " "                           -- Set local leader key (NEW)

-- Save buffers
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", { desc = "Save the current buffer", silent = true, })
vim.keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>a", { desc = "Save the current buffer", silent = true, })
vim.keymap.set( "n","<C-M-s>", "<CMD>wa<CR>", { desc = "Save all open buffers", silent = true, })
vim.keymap.set("i", "<C-M-s>", "<ESC><CMD>wa<CR>a", { desc = "Save all open buffers", silent = true, })

-- Undo
vim.keymap.set("n", "<C-u>", "<CMD>u<CR>", { desc = "Undo the last action", silent = true })
vim.keymap.set("i", "<C-u>", "<ESC><CMD>u<CR>a", { desc = "Undo the last action", silent = true })

-- Quit neovim
vim.keymap.set("n", "<C-q>", "<CMD>q<CR>", { desc = "Close the current window", silent = true})
vim.keymap.set("i", "<C-q>", "<ESC><CMD>q<CR>", { desc = "Close the current window", silent = true })
vim.keymap.set("n", "<C-M-q>", "<CMD>qa<CR>", { desc = "Close all windows", silent = true })
vim.keymap.set("i", "<C-M-q>", "<ESC><CMD>qa<CR>", { desc = "Close all windows", silent = true })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzz", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation----
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Spliting & Resizing
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window height" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- Quickfix navigation
vim.keymap.set({ "n", "i"}, "<C-M-j>", ":cnext<CR>", { desc = "Quickfix next" })
vim.keymap.set({ "n", "i"}, "<C-M-k>", ":cprevious<CR>", { desc = "Quickfix Previous" })

-- Build/Make Project
vim.keymap.set({ "n", "i"}, "<C-S-b>", ":make<CR>", { desc = "Build the project" })
