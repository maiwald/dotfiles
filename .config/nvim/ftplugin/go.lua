vim.opt_local.expandtab = false
vim.opt_local.softtabstop = 0

-- gopls's formatting request only replicates gofmt; import organizing is a
-- separate source.organizeImports code action, so run it explicitly on save
-- to match goimports' behavior without needing the external binary.
vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = function()
        local params = vim.lsp.util.make_range_params(nil, 'utf-8')
        params.context = { only = { 'source.organizeImports' } }
        local results = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 1000)
        for _, res in pairs(results or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
                end
            end
        end
    end,
})
