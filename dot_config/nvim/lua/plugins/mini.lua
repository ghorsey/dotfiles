return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require('mini.surround').setup({
      highlight_duration = 1000,
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    })
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
