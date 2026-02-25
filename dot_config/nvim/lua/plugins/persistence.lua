{
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- Set to 0 to always save
    need = 0,
  },
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Loads a session" },
    { "<leader>qS", function() require("persistence").select() end, desc = "Select a session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Loads last session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Stops a session" },
  }
}
