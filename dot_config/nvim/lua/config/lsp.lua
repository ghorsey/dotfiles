
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-space>', vim.lsp.completion.get, { desc = 'trigger autocomplete' })
    end
  end,
})

-- vim.diagnostic.config({ virtual_text = true })
--vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.diagnostic.config({ virtual_lines = { current_line = true } })


