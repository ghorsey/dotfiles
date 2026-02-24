return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require('mini.surround').setup()
    require('mini.statusline').setup()
    require('mini.completion').setup()
  end,
}
