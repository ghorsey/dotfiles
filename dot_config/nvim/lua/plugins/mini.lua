return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require('mini.surround').setup()
    require('mini.statusline').setup()
    require('mini.completion').setup({
      window = {
        info = { height = 25, width = 80, border = "rounded" },
        signature = { height = 25, width = 80, border = "rounded" },
      },
      -- mappings = {
      --   force_twostep = "<C-@>",
      --   force_fallback = "<leader><C-@>",
      -- },
    })
  end,
}
