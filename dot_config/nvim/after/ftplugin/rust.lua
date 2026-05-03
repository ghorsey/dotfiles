local blink = require("blink.cmp")

blink.setup({
  sources = {
    default = {
      "lsp",
      "path",
      -- "buffer",  -- removed for Rust
      "snippets",
    },
  },
})
