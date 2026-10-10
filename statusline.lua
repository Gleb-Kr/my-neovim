local gl = require("galaxyline")
local gls = gl.section
local color = require("galaxyline.themes.colors").get_color



function single_space()
    return " "
end

-- 🭮██████🭬 --

function left_sep()
    return "🭮"
end

function right_sep()
    return "🭬"
end



function get_vi_mode()
    mode = vim.fn.mode()
    
    
    if mode == "n" then
        mode = "NORMAL"
    
    elseif mode == "i" then
        mode = "INSERT"
    
    elseif mode == "R" then
        mode = "REPLACE"
    
    elseif mode == "v" then
        mode = "VISUAL"
    
    elseif mode == "V" then
        mode = "VISUAL LINE"
    
    elseif mode == "" then
        mode = "VISUAL BLOCK"
    
    elseif mode == "s" then
        mode = "SELECT"
    
    elseif mode == "S" then
        mode = "SELECT LINE"
    
    elseif mode == "" then
        mode = "SELECT BLOCK"
    
    elseif mode == "c" then
        mode = "EX-COMMAND"
    
    elseif mode == "t" then
        mode = "TERMINAL"
    
    else
        mode = "UNKNOWN: <" .. mode .. ">"
    end
    
    
    return mode
end



function get_file_size_fg()
    fileSize = vim.fn.getfsize(vim.fn.expand("%:p"))
    
    
    if fileSize < 1024 then
        sizeColor = color("fg")
    
    elseif fileSize < 4096 then
        sizeColor = color("blue")
    
    elseif fileSize < 16384 then
        sizeColor = color("cyan")
    
    elseif fileSize < 65536 then
        sizeColor = color("green")
    
    elseif fileSize < 262144 then
        sizeColor = color("yellow")
    
    elseif fileSize < 1048576 then
        sizeColor = color("orange")
    
    elseif fileSize < 4194304 then
        sizeColor = color("red")
    
    else
        sizeColor = color("bg")
    end
    
    
    return sizeColor
end



function get_file_size_bg()
    fileSize = vim.fn.getfsize(vim.fn.expand("%:p"))
    
    
    if fileSize < 4194304LL then
        sizeColor = color("bg")
    
    elseif fileSize < 16777216LL then
        sizeColor = color("blue")
    
    elseif fileSize < 67108864LL then
        sizeColor = color("cyan")
    
    elseif fileSize < 268435456LL then
        sizeColor = color("green")
    
    elseif fileSize < 1073741824LL then
        sizeColor = color("yellow")
    
    elseif fileSize < 4294967296LL then
        sizeColor = color("orange")
    
    elseif fileSize < 17179869184LL then
        sizeColor = color("red")
    
    else
        sizeColor = color("fg")
    end
    
    
    return sizeColor
end



function get_file_size()
    byteSize = vim.fn.getfsize(vim.fn.expand("%:p"))
    
    
    if byteSize < 1024 then
        textSize = string.format("%d", byteSize) .. " B"
    
    elseif byteSize < 10240 then
        textSize = string.format("%.1f", byteSize / 1024) .. " KiB"
    
    elseif byteSize < 1048576 then
        textSize = string.format("%.0f", byteSize / 1024) .. " KiB"
    
    elseif byteSize < 10485760LL then
        textSize = string.format("%.1f", byteSize / 1048576) .. " MiB"
    
    elseif byteSize < 1073741824LL then
        textSize = string.format("%.0f", byteSize / 1048576) .. " MiB"
    
    elseif byteSize < 10737418240LL then
        textSize = string.format("%.1f", byteSize / 1073741824LL) .. " GiB"
    
    elseif byteSize < 1099511627776LL then
        textSize = string.format("%.0f", byteSize / 1073741824LL) .. " GiB"
    
    elseif byteSize < 10995116277760LL then
        textSize = string.format("%.1f", byteSize / 1099511627776LL) .. " TiB"
    
    elseif byteSize < 1125899906842624LL then
        textSize = string.format("%.0f", byteSize / 1099511627776LL) .. " TiB"
    
    elseif byteSize < 11258999068426240LL then
        textSize = string.format("%.1f", byteSize / 1125899906842624LL) .. " PiB"
    
    elseif byteSize < 1152921504606846976LL then
        byteSize = string.format("%.0f", byteSize / 1152921504606846976LL) .. " PiB"
    
    else
        textSize = string.format("%.1f", byteSize / 1152921504606846976LL) .. " EiB"
    end
    
    
    return textSize
