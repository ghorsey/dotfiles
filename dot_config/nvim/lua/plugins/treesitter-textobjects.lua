return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  opts = {
    select = {
      lookahead = true,
      lookbehind = false,
      selection_mode = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        -- ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = false,
    },
    move = {
      set_jumps = false,
    },
  },
  keys = {
    {
      'as',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    -- Assignments
    {
      'a=',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@assignment.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'i=',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@assignment.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'l=',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@assignment.lhs", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'r=',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@assignment.rhs", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },

    -- Parameters
    {
      'aa',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'ia',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    -- conditionals
    {
      'ai',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'ii',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },

    -- loops
    {
      'al',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'il',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    -- calls
    {
      'af',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@call.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'if',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@call.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },

    -- Methods/Function definition
    {
      'am',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'im',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    -- Classes
    {
      'ac',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },
    {
      'ic',
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
      end,
      { 'x', 'o' }, -- x = charwise, linewise, o = operator pending mode
      desc = 'Select outer part of a method/function definition',
    },

    -- Text objects: Swap
    {
      '<leader>na',
      function()
        require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
      end,
      desc = 'Swap parameters/argument with next'
    },
    {
      '<leader>pa',
      function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
      end,
      desc = 'Swap parameters/argument with next'
    },
    {
      '<leader>nm',
      function()
        require("nvim-treesitter-textobjects.swap").swap_next "@function.inner"
      end,
      desc = 'Swap parameters/argument with next'
    },
    {
      '<leader>pm',
      function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@function.outer"
      end,
      desc = 'Swap parameters/argument with next'
    },
    -- Text object Move
    -- {},
  },
}
