return {
    "mfussenegger/nvim-dap" ,
    name = "nvim-dap"       ,
    
    dependencies = {
        "mason-org/mason.nvim"          ,
        "jay-babu/mason-nvim-dap.nvim"  ,
    }                       ,
    
    config = function()
        require("mason").setup()
        
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "codelldb"                  ,
                "cortex-debug"              ,
                "debugpy"                   ,
                "local-lua-debugger-vscode" ,
                "netcoredbg"                ,
            }                           ,
            ensure_installation = true  ,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end ,
            }                           ,
        })
    end                     ,
}

