return {
    {
        "Darkskittlz/GitCompanion"  ,
        name = "GitCompanion"       ,
        dependencies = {
            "nvim-lua/plenary.nvim" ,
        }                           ,
        keys = {
            {"<leader>gc", "<CMD>GitCompanion<CR>", desc = "Toggle GitCompanion"}   ,
        }                           ,
        opts = {}                   ,
    },
}

