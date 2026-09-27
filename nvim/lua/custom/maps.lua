ex  = vim.cmd
map = vim.keymap.set


all = {"n", "v", "i"}    -- ALL

nmv = {"n", "v"}         -- NorMal & Visual
nin = {"n", "i"}         -- Normal & INsert
vin = {"v", "i"}         -- Visual & INsert

nrm = "n"                -- NoRMal
vis = "v"                -- VISual
ins = "i"                -- INSert

trm = "t"                -- TeRMinal



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

areArrowsOn = true

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


map(nmv, "<F5>", "<CMD>w<CR><CMD>RunCode<CR><Insert>")
map(all, "<F17>", "<CMD>w<CR><CMD>RunClose<CR>")
map(nmv, "<F29>", "<CMD>RunCode<CR><Insert>")
map(all, "<F41>", "<CMD>RunClose<CR>")

map(ins, "<F5>", "<CMD>w<CR><CMD>RunCode<CR>")
map(ins, "<F29>", "<CMD>w<CR><CMD>RunClose<CR>")


map(all, "<F9>" , "<CMD>e .<CR>")
map(all, "<F21>", "<CMD>e ..<CR>")
map(all, "<F33>", "<CMD>e ~/<CR>")
map(all, "<F45>", "<CMD>e /<CR>")

map(all, "<F57>", "<CMD>term<CR>")


map(all, "<F10>", "<CMD>nohl<CR>")



map(ins, "<C-z>"  , "<C-o>u")
map(ins, "<C-S-z>", "<C-o><C-R>")


map(ins, "<C-e>", "<C-o><C-e>")
map(ins, "<C-y>", "<C-o><C-y>")


map(ins, "<C-BS>" , "<C-o>w<C-o>b<C-o>dw")
map(ins, "<C-Del>", "<C-o>W<C-o>B<C-o>dW")

map(nrm, "<C-BS>" , "wbdw")
map(nrm, "<C-Del>", "WBdW")


map(all, "<C-s>", "<CMD>w<CR>")


map(nmv, "<M-h>", "<C-w>h")
map(nmv, "<M-j>", "<C-w>j")
map(nmv, "<M-k>", "<C-w>k")
map(nmv, "<M-l>", "<C-w>l")

map(ins, "<M-h>", "<C-o><C-w>h")
map(ins, "<M-j>", "<C-o><C-w>j")
map(ins, "<M-k>", "<C-o><C-w>k")
map(ins, "<M-l>", "<C-o><C-w>l")

map(trm, "<M-h>", "<C-Bslash><C-o><C-w>h")
map(trm, "<M-j>", "<C-Bslash><C-o><C-w>j")
map(trm, "<M-k>", "<C-Bslash><C-o><C-w>k")
map(trm, "<M-l>", "<C-Bslash><C-o><C-w>l")

map(nmv, "<M-S-h>", "<C-w>H")
map(nmv, "<M-S-j>", "<C-w>J")
map(nmv, "<M-S-k>", "<C-w>K")
map(nmv, "<M-S-l>", "<C-w>L")

map(ins, "<M-S-h>", "<C-o><C-w>H")
map(ins, "<M-S-j>", "<C-o><C-w>J")
map(ins, "<M-S-k>", "<C-o><C-w>K")
map(ins, "<M-S-l>", "<C-o><C-w>L")

map(trm, "<M-S-h>", "<C-Bslash><C-o><C-w>H")
map(trm, "<M-S-j>", "<C-Bslash><C-o><C-w>J")
map(trm, "<M-S-k>", "<C-Bslash><C-o><C-w>K")
map(trm, "<M-S-l>", "<C-Bslash><C-o><C-w>L")


map(all, "<C-q>", "<CMD>q<CR>")

