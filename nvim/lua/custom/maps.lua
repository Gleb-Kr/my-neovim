dap = require("dap")



ex  = vim.cmd
wk = require("which-key")


all = {"n", "v", "i"}    -- ALL

nmv = {"n", "v"}         -- NorMal & Visual
nin = {"n", "i"}         -- Normal & INsert
vin = {"v", "i"}         -- Visual & INsert

nrm = "n"                -- NoRMal
vis = "v"                -- VISual
ins = "i"                -- INSert

trm = "t"                -- TeRMinal



vim.keymap.set({"n", "v", "i", "t"}, "<kEnter>", "<Enter>")
ex("map <kEnter> <Enter>")
ex("imap <kEnter> <Enter>")
ex("vmap <kEnter> <Enter>")
ex("tmap <kEnter> <Enter>")



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

wk.add({
    mode = all,
    {"<F1>", toggle_mouse},
})

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

wk.add({
    mode = all,
    {"<F13>", toggle_arrows},
})


wk.add({
    mode = nmv,
    {"<F5>", "<CMD>w<CR><CMD>RunCode<CR><Insert>"},
})
wk.add({
    mode = all,
    {"<F17>", "<CMD>w<CR><CMD>RunClose<CR>"},
})
wk.add({
    mode = nmv,
    {"<F29>", "<CMD>RunCode<CR><Insert>"},
})
wk.add({
    mode = all,
    {"<F41>", "<CMD>RunClose<CR>"},
})

wk.add({
    mode = ins,
    {"<F5>", "<CMD>w<CR><CMD>RunCode<CR>"},
})
wk.add({
    mode = ins,
    {"<F29>", "<CMD>w<CR><CMD>RunClose<CR>"},
})


-- For <F6> key, see ~/.config/nvim/lua/custom/ndap.lua


wk.add({
    mode = all,
    {"<F9>", "<CMD>e .<CR>"},
})
wk.add({
    mode = all,
    {"<F21>", "<CMD>e ..<CR>"},
})
wk.add({
    mode = all,
    {"<F33>", "<CMD>e ~/<CR>"},
})
wk.add({
    mode = all,
    {"<F45>", "<CMD>e /<CR>"},
})

wk.add({
    mode = all,
    {"<F57>", "<CMD>term<CR>"},
})



wk.add({
    mode = nrm,
    {"<Esc>", "<CMD>nohl<CR>"},
})


wk.add({
    mode = ins,
    {"<C-e>", "<C-o><C-e>"},
})
wk.add({
    mode = ins,
    {"<C-y>", "<C-o><C-y>"},
})


wk.add({
    mode = ins,
    {"<C-BS>", "<C-o>w<C-o>b<C-o>dw"},
})
wk.add({
    mode = ins,
    {"<C-Del>", "<C-o>W<C-o>B<C-o>dW"},
})

wk.add({
    mode = nrm,
    {"<C-BS>", "wbdw"},
})
wk.add({
    mode = nrm,
    {"<C-Del>", "WBdW"},
})


wk.add({
    mode = all,
    {"<C-s>", "<CMD>w<CR>"},
})


wk.add({
    mode = nmv,
    {"<M-h>", "<C-w>h"},
})
wk.add({
    mode = nmv,
    {"<M-j>", "<C-w>j"},
})
wk.add({
    mode = nmv,
    {"<M-k>", "<C-w>k"},
})
wk.add({
    mode = nmv,
    {"<M-l>", "<C-w>l"},
})

wk.add({
    mode = ins,
    {"<M-h>", "<C-o><C-w>h"},
})
wk.add({
    mode = ins,
    {"<M-j>", "<C-o><C-w>j"},
})
wk.add({
    mode = ins,
    {"<M-k>", "<C-o><C-w>k"},
})
wk.add({
    mode = ins,
    {"<M-l>", "<C-o><C-w>l"},
})

wk.add({
    mode = trm,
    {"<M-h>", "<C-Bslash><C-o><C-w>h"},
})
wk.add({
    mode = trm,
    {"<M-j>", "<C-Bslash><C-o><C-w>j"},
})
wk.add({
    mode = trm,
    {"<M-k>", "<C-Bslash><C-o><C-w>k"},
})
wk.add({
    mode = trm,
    {"<M-l>", "<C-Bslash><C-o><C-w>l"},
})

wk.add({
    mode = nmv,
    {"<M-S-h>", "<C-w>H"},
})
wk.add({
    mode = nmv,
    {"<M-S-j>", "<C-w>J"},
})
wk.add({
    mode = nmv,
    {"<M-S-k>", "<C-w>K"},
})
wk.add({
    mode = nmv,
    {"<M-S-l>", "<C-w>L"},
})

wk.add({
    mode = ins,
    {"<M-S-h>", "<C-o><C-w>H"},
})
wk.add({
    mode = ins,
    {"<M-S-j>", "<C-o><C-w>J"},
})
wk.add({
    mode = ins,
    {"<M-S-k>", "<C-o><C-w>K"},
})
wk.add({
    mode = ins,
    {"<M-S-l>", "<C-o><C-w>L"},
})

wk.add({
    mode = trm,
    {"<M-S-h>", "<C-Bslash><C-o><C-w>H"},
})
wk.add({
    mode = trm,
    {"<M-S-j>", "<C-Bslash><C-o><C-w>J"},
})
wk.add({
    mode = trm,
    {"<M-S-k>", "<C-Bslash><C-o><C-w>K"},
})
wk.add({
    mode = trm,
    {"<M-S-l>", "<C-Bslash><C-o><C-w>L"},
})


wk.add({
    mode = all,
    {"<C-q>", "<CMD>q<CR>"},
})


-- Know that <Plus> key was mapped by:
-- wk.add({
--     mode = nrm,
--     {"+", "<CMD>DapToggleBreakpoint<CR>"},
-- })
-- In the file ~/.config/nvim/lua/custom/ndap.lua

