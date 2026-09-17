return {
    {
        "ldelossa/gh.nvim"  ,
        name = "gh"         ,
        dependencies = {
            {
                "ldelossa/litee.nvim"   ,
                config = function()
                    require("litee.lib").setup()
                end                     ,
            }   ,
        }                   ,
        config = function()
            require("litee.gh").setup()
        end                 ,
    },
}

