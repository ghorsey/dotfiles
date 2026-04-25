return {
  'nvim-telescope/telescope.nvim', version = '*',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    -- local telescope = require('telescope')
    --
    -- telescope.setup {
    --   extensions = {
    --     fzy_native = {
    --       override_generic_sorter = false,
    --       override_file_sorter = true,
    --     },
    --   },
    -- }

    -- local builtin = require('telescope.builtin')
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags', noremap = true,})
    -- vim.keymap.set('n', '<C-p>', builtin.lsp_workspace_symbols, { desc = 'Telescope LSP workspace symbols' })
  end,
  opts = {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  },
  keys = {
    { '<leader>ff', function() return require('telescope.builtin').find_files end, desc = 'Telescope find files' },
    { '<leader>fg', function() return require('telescope.builtin').live_grep end,  desc = 'Telescope live grep' },
    { '<leader>fb', function() return require('telescope.builtin').buffers end,  desc = 'Telescope buffers' },
    { '<leader>fh', function() return require('telescope.builtin').help_tags end, desc = 'Telescope help tags' },
    { '<C-p>', function() return require('telescope.builtin').lsp_workspace_symbols end, desc = 'Telescope LSP workspace symbols' },
  },
}
