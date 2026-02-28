return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  event = "VimEnter",
  config = function()
      local logo = [[


    

     ______          __        ______                          __ 
    / ____/___  ____/ /__     / ____/___  _____________  _____/ /_
   / /   / __ \/ __  / _ \   / /   / __ \/ ___/ ___/ _ \/ ___/ __/
  / /___/ /_/ / /_/ /  __/  / /___/ /_/ / /  / /  /  __/ /__/ /_  
  \____/\____/\__,_/\___/   \____/\____/_/  /_/   \___/\___/\__/  
             ______      ____          __  _                       
            / ____/___  / / /__  _____/ /_(_)   _____              
           / /   / __ \/ / / _ \/ ___/ __/ / | / / _ \             
          / /___/ /_/ / / /  __/ /__/ /_/ /| |/ /  __/             
          \____/\____/_/_/\___/\___/\__/_/ |___/\___/              


    
  
    ]]

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            action = 'lua require("telescope.builtin").find_files()',
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          {
            action = 'lua require("telescope.builtin").oldfiles()',
            desc = " Recent Files",
            icon = " ",
            key = "r",
          },
          {
            action = 'lua require("telescope.builtin").live_grep()',
            desc = " Find Text",
            icon = " ",
            key = "g",
          },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "Mason", desc = " Mason", icon = " ", key = "m" },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    require("dashboard").setup(opts)

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
  end,
}
