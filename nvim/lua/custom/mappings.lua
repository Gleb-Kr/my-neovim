dap = require("dap")



ex  = vim.cmd
api = vim.api

wk = require("which-key")


all = {"n", "v", "i"}    -- ALL

nmv = {"n", "v"}         -- NorMal & Visual
nin = {"n", "i"}         -- Normal & INsert
vin = {"v", "i"}         -- Visual & INsert

nrm = "n"                -- NoRMal
vis = "v"                -- VISual
ins = "i"                -- INSert

trm = "t"                -- TeRMinal



-- For mapping Window's <S-FX> to Linux's <FX+12>
-- Fun fact: at first I wanted to write all lines manually (with some help of macros), but I quited when I realized that that would add exactly 300 lines of code to the file

for x = 1, 12 do
    ex("map <S-F" .. x .. "> <F" .. x + 12 .. ">")
    ex("imap <S-F" .. x .. "> <F" .. x + 12 .. ">")
    ex("vmap <S-F" .. x .. "> <F" .. x + 12 .. ">")
    ex("tmap <S-F" .. x .. "> <F" .. x + 12 .. ">")
    ex("cmap <S-F" .. x .. "> <F" .. x + 12 .. ">")
end

for x = 1, 12 do
    ex("map <C-F" .. x .. "> <F" .. x + 24 .. ">")
    ex("imap <C-F" .. x .. "> <F" .. x + 24 .. ">")
    ex("vmap <C-F" .. x .. "> <F" .. x + 24 .. ">")
    ex("tmap <C-F" .. x .. "> <F" .. x + 24 .. ">")
    ex("cmap <C-F" .. x .. "> <F" .. x + 24 .. ">")
end

for x = 1, 12 do
    ex("map <C-S-F" .. x .. "> <F" .. x + 36 .. ">")
    ex("imap <C-S-F" .. x .. "> <F" .. x + 36 .. ">")
    ex("vmap <C-S-F" .. x .. "> <F" .. x + 36 .. ">")
    ex("tmap <C-S-F" .. x .. "> <F" .. x + 36 .. ">")
    ex("cmap <C-S-F" .. x .. "> <F" .. x + 36 .. ">")
end

for x = 1, 12 do
    ex("map <M-F" .. x .. "> <F" .. x + 48 .. ">")
    ex("imap <M-F" .. x .. "> <F" .. x + 48 .. ">")
    ex("vmap <M-F" .. x .. "> <F" .. x + 48 .. ">")
    ex("tmap <M-F" .. x .. "> <F" .. x + 48 .. ">")
    ex("cmap <M-F" .. x .. "> <F" .. x + 48 .. ">")
end


vim.keymap.set({"n", "v", "i", "t"}, "<kEnter>", "<Enter>")
ex("map <kEnter> <Enter>")
ex("imap <kEnter> <Enter>")
ex("vmap <kEnter> <Enter>")
ex("tmap <kEnter> <Enter>")



isMouseOn = false

if not isMouseOn then
    ex("set mouse=")
end

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

areArrowsOn = false

if not areArrowsOn then
    ex("imap <Right> <Nop>")
    ex("imap <Up> <Nop>")
    ex("imap <Down> <Nop>")
    ex("imap <Left> <Nop>")
    ex("map <Right> <Nop>")
    ex("map <Up> <Nop>")
    ex("map <Down> <Nop>")
    ex("map <Left> <Nop>")
end

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

isInvShrinkOn = false

function toggle_inv_shrink()
    isInvShrinkOn = not isInvShrinkOn
    if isInvShrinkOn then
        ex("echo \"~Inverse shrinking is now OFF~\"")
    else
        ex("echo \"~Inverse shrinking is now ON~\"")
    end
