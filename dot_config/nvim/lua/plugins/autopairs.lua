return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    init = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")

        npairs.add_rules({
            Rule("(", ")")
                :with_cr(function()
                    -- allow autopairs to handle <CR>
                    return true
                end)
                :replace_endpair(function(opts)
                    -- opts.prev_char is the text before cursor
                    -- we return what should appear AFTER the cursor
                    return ")"
                end)
                :use_key("<cr>")
        })
    end
}
