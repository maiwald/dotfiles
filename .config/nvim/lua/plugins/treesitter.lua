return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        lazy = false,
        config = function()
            local treesitter = require('nvim-treesitter')
            treesitter.install {
                "c",
                "clojure",
                "go",
                "html",
                "javascript",
                "json",
                "kotlin",
                "lua",
                "query",
                "ruby",
                "scss",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
            }
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0,           -- How many lines the window should span. Values <= 0 mean no limit.
            multiline_threshold = 5, -- Maximum number of lines to show for a single context
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        keys = {
            -- function definition
            {
                "]m",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
                end,
            },
            {
                "]M",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
                end,
            },
            {
                "[m",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
                end,
            },
            {
                "[M",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
                end,
            },

            -- function parameters
            {
                "]a",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
                end,
            },
            {
                "]A",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects")
                end,
            },
            {
                "[a",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
                end,
            },
            {
                "[A",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects")
                end,
            },
        }
    }
}
