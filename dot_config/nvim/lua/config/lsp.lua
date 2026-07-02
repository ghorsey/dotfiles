vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client == nil then
      Snacks.notify.warn("The client " .. ev.data.client_id .. " was not found")
      return
    end

    -- vim.lsp.config('*', {capabilities = MiniCompletion.get_lsp_capabilities()})
    vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })

    vim.lsp.inlay_hint.enable(true)
  end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })


