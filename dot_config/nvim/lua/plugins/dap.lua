return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<S-F5>',
      function()
        require('dap').terminate()
      end,
      desc = "Debug: Stop Debugger"
    },
    {
      '<F11>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F10>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<S-F11>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<F9>',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<C-F9>',
      function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      desc = 'Debug: Set Breakpoint with condition',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<C-F5>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

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
    end

    local enter_launch_url = function()
      local co = coroutine.running()

      return coroutine.create(function()
        vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
          if url == nil or url == "" then
            return
          else
            coroutine.resume(co, url)
          end
        end)
      end)
    end


    -- require("mason-nvim-dap").setup {
    --   -- Makes best effort to setup the various debuggers with
    --   -- reasonable debug configurations
    --   automatic_installation = true,
    --
    --   -- You can provide additional configuration to the handlers,
    --   -- see mason-nvim-dap README for more information.
    --   handlers = {
    --     function(config)
    --       -- All sources with no handler get passed here
    --
    --       -- Keep original functionality
    --       require('mason-nvim-dap').default_setup(config)
    --     end,
    --     -- add lang here: python=function(config) ... end
    --   },
    --
    --   ensure_installed = {
    --     "chrome",
    --     "bash",
    --     "codelldb",
    --     "coreclr",
    --     "js",
    --   }
    -- }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
