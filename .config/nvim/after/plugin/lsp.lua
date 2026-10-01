require('mason').setup()

require('mason-lspconfig').setup({
    -- All *installation* is centralized in mason-tool-installer below; this
    -- call only governs *enabling* servers once Mason has installed them.
    automatic_enable = {
        -- kotlin_lsp (JetBrains' official Kotlin LSP) auto-enables flakily
        -- before custom init runs, so it's installed via Mason but enabled
        -- manually below instead of through automatic_enable.
        exclude = { 'kotlin_lsp' },
    },
})

require('mason-tool-installer').setup({
    ensure_installed = {
        -- Mason PACKAGE names (differ from lspconfig/vim.lsp.enable server names)
        'lua-language-server',        -- server: lua_ls
        'typescript-language-server', -- server: ts_ls
        'eslint-lsp',                 -- server: eslint
        'gopls',                      -- server: gopls
        'zls',                        -- server: zls
        'kotlin-lsp',                 -- server: kotlin_lsp (installed only, enabled manually below)

        'prettier',        -- formatter
        'ktlint',          -- formatter
        'golangci-lint',   -- linter
    },
    auto_update = false,
    run_on_start = true,
})

vim.lsp.config('ts_ls', {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "",
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
        "typescriptreact",
    },
})

vim.lsp.config('lua_ls', {
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

-- Manually enabled because it's excluded from mason-lspconfig's automatic_enable (see above).
vim.lsp.enable('kotlin_lsp')

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
        buf_set_keymap('n', '<leader>ff', '<cmd>lua require("conform").format({ lsp_format = "fallback" })<CR>', opts)
    end,
})
