vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client == nil then
      Snacks.notify.warn("The client " .. ev.data.client_id .. " was not found")
      return
    end
    
    vim.lsp.config('*', {capabilities = MiniCompletion.get_lsp_capabilities()})

    if client:supports_method('textDocument/completion') then
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

vim.diagnostic.config({ virtual_lines = { current_line = true } })


