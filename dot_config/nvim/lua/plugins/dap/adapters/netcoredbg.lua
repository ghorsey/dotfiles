local M = {}

local function get_dll()
  return coroutine.create(function(dap_run_co)
    local items = vim.fn.globpath(vim.fn.getcwd(), '**/bin/Debug/**/*.dll', 0, 1)
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
  local dap = require "dap"

  -- Dot Net
  dap.adapters.coreclr = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
    args = { '--interpreter=vscode' },
  }

  if vim.fn.has("win32") == 1 then
    dap.adapters.coreclr.options = {
      detached = false,
    }
  end

  dap.configurations.cs = {
    {
      type = "coreclr",
      name = ".Net: Launch",
      request = "launch",
      cwd = "${workspaceFolder}",
      program = get_dll,
    }
  }
end


return M;
