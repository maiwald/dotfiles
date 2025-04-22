local lspconfig = require('lspconfig')

lspconfig.clojure_lsp.setup({})
lspconfig.eslint.setup({})
lspconfig.gopls.setup({})
lspconfig.solargraph.setup({})
lspconfig.ts_ls.setup({})
lspconfig.zls.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(event)
        local bufnr = event.buf
        local opts = { noremap = true, silent = true }
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, event.buf, { autocomplete = true })
            buf_set_keymap('i', '<C-Space>', '<cmd>lua vim.lsp.completion.get()<cr>', opts)
        end

        -- Mappings.

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
        buf_set_keymap('n', 'grr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end,
})
