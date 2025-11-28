return {
  'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local telescope = require 'telescope'

    telescope.setup {
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    }
  end,
  keys = {
    {
      '<leader>ff',
      require('telescope.builtin').find_files,
      { desc = 'Telescope find files' },
    },
    {
      '<leader>fg',
      require('telescope.builtin').live_grep,
      { desc = 'Telescope live grep' },
    },
    {
      '<leader>fb',
      require('telescope.builtin').buffers,
      { desc = 'Telescope buffers' },
    },
    {
      '<leader>fh',
      require('telescope.builtin').help_tags,
      { desc = 'Telescope help tags' },
    },
    {
      '<C-p>',
      require('telescope.builtin').lsp_workspace_symbols,
      { desc = 'Telescope LSP workspace symbols' },
    },
  },
}
