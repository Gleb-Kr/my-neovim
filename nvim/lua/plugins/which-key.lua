return {
    {
        "folke/which-key.nvim"  ,
        name = "which-key"      ,
        lazy = true             ,
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}

