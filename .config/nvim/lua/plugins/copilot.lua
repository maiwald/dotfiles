return {
    'github/copilot.vim',
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>c", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanionCat" },
        },

    }
}
