return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Test adapters
      "nsidorenco/neotest-vstest",
      --"Issafalcon/neotest-dotnet",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    lazy = true,
    init = function ()
      require("plugins.neotest.adapters.neotest-vstest").init()

      require("neotest").setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-vstest"),
          require("neotest-vitest"),
          --require("neotest-dotnet"),
        }
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest" }
    },
  },
}
