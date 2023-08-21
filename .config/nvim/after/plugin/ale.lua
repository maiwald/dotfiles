-- vim.g.ale_linters = {
--     ['clojure'] = { 'clj-kondo' },
--     ['go'] = { 'golangci-lint' },
--     ['javascript'] = { 'eslint' },
--     ['typescriptreact'] = { 'tsserver', 'eslint' }
-- }

vim.g.ale_fixers = {
    ['css'] = { 'prettier' },
    ['go'] = { 'goimports', 'gofmt' },
    ['javascript'] = { 'prettier' },
    ['json'] = { 'prettier' },
    ['jsonc'] = { 'prettier' },
    ['ruby'] = { 'rubocop' },
    ['scss'] = { 'prettier' },
    ['typescript'] = { 'prettier' },
}

vim.g.ale_fix_on_save = 1
vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_go_golangci_lint_package = 1
