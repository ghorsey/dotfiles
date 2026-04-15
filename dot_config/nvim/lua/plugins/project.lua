return {
  'DrKJeff16/project.nvim',
  dependencies = { -- OPTIONAL. Choose any of the following
    'folke/snacks.nvim',
  },
  lazy = true,
  opts = {
    patterns = {
      "slnx",
      "package.json",
    },
  },
}
