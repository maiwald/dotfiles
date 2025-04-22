return {
    {
        'dense-analysis/ale',
        config = function()
            vim.g.ale_linters_explicit = 1
            vim.g.ale_linters = {
                clojure = { 'clj-kondo' },
                go = { 'golangci-lint' },
                ruby = { 'rubocop', 'ruby' },
            }

            vim.g.ale_fixers = {
                astro = { 'prettier' },
                css = { 'prettier' },
                go = { 'goimports', 'gofmt' },
                html = { 'prettier' },
                -- ['javascript'] = { 'prettier' },
                json = { 'prettier' },
                jsonc = { 'prettier' },
                mjs = { 'prettier' },
                ruby = { 'rubocop' },
                scss = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                vue = { 'prettier' },
                xhtml = { 'prettier' },
            }

            vim.g.ale_fix_on_save = 1
            vim.g.ale_ruby_rubocop_executable = 'bundle'
            vim.g.ale_go_golangci_lint_package = 1
        end
    }
}
