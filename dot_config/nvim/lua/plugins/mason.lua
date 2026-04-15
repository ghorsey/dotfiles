return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "angularls",
        "azure_pipelines_ls",
        "bashls",
        "bicep",
        -- "roslyn", -- need to manually install this
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
        "vimls",
        "vue_ls",
        "yamlls",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        lazy = true,
        opts = {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
          },
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          },
        }
      },
      "neovim/nvim-lspconfig",
    },
  },
}
