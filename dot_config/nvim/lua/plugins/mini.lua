return {
  'nvim-mini/mini.nvim',
  version = false,
  init = function()
    local spec_treesitter = require("mini.ai").gen_spec.treesitter

    require('mini.ai').setup({
      custom_textobjects = {
        ['='] = spec_treesitter({ a = "@assignment.outer", i = "@assignment.inner" }), -- 1, 3
        b = spec_treesitter({ a = "@block.outer", i = "@block.inner" }), -- 7, 8
        F = spec_treesitter({ a = "@call.outer", i = "@call.inner" }), -- 9, 10
        c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }), -- 11, 12
        i = spec_treesitter({ a = "@conditional.outer", i = "@conditional.inner" }), -- 15, 16
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }), -- 19, 20
        l = spec_treesitter({ a = "@loop.outer", i = "@loop.inner" }), -- 21, 22
        a = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }), -- 24, 25
      },
    })
    require('mini.surround').setup({
      highlight_duration = 1000,
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    })
    require('mini.statusline').setup()
    -- require('mini.completion').setup({
    --   window = {
    --     info = { height = 25, width = 80, border = "rounded" },
    --     signature = { height = 25, width = 80, border = "rounded" },
    --   },
    --   fallback_action = function()  end, -- this was causing strange fallback menu
    --   lsp_completion = {
    --     process_items = function(items)
    --       local CompletionItemKind = vim.lsp.protocol.CompletionItemKind
    --       local filtered = {}

    --       for _, item in ipairs(items) do
    --         if item.kind ~= CompletionItemKind.Text then
    --           table.insert(filtered, item)
    --         end
    --       end

    --       return filtered
    --     end,
    --   },
    --   -- version
    --   -- mappings = {
    --   --   force_twostep = "<C-@>",
    --   --   force_fallback = "<leader><C-@>",
    --   -- },
    -- })
  end,
}
