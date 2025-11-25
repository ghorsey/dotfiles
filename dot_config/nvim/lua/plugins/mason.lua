return {
  {
    "mason-org/mason-lspconfig.nvim",

    opts = {
      ensure_installed = {
        "angularls",
        "azure_pipelines_ls",
        "bashls",
        "bicep",
        -- "copilot", -- github copilot
        "csharp_ls",
        "cssls",
        "dockerls",
        "eslint",
        "fish_lsp",
        "gh_actions_ls",
        "html",
        "lua_ls",
        "markdown_oxide",
        "rust_analyzer",
        "ts_ls",
        "vue_ls",
        "yamlls",
      },

    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        },
      }},
      "neovim/nvim-lspconfig",
    },
  },
}