end



function is_buf_terminal()
    return vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()):sub(1, 7) == "term://"
end



function is_buf_picker()
    return vim.bo.filetype == "snacks_layout_box" or vim.bo.filetype == "snacks_picker_list"
end



function is_saved_file()
    return vim.fn.getfsize(vim.fn.expand("%:p")) ~= -1
end



function will_give_name()
    return is_saved_file() or is_buf_terminal() or is_buf_picker()
end



function get_buf_name()
    local path = vim.fn.expand("%:p")
    local home = vim.fn.expand("~")
    local cwd = vim.fn.getcwd()
    
    
    if is_buf_picker() then
        return cwd
    end
    
    -- if is_buf_terminal() then
    if cwd == "/home" and vim.startswith(path, home) then
        path = "~" .. path:sub(#home + 1)
    end
    
    if path == cwd then
        path = "."
    end
    
    if vim.startswith(path, cwd .. "/") then
        path = path:sub(#cwd + 2)
    end
    
    if path == home then
        path = "~"
    end
    
    if vim.startswith(path, home .. "/") then
        path = "~" .. path:sub(#home + 1)
        
        if cwd == home then
            path = path:sub(3)
        end
    end
    
    
    return path
end



function get_file_type() -- I think that at this exact point, I should thank Th3Whit3Wolf for making his
                         -- amazing theme for Neovim GalaxyLine. I of course didn't steal it. I just observed
                         -- and tried to understand how it worked. Without them, I probably couldn't make this.
                         -- Many file types here were taken from their function "get_file_type"
    if is_buf_terminal() then
        return "Terminal"
    end
    
    
    ft = vim.bo.filetype
    
    
    if ft == "python" then
        return "Python"
    
    elseif ft == "sh" then
        return "Shell"
    
    elseif ft == "c" then
        return "C"
    
    elseif ft == "cpp" then
        return "C++"
    
    elseif ft == "cs" then
        return "C#"
    
    elseif ft == "css" then
        return "Cascading Style Sheets"
    
    elseif ft == "fish" then
        return "Friendly Interactive SHell"
    
    elseif ft == "haml" then
        return "HTML Abstraction Markup Language"
    
    elseif ft == "html" then
        return "HyperText Markup Language"
    
    elseif ft == "htm" then
        return "HyperText Markup language"
    
    elseif ft == "js" then
        return "JavaScript"
    
    elseif ft == "json" then
        return "JavaScript Object Notation"
    
    elseif ft == "less" then
        return "LEaner Style Sheets"
    
    elseif ft == "objc" then
        return "Objective C"
    
    elseif ft == "objcpp" then
        return "Objective C++"
    
    elseif ft == "h" then
        return "C Header"
    
    elseif ft == "hpp" then
        return "C++ Header"
    
    elseif ft == "php" then
        return "PHP Hypertext Processor"
    
    elseif ft == "ron" then
        return "Rusty Object Notation"
    
    elseif ft == "sass" then
        return "Syntastically Awesome Style Sheets"
    
    elseif ft == "toml" then
        return "Tom's Obvious Markup Language"
    
    elseif ft == "yaml" then
        return "YAML Ain't Markup Language"
    
    elseif ft == "zsh" then
        return "Z SHell"
    
    elseif ft == "lua" then
        return "Lua"
    
    elseif ft == "txt" then
        return "Text"
    
    elseif ft == "md" then
        return "MarkDown"
    
    elseif ft == "png" then
        return "Portable Network Graphics image"
    
    elseif ft == "jpg" then
        return "Joint Photographic Experts Group image"
    
    elseif ft == "jpe" then
        return "Joint Photographic Experts group image"
    
    elseif ft == "jpg" then
        return "Joint Photographic experts Group image"
    
    elseif ft == "jfif" then
        return "JPEG File Interchange Format"
    
    elseif ft == "mp3" then
        return "MPEG-X Audio Layer III"
    
    elseif ft == "wav" then
        return "Waveform Audio File Extension"
    
    elseif ft == "mp4" then
        return "MPEG-4 Part 14"
    
    elseif ft == "audio" then
        return "Audio"
    
    elseif ft == "image" then
        return "Image"
    
    elseif ft == "file" then
        return "It's a file, what can I say..."
    
    elseif ft == "snacks_layout_box" then
        return "Picker"
    
    elseif ft == "snacks_picker_list" then
        return "Picker"
    
    else
        return "UNKNOWN: <" .. ft .. ">"
    end
end



function get_cur_position()
    return vim.fn.line(".") .. ":" .. vim.fn.col(".")
end



function get_percent()
    if vim.fn.line("w0") == 1 and vim.fn.line("w$") == vim.fn.line("$") then
        return "ALL"
    
    
    elseif vim.fn.line("w0") == 1 then
        return "DOM"
    
    
    elseif vim.fn.line("w$") == vim.fn.line("$") then
        return "SUB"
    
    
    else
        return math.floor(vim.fn.line("w0") / (vim.fn.line("$") - vim.api.nvim_win_get_height(0)) * 100) .. "%"
    end
end



gls.left[1] = {
    leftViModeSpace = {
        provider = single_space                     ,
        highlight = {color("red"), color("red")}    ,
    },
}


gls.left[2] = {
    ViMode = {
        provider = get_vi_mode                  ,
        highlight = {color("bg"), color("red")} ,
    },
}


gls.left[3] = {
    RightViModeSpace = {
        provider = single_space                     ,
        highlight = {color("red"), color("red")}    ,
    }
}


gls.left[4] = {
    RightViModeSep = {
        provider = right_sep                            ,
        highlight = {color("red"), get_file_size_bg()}  ,
    },
}


gls.left[5] = {
    LeftFileSizeSpace = {
        provider = single_space                                 ,
        highlight = {get_file_size_bg(), get_file_size_bg()}    ,
    },
}


gls.left[6] = {
    FileSize = {
        provider = get_file_size                                ,
        condition = is_saved_file                               ,
        highlight = {get_file_size_fg(), get_file_size_bg()}    ,
    },
}


gls.left[7] = {
    RightFileSizeSpace = {
        provider = single_space                                 ,
        condition = is_saved_file                               ,
        highlight = {get_file_size_bg(), get_file_size_bg()}    ,
    },
}


gls.left[8] = {
    RightFileSizeSep = {
        provider = right_sep                            ,
        condition = is_saved_file                       ,
        highlight = {get_file_size_bg(), color("bg")}   ,
    },
}


gls.left[9] = {
    LeftFileNameSpace = {
        provider = single_space                 ,
        condition = is_saved_file               ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.left[10] = {
    FileName = {
        provider = get_buf_name                     ,
        condition = is_file_saved                   ,
        highlight = {color("magenta"), color("bg")} ,
    },
}


gls.left[11] = {
    RightFileNameSpace = {
        provider = single_space                 ,
        condition = will_give_name              ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.left[12] = {
    LeftFileTypeSep = {
        provider = left_sep                         ,
        condition = will_give_name                  ,
        highlight = {color("magenta"), color("bg")} ,
    },
}


gls.left[13] = {
    LeftFileTypeSpace = {
        provider = single_space                             ,
        condition = will_give_name                          ,
        highlight = {color("magenta"), color("magenta")}    ,
    },
}


gls.left[14] = {
    FileType = {
        provider = get_file_type                    ,
        condition = will_give_name                  ,
        highlight = {color("bg"), color("magenta")} ,
    },
}


gls.left[15] = {
    RightFileTypeSpace = {
        provider = single_space                             ,
        condition = will_give_name                          ,
        highlight = {color("magenta"), color("magenta")}    ,
    },
}


gls.left[16] = {
    RightFileTypeSep = {
        provider = right_sep                                            ,
        condition = will_give_name                                      ,
        highlight = {color("magenta"), color("bg"), "strikethrough"}    ,
    },
}


gls.left[17] = {
    RightFileTypeSepSpace = {
        provider = single_space                                         ,
        highlight = {color("magenta"), color("bg"), "strikethrough"}    ,
    },
}



gls.right[1] = {
    CoolArrow = {
        provider = function() return "▶" end                            ,
        highlight = {color("magenta"), color("bg"), "strikethrough"}    ,
    },
}


gls.right[2] = {
    LeftFileFormatSpace = {
        provider = function() return "    " end ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.right[4] = {
    FileFormat = {
        provider = function() return vim.bo.fileformat end  ,
        highlight = {color("fg"), color("bg")}              ,
    },
}



gls.right[5] = {
    RightFileFormatSpace = {
        provider = single_space                 ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.right[6] = {
    LeftPositionSep = {
        provider = left_sep                         ,
        highlight = {color("blue"), color("bg")}    ,
    },
}


gls.right[7] = {
    LeftPositionSpace = {
        provider = single_space                     ,
        highlight = {color("blue"), color("blue")}  ,
    },
}


gls.right[8] = {
    Position = {
        provider = get_cur_position                 ,
        highlight = {color("bg"), color("blue")}    ,
    },
}


gls.right[9] = {
    RightPositionSpace = {
        provider = single_space                     ,
        highlight = {color("blue"), color("blue")}  ,
    },
}


gls.right[10] = {
    Percent = {
        provider = get_percent                      ,
        highlight = {color("bg"), color("blue")}    ,
    },
}


gls.right[11] = {
    RightPercentSpace = {
        provider = single_space                     ,
        highlight = {color("blue"), color("blue")}  ,
    },
}



gls.short_line_left[1] = {
    LeftViModeSpace = {
        provider = single_space                     ,
        highlight = {color("red"), color("red")}    ,
    },
}


gls.short_line_left[2] = {
    ViMode = {
        provider = get_vi_mode                  ,
        highlight = {color("bg"), color("red")} ,
    },
}


gls.short_line_left[3] = {
    RightViModeSpace = {
        provider = single_space                     ,
        highlight = {color("red"), color("red")}    ,
    },
}


gls.short_line_left[4] = {
    RightViModeSep = {
        provider = right_sep                    ,
        highlight = {color("red"), color("bg")} ,
    },
}


gls.short_line_left[5] = {
    LeftFileNameSpace = {
        provider = single_space                 ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.short_line_left[6] = {
    FileName = {
        provider = get_buf_name                     ,
        condition = will_give_name                  ,
        highlight = {color("magenta"), color("bg")} ,
    },
}


gls.short_line_left[7] = {
    RightFileNameSpace = {
        provider = single_space                 ,
        condition = will_give_name              ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.short_line_left[8] = {
    ArrowLine = {
        provider = single_space                                         ,
        highlight = {color("magenta"), color("bg"), "strikethrough"}    ,
    },
}


gls.short_line_right[1] = {
    CoolArrow = {
        provider = function() return "▶" end                            ,
        highlight = {color("magenta"), color("bg"), "strikethrough"}    ,
    },
}


gls.short_line_right[2] = {
    RightArrowSpace = {
        provider = function() return "    " end ,
        highlight = {color("bg"), color("bg")}  ,
    },
}


gls.short_line_right[3] = {
    LeftPositionSep = {
        provider = left_sep                         ,
        highlight = {color("blue"), color("bg")}    ,
    },
}


gls.short_line_right[4] = {
    LeftPositionSpace = {
        provider = single_space                     ,
        highlight = {color("blue"), color("blue")}  ,
    },
}


gls.short_line_right[5] = {
    Position = {
        provider = get_cur_position                 ,
        highlight = {color("bg"), color("blue")}    ,
    },
}


gls.short_line_right[6] = {
    RightPositionSpace = {
        provider = single_space                     ,
        highlight = {color("blue"), color("blue")}  ,
    },
}

