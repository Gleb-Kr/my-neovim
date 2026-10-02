dap = require("dap")
wk  = require("which-key")



dap.adapters.debugpy = {
    type = "server"     ,
    port = "${port}"    ,
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb"   ,
        args = {"--port", "${port}"}                                ,
    }                   ,
}

dap.configurations.python = {
    {
        type = "debugpy"        ,
        request = "launch"      ,
        name = "Launch file"    ,
        program = "${file}"     ,
        pythonPath = function()
            return "/usr/bin/python"
        end                     ,
    },
}


dap.configurations.c = {
    {
        type = "cortex-debug"   ,
        request = "launch"      ,
        name = "Launch file"    ,
        program = "${file}"     ,
        cPath = function()
            return "/usr/bin/gcc"
        end                     ,
    },
}


dap.configurations.cpp = {
    {
        type = "codelldb"       ,
        request = "launch"      ,
        name = "Launch file"    ,
        program = "${file}"     ,
        cppPath = function()
            return "/usr/bin/g++"
        end                     ,
    },
}


-- dap.configurations.csharp = {
--     {
--         type = "netcoredbg"     ,
--         request = "launch"      ,
--         name = "Launch file"    ,
--         program = "${file}"     ,
--         cppPath = function()
--             return "/usr/bin/g++"
--         end                     ,
--     },
-- }



function get_correct_conf()
    ft = vim.bo.filetype
    
    
    if ft == "python" then
        return dap.configurations.python
    
    elseif ft == "c" then
        return dap.configurations.c
    
    elseif ft == "cpp" then
        return dap.configurations.cpp
    
    else
        print("UNKNOWN: <" .. ft .. ">")
        vim.fn.cmd("echo \"UNKNOWN: <" .. ft .. ">\"")
    end
end


function start_pause_dap()
    if dap.session() then
        if dap.status() == "paused" then
            print("DO CONTINUE")
            dap.continue()
        
        else
            print(dap.status())
            dap.pause()
        end
    
    else
        print("DO RUN")
        print(get_correct_conf())
        dap.run({config = dap.configurations})
    end
end


wk.add({
    mode = {"n", "v", "i"}  ,
    {
        "<F6>"          ,
        start_pause_dap ,
    }                       ,
})

