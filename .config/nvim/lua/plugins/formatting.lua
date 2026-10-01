return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            css = { 'prettier' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            json = { 'prettier' },
            jsonc = { 'prettier' },
            scss = { 'prettier' },
            typescript = { 'prettier' },
            typescriptreact = { 'prettier' },
            vue = { 'prettier' },
            xhtml = { 'prettier' },
            -- go: no entry — falls back to gopls via LSP (see default_format_opts)
        },
        default_format_opts = {
            lsp_format = 'fallback',
        },
        format_on_save = {
            timeout_ms = 2000,
            lsp_format = 'fallback',
        },
    },
}