end
wk.add({
    mode = all,
    {"<F49>", toggle_inv_shrink},
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
    {"<M-h>", "<C-Bslash><C-o><C-w>h<Esc>"},
})
wk.add({
    mode = trm,
    {"<M-j>", "<C-Bslash><C-o><C-w>j<Esc>"},
})
wk.add({
    mode = trm,
    {"<M-k>", "<C-Bslash><C-o><C-w>k<Esc>"},
})
wk.add({
    mode = trm,
    {"<M-l>", "<C-Bslash><C-o><C-w>l<Esc>"},
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


function normal(command)
    api.nvim_command("exec 'normal!" .. command .. "'")
end

function resize_win(border, isShrink)
    homeWinID = api.nvim_get_current_win()
    
    if isInvShrinkOn and isShrink then
        if direction == "h" then
            return "l"
        
        elseif direction == "j" then
            return "k"
        
        elseif direction == "k" then
            return "j"
        
        elseif direction == "l" then
            return "h"
        end
    end
    
    if not isShrink then
        if border == "j" then
            normal("+")
        elseif border == "l" then
            normal(">")
        elseif border == "h" or border == "k" then
            normal("" .. border)
            if api.nvim_get_current_win() == homeWinID then
                api.nvim_set_current_win(homeWinID)
                return
            end
        end
        if border == "h" then
            normal("<lt>")
        elseif border == "k" then
            normal("-")
        end
    
    else
        if border == "k" then
            normal("-")
        elseif border == "h" then
            normal("<lt>")
        elseif border == "j" or border == "l" then
            if border == "j" then
                normal("k")
            elseif border == "l" then
                normal("h")
            end
            if api.nvim_get_current_win() == homeWinID then
                api.nvim.set_current_win(homeWinID)
                return
            end
        end
        if border == "l" then
            normal(">")
        elseif border == "j" then
            normal("+")
        end
    end
    
    api.nvim_set_current_win(homeWinID)
end

wk.add({
    mode = all,
    {"<M-C-h>", "<CMD>lua resize_win(\"h\", false)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-j>", "<CMD>lua resize_win(\"j\", false)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-k>", "<CMD>lua resize_win(\"k\", false)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-l>", "<CMD>lua resize_win(\"l\", false)<CR>"},
})

wk.add({
    mode = all,
    {"<M-C-S-h>", "<CMD>lua resize_win(\"h\", true)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-S-j>", "<CMD>lua resize_win(\"j\", true)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-S-k>", "<CMD>lua resize_win(\"k\", true)<CR>"},
})
wk.add({
    mode = all,
    {"<M-C-S-l>", "<CMD>lua resize_win(\"l\", true)<CR>"},
})


wk.add({
    mode = all,
    {"<M-t>", "<CMD>tabnew<CR>"},
})
wk.add({
    mode = all,
    {"<M-c>", "<CMD>BufferClose<CR>"},
})
wk.add({
    mode = all,
    {"<M-S-C>", "<CMD>BufferRestore<CR>"},
})

wk.add({
    mode = all,
    {"<M-1>", "<CMD>BufferGoto 1<CR>"},
})
wk.add({
    mode = all,
    {"<M-2>", "<CMD>BufferGoto 2<CR>"},
})
wk.add({
    mode = all,
    {"<M-3>", "<CMD>BufferGoto 3<CR>"},
})
wk.add({
    mode = all,
    {"<M-4>", "<CMD>BufferGoto 4<CR>"},
})
wk.add({
    mode = all,
    {"<M-5>", "<CMD>BufferGoto 5<CR>"},
})
wk.add({
    mode = all,
    {"<M-6>", "<CMD>BufferGoto 6<CR>"},
})
wk.add({
    mode = all,
    {"<M-7>", "<CMD>BufferGoto 7<CR>"},
})
wk.add({
    mode = all,
    {"<M-8>", "<CMD>BufferGoto 8<CR>"},
})
wk.add({
    mode = all,
    {"<M-9>", "<CMD>BufferGoto 9<CR>"},
})
wk.add({
    mode = all,
    {"<M-0>", "<CMD>BufferLast<CR>"},
})

wk.add({
    mode = all,
    {"<M-,>", "<CMD>BufferPrev<CR>"},
})
wk.add({
    mode = all,
    {"<M-.>", "<CMD>BufferNext<CR>"},
})
wk.add({
    mode = all,
    {"<M-S-,>", "<CMD>BufferMovePrev<CR>"},
})
wk.add({
    mode = all,
    {"<M-S-.>", "<CMD>BufferMoveNext<CR>"},
})

wk.add({
    mode = all,
    {"<M-p>", "<CMD>BufferPin<CR>"},
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

