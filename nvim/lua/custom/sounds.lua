echo = require("echo")
wk = require("which-key")



function test_all_sounds()
    for index, sound in pairs(echo.list_builtin_sounds()) do
        echo.play_sound("builtin:" .. sound)
        os.execute("sleep 1")
    end
end


wk.add({
    mode = {"n", "v", "i", "t"},
    {"<F40>", test_all_sounds},
})



areSoundsOn = false

function toggle_sounds()
    areSoundsOn = not areSoundsOn
    
    if areSoundsOn then
        vim.cmd("echo \"~Sounds are now ON~\"")
    
    else
        vim.cmd("echo \"~Sounds are now OFF~\"")
    end
end

wk.add({
    mode = {"n", "v", "i", "t"},
    {"<F4>", foggle_sounds},
})



isLLMOn = true

function toggle_LLM()
    isLLMOn = not isLLMOn
    
    if isLLMOn then
        vim.cmd("echo \"~LLM is now ON~\"")
    else
        vim.cmd("echo \"~LLM is now OFF~\"")
    end
end

wk.add({
    mode = {"n", "v", "i", "t"},
    {"<F52>", toggle_LLM},
})


vim.api.nvim_create_autocmd("InsertCharPre", {
    pattern = "*"   ,
    callback = function()
        position = vim.fn.col(".")
        
        if vim.fn.getline("."):sub(1, position):match("[lL]+[oO]+[nN]+[gG]+.*[lL]+[oO]+[nN]+[gG]+$") and isLLMOn then
            echo.play_sound("/home/liveuser/Music/LLM.mp3")
        end
    end             ,
})

