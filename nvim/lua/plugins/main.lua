return {
    {
        "catppuccin/nvim"   ,
        name = "catppuccin" ,
        priority = 9999     ,
    },
    
    
    {
        "folke/which-key.nvim"  ,
        name = "which-key"      ,
        lazy = true             ,
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    
    
    {
        "hrsh7th/nvim-cmp"      ,
        name = "nvim-cmp"       ,
        event = "InsertEnter"   ,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp"  ,
            "hrsh7th/cmp-buffer"    ,
        }                       ,
    },
    
    
    {
        "nvim-tree/nvim-web-devicons"   ,
        name = "web-devicons"           ,
        lazy = true                     ,
    },
    
    
    -- I am too lazy to configure this all myself, hope this won't break
    {
        "folke/snacks.nvim",
        name = "snacks",
        priority = 9999,
        lazy = false,
        ---@type snacks.Config
        opts = function()
            local splash = require("milli").load({splash = "fire"})
            return {
                bigfile = { enabled = true },
                bufdelete = { enabled = true },
                dashboard = {
                    enabled = true,
                    preset = {
                        header = table.concat(splash.frames)
                    },
                    sections = {
                        {section = "header", padding = 1}           ,
                        {section = "keys", gap = 1, padding = 1}    ,
                        {section = "startup"}                       ,
                    },
                },
                debug = { enabled = true },
                dim = { enabled = true },
                explorer = { enabled = true },
                image = { enabled = true },
                indent = { enabled = true },
                input = { enabled = true },
                layout = { enabled = true },
                notifier = {
                    enabled = true,
                    timeout = 3000,
                },
                picker = { enabled = true },
                quickfile = { enabled = true },
                rename = { enabled = true },
                scope = { enabled = true },
                scroll = { enabled = true },
                statuscolumn = { enabled = true },
                terminal = { enabled = true },
                util = { enabled = true },
                words = { enabled = true },
                styles = {
                    notification = {
                        -- wo = { wrap = true } -- Wrap notifications
                    }
                },
                win = { enabled },
                zen = { enabled = true },
            }
        end,
        config = function(_, opts)
            require("snacks").setup(opts)
            require("milli").snacks({splash = "fire", loop = true})
        end,
        keys = {
            -- Top Pickers & Explorer
            { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
            { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
            -- find
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
            -- git
            { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
            -- gh
            { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
            { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
            { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
            { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
            -- Grep
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
            -- search
            { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
            { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
            { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
            { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
            { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
            { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
            -- LSP
            { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
            { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
            -- Other
            { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
            { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
            { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
            { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
            { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
            { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
            { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
            { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
            { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
            { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
            { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
            { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
            {
                "<leader>N",
                desc = "Neovim News",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            }
          },
          init = function()
            vim.api.nvim_create_autocmd("User", {
              pattern = "VeryLazy",
              callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                  Snacks.debug.inspect(...)
                end
                _G.bt = function()
                  Snacks.debug.backtrace()
                end

                -- Override print to use snacks for `:=` command
                if vim.fn.has("nvim-0.11") == 1 then
                  vim._print = function(_, ...)
                    dd(...)
                  end
                else
                  vim.print = _G.dd 
                end

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
              end,
            })
        end,
    },
    
    
    {
        "DRoma82/add-subtract-ex.nvim"  ,
        name = "add-subtract-ex"        ,
        opts = {}                       ,
    },
    
    
    {
        "windwp/nvim-autopairs" ,
        name = "autopairs"      ,
        event = "InsertEnter"   ,
        config = true           ,
    },
    
    
    {
        "gennaro-tedesco/nvim-jqx"  ,
        name = "nvim-jqx"           ,
        event = { "BugReadPost" }   ,
        ft = { "json", "yaml" }     ,
    },
    
    
    {
        "iabdelkareem/csharp.nvim"  ,
        name = "csharp"        ,
        dependencies = {
            "williamboman/mason.nvim"   ,
            "mfussengger/nvim-dap"      ,
            "Tastyep/structlog.nvim"    ,
        }                           ,
        lsp = {
            -- Sets if you want to use omnisharp as your LSP
            omnisharp = {
            -- When set to false, csharp.nvim won't launch omnisharp automatically.
                enable = true,
                -- When set, csharp.nvim won't install omnisharp automatically. Instead, the omnisharp instance in the cmd_path will be used.
                cmd_path = nil,
                -- The default timeout when communicating with omnisharp
                default_timeout = 1000,
                -- Settings that'll be passed to the omnisharp server
                enable_editor_config_support = true,
                organize_imports = true,
                load_projects_on_demand = false,
                enable_analyzers_support = true,
                enable_import_completion = true,
                include_prerelease_sdks = true,
                analyze_open_documents_only = false,
                enable_package_auto_restore = true,
                -- Launches omnisharp in debug mode
                debug = false,
            },
            -- Sets if you want to use roslyn as your LSP
            roslyn = {
                -- When set to true, csharp.nvim will launch roslyn automatically.
                enable = false,
                -- Path to the roslyn LSP see 'Roslyn LSP Specific Prerequisites' above.
                cmd_path = nil,
            },
            -- The capabilities to pass to the omnisharp server
            capabilities = nil,
            -- on_attach function that'll be called when the LSP is attached to a buffer
            on_attach = nil,
        },
        config = function()
            require("mason").setup()
            require("csharp").setup()
        end,
    },
    
    
    {
        "kiyloon/python-import"    ,
        name = "python-import.nvim"     ,
        build = "uv tool install . --force --reinstall",
        keys = {
            {
                "<M-CR>",
                function()
                    require("python_import.api").add_import_current_word_and_notify()
                end,
                mode = { "i", "n" },
                silent = true,
                desc = "Add python import",
                ft = "python",
            },
            {
                "<M-CR>",
                function()
                    require("python_import.api").add_import_current_selection_and_notify()
                end,
                mode = "x",
                silent = true,
                desc = "Add python import",
                ft = "python",
            },
            {
                "<space>i",
                function()
                    require("python_import.api").add_import_current_word_and_move_cursor()
                end,
                mode = "n",
                silent = true,
                desc = "Add python import and move cursor",
                ft = "python",
            },
            {
                "<space>i",
                function()
                    require("python_import.api").add_import_current_selection_and_move_cursor()
                end,
                mode = "x",
                silent = true,
                desc = "Add python import and move cursor",
                ft = "python",
            },
            {
                "<space>tr",
                function()
                    require("python_import.api").add_rich_traceback()
                end,
                silent = true,
                desc = "Add rich traceback",
                ft = "python",
            },
        },
        opts = {
            -- Example 1:
                -- Default behaviour for `tqdm` is `from tqdm.auto import tqdm`.
                -- If you want to change it to `import tqdm`, you can set `import = {"tqdm"}` and `import_from = {tqdm = vim.NIL}` here.
                -- If you want to change it to `from tqdm import tqdm`, you can set `import_from = {tqdm = "tqdm"}` here.

            -- Example 2:
                -- Default behaviour for `logger` is `import logging`, ``, `logger = logging.getLogger(__name__)`.
                -- If you want to change it to `import my_custom_logger`, ``, `logger = my_custom_logger.get_logger()`,
                -- you can set `statement_after_imports = {logger = {"import my_custom_logger", "", "logger = my_custom_logger.get_logger()"}}` here.
            extend_lookup_table = {
                ---@type string[]
                import = {
                    -- "tqdm",
                },

                ---@type table<string, string|vim.NIL>
                import_as = {
                    -- These are the default values. Here for demonstration.
                    -- np = "numpy",
                    -- pd = "pandas",
                },

                ---@type table<string, string|vim.NIL>
                import_from = {
                    -- tqdm = vim.NIL,
                    -- tqdm = "tqdm",
                },

                ---@type table<string, string[]|vim.NIL>
                statement_after_imports = {
                    -- logger = { "import my_custom_logger", "", "logger = my_custom_logger.get_logger()" },
                },
            },

            ---Return nil to indicate no match is found and continue with the default lookup
            ---Return a table to stop the lookup and use the returned table as the result
            ---Return an empty table to stop the lookup. This is useful when you want to add to wherever you need to.
            ---@type fun(winnr: integer, word: string, ts_node: TSNode?): string[]?
            custom_function = function(winnr, word, ts_node)
                -- if vim.endswith(word, "_DIR") then
                --     return { "from my_module import " .. word }
                -- end
            end,
        },
    },
    
    
    {
        "AnsonH/copy-python-path.nvim"  ,
        name = "copy-python-path"       ,
        version = "*"                   ,
        cmd = { "CopyPythonPath" }      ,
    },
    
    
    {
        "J-Cowsert/classlayout.nvim"    ,
        ft = { "c", "cpp" }             ,
        opts = {}                       ,
    },
    
    
    {
        "simonwinther/cppman.nvim"  ,
        name = "cppman"             ,
        version = "*",
        cmd = "CPPMan",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        opts = {
            picker = {
                provider = "fzf-lua",
            },
        },
        -- Buffer-local maps in C/C++ files only, so they don't show up in other
        -- filetypes. The require() calls load the plugin on first use.
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "cpp", "c" },
                callback = function(args)
                    vim.keymap.set("n", "<leader>cu", function()
                        require("cppman").open_for(vim.fn.expand("<cword>"))
                    end, { buffer = args.buf, desc = "[C++] open under cursor" })

                    vim.keymap.set("n", "<leader>ck", function()
                        require("cppman").search()
                    end, { buffer = args.buf, desc = "[C++] keyword search" })
                end,
            })
        end,
    },
    
    
    {
        "NTBBloodbath/galaxyline.nvim"  ,
        name = "galaxyline"             ,
    },
    
    
    {
        "romgrk/barbar.nvim"    ,
        name = "barbar"         ,
        dependencies = {
            "lewis6991/gitsigns.nvim"       ,
            "nvim-tree/nvim-web-devicons"   ,
        }                       ,
        init = function()
            vim.g.barbar_auto_setup = false
        end                     ,
        version = "^1.0.0"
    },
    
    
    {
        "sontungexpt/stcursorword"  ,
        name = "stcursorword"       ,
        event = "VeryLazy"          ,
        config = true               ,
    },
    
    
    {
        "amasungh-afk/milli.nvim"   ,
        name = "milli"              ,
        lazy = false                ,
    },
    
    
    {
        "melmass/echo.nvim" ,
        name = "echo"       ,
        opts = {
            demo = true ,
        }                   ,
    },
    
    
    {
        "CRAG666/code_runner.nvim"  ,
        name = "code_runner"        ,
        config = true               ,
    },
    
    
    {
        "Darkskittlz/GitCompanion"  ,
        name = "GitCompanion"       ,
        dependencies = {
            "nvim-lua/plenary.nvim" ,
        }                           ,
        keys = {
            {"<leader>gc", "<CMD>GitCompanion<CR>", desc = "Toggle GitCompanion"}   ,
        }                           ,
        opts = {}                   ,
    },
    
    
    {
        "ldelossa/gh.nvim"  ,
        name = "gh"         ,
        dependencies = {
            {
                "ldelossa/litee.nvim"   ,
                config = function()
                    require("litlee.lib").setup()
                end                     ,
            }   ,
        }                   ,
        config = function()
            require("litee.gh").setup()
        end                 ,
    },
    
    
    {
        "windwp/nvim-ts-autotag"    ,
        name = "ts-autotag"         ,
        opts = {
            enable_close = true             ,
            enable_rename = true            ,
            enable_close_on_slash = false   ,
        }                           ,
    },
    
    
    {
        "saghen/blink.indent"   ,
        name = "blink.indent"   ,
    },
    
    
    -- nvim-unity.nvim          -- for Unity support
}

