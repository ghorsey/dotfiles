vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      --vim.keymap.set('i', '<C-space>', vim.lsp.completion.get, { desc = 'trigger autocomplete' })
      vim.keymap.set('i', '<C-space>', function() require('mini.completion').complete() end, { desc = 'trigger autocomplete' })
      vim.keymap.set(
        'i',
        '<Tab>',
        function()
          if vim.fn.pumvisible() == 1 then
            local selected = vim.fn.complete_info().selected
            if selected == -1 then
              -- No item selected: select first item, then confirm
              return "<C-n><C-y>"
            else
              return "<C-y>"
            end
          end
          return "<Tab>"
        end,
        {
          noremap = true,
          expr = true,
          desc = 'insert highlighted item'
        })
    end
  end,
})


-- vim.diagnostic.config({ virtual_text = true })
--vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.diagnostic.config({ virtual_lines = { current_line = true } })


