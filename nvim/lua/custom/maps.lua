ex  = vim.cmd
map = vim.keymap.set

all = {"n", "v", "i"}    -- ALL
noi = {"n", "v"}         -- NOt Insert
nrm = "n"                -- NoRMal
vis = "v"                -- VISual
ins = "i"                -- INSert




map(all, "<kEnter>", "<Enter>")



isMouseOn = true

function toggle_mouse()
    isMouseOn = not isMouseOn
    if isMouseOn then
        ex("set mouse=nvi")
        ex("echo \"~Mouse is now ON~\"")
    else
        ex("set mouse=")
        ex("echo \"~Mouse is now OFF~\"")
    end
end

map(all, "<F1>", "<CMD>lua toggle_mouse()<CR>")


map(all, "<F9>" , "<CMD>e .<CR>")
map(all, "<F21>", "<CMD>e ..<CR>")
map(all, "<F33>", "<CMD>e ~/<CR>")
map(all, "<F45>", "<CMD>e /<CR>")

map(all, "<F57>", "<CMD>term<CR>")


map(all, "<F10>", "<CMD>nohl<CR>")



map(ins, "<C-Z>"  , "<C-O>u")
map(ins, "<C-S-Z>", "<C-O><C-R>")


map(ins, "<C-E>", "<C-O><C-E>")
map(ins, "<C-Y>", "<C-O><C-Y>")


map(ins, "<C-BS>" , "<C-O>w<C-O>b<C-O>dw")
map(ins, "<C-Del>", "<C-O>W<C-O>B<C-O>dW")

map(nrm, "<C-BS>" , "wbdw")
map(nrm, "<C-Del>", "WBdW")


map(ins, "<C-W>", "<C-O><C-W>")


map(all, "<C-S>", "<CMD>:w<CR>")

-- function save_as()
--     filename = Snacks.input.input()
-- end

