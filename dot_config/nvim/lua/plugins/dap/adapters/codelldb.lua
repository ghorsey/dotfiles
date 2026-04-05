local M = {}

local function get_target()
  return coroutine.create(function(dap_run_co)
    local items = vim.fn.globpath(vim.fn.getcwd(), '**/target/debug/*', false, true)
    local opts = {
      format_item = function(path)
        return vim.fn.fnamemodify(path, ":t")
      end,
    }
    local function cont(choice)
      if choice == nil then
        return nil
      else
        coroutine.resume(dap_run_co, choice)
      end
    end

    vim.ui.select(items, opts, cont)
  end)
end

function M.init()
  local dap = require('dap')

  local detached_value = (vim.fn.has("win32") == 1) and false or nil

  dap.adapters.codelldb = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",

    detached = detached_value
  }

  dap.configurations.rust = {
   {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = get_target,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
end

return M

