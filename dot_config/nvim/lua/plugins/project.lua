return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      -- Patterns used to detect root
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml" },
      -- Optional: show hidden files in Telescope
      show_hidden = true,
      -- Optional: ignore certain directories
      exclude_dirs = { "~/.config/*", "~/.local/*", "node_modules/*" },
    })

    -- 🔌 Telescope integration
    require("telescope").load_extension("projects")
  end,
}
