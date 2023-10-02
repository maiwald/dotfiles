require("maiwald.packer")
require("maiwald.set")
require("maiwald.remap")

local function has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = "*",
    callback = function()
        if not has_value({"markdown", "yaml"}, vim.bo.filetype) then
            local save = vim.fn.winsaveview()
            vim.api.nvim_command(":%s/\\s\\+$//e")
            vim.fn.winrestview(save)
        end
    end,
})
