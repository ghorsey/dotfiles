-- https://github.com/radleylewis/nvim-lite/blob/youtube_demo/init.lua
-- https://www.youtube.com/watch?v=skW3clVG5Fo
-- Theme & Transparency
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

require("config.opts")
require("config.keymaps")
require("config.lazy")
require("config.lsp")


-- ================================================================================================
-- Useful Functions
-- ================================================================================================

-- Copy Full File-Path
-- vim.keymap.set("n", "<leader>pa", function()
--  local path = vim.fn.expand("%:p")
--  vim.fn.setreg("+", path)
--  print("file: ", path)
--end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Return to last edit position when opening files
--vim.api.nvim_creat_autocmd("BufReadPost", {
--  group = augroup,
--  callback = function() {
--    local mark = vim.api.nvim_bug_get_mark(0, '"')
--    local count = vim.api.nvim_buf_line_count(0)
--    if mark[1] > 0 and mark[1] <= count then
--      pcall(vim.api.nvim_win_set_cursor, 0, mark)
--    end
--  end,
--})

-- Auto-resize splits when window is resized
--vim.api.nvim_create_autocmd("VimResized", {
--  group = augroup,
--  callback = function()
--    vim.cmd("tabdo wincmd=")
--  end,
--})


