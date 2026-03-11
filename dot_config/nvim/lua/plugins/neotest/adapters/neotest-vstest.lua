local M = {}

function M.init()
  vim.g.neotest_vstest = {
    dap_settings = {
      type = "coreclr"
    },
  }
end

return M
