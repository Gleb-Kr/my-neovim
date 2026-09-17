ex  = vim.cmd



ex("colo catppuccin-nvim")



local gl = require("galaxyline")
local gls = gl.section



gls.left[1] = {
    ViMode = {
        provider = vim.fn.mode() .. " "     ,
        highlight = { "String", "Normal" }  ,
    },
    
    
    
}

