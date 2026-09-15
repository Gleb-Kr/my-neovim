ex  = vim.cmd
map = vim.keymap.set

all = {"n", "v", "i"}    -- ALL
nmv = {"n", "v"}         -- NorMal & Visual
nin = {"n", "i"}         -- Normal & INsert
vin = {"v", "i"}         -- Visual & INsert
nrm = "n"                -- NoRMal
vis = "v"                -- VISual
ins = "i"                -- INSert




map(all, "<kEnter>", "<Enter>")
ex("map <kEnter> <Enter>")



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

areArrowsOn = false

function toggle_arrows()
    areArrowsOn = not areArrowsOn
    if areArrowsOn then
        ex("imap <Right> <Right>")
        ex("imap <Up> <Up>")
        ex("imap <Down> <Down>")
        ex("imap <Left> <Left>")
        ex("map <Right> <Right>")
        ex("map <Up> <Up>")
        ex("map <Down> <Down>")
        ex("map <Left> <Left>")
        ex("echo \"~Arrows are now ON~\"")
    else
        ex("imap <Right> <Nop>")
        ex("imap <Up> <Nop>")
        ex("imap <Down> <Nop>")
        ex("imap <Left> <Nop>")
        ex("map <Right> <Nop>")
        ex("map <Up> <Nop>")
        ex("map <Down> <Nop>")
        ex("map <Left> <Nop>")
        ex("echo \"~Arrows are now OFF~\"")
    end
end

map(all, "<F13>", "<CMD>lua toggle_arrows()<CR>")


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

