require("config.lazy")
require('mini.statusline').setup()
require("mason").setup()
require('lsp.lsp')
require('config.cmp')

vim.lsp.enable('basedpyright')
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
vim.o.relativenumber = true

