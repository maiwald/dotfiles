return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            go = { 'golangcilint' }, -- nvim-lint's identifier, no dash — not "golangci-lint"
        }

        local lint_augroup = vim.api.nvim_create_augroup('UserLint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
        })
    end,
}
