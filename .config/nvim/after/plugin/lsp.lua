local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.clojure_lsp.setup({ capabilities = capabilities })
lspconfig.eslint.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.solargraph.setup({ capabilities = capabilities })
lspconfig.ts_ls.setup({ capabilities = capabilities })
lspconfig.zls.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({
    capabilities = capabilities,
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
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end,
})
