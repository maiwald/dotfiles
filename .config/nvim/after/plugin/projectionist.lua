vim.g.projectionist_heuristics = {
    ["*.go"] = {
        ["*.go"] = { alternate = '{}_test.go', type = 'source' },
        ["*_test.go"] = { alternate = '{}.go', type = 'test' },
    },
    ["*.rb"] = {
        ["*.rb"] = { alternate = 'spec/{}_spec.rb', type = 'source' },
        ["spec/*_spec.rb"] = { alternate = '{}.rb', type = 'test' },
    }
}
