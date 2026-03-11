local M = {}

function M.init()
  local dap = require "dap"

  -- The js/ts debugger
  for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
    local pwaType = "pwa-" .. adapterType

    dap.adapters[pwaType] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}"
        },
      },
    }

    dap.adapters[adapterType] = function(cb, config)
      local nativeAdapter = dap.adapters[pwaType]

      config.type = pwaType

      if type(nativeAdapter) == "function" then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end
  end

  local enter_launch_url = function()
    local co = coroutine.running()
    return coroutine.create(function()
      Snacks.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
        if url == nil or url == "" then
          return
        else
          coroutine.resume(co, url)
        end
      end)
    end)
  end

  for _, language in ipairs({ "typescript", "javascript", "vue", "angular", "typescriptreact", "javascriptreact" }) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch Node (dap)",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach Node (dap)",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch TS Node (dap)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeArgs = { "-r", "ts-node/register" },
      },
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome (Dap)",
        url = enter_launch_url,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
      {
        type = "pwa-edge",
        request = "launch",
        name = "Launch Edge (Dap)",
        url = enter_launch_url,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
    }

  end
end

return M
