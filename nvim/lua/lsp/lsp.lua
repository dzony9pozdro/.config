-- lua/lsp/lsp.lua

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "basedpyright" },
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fs.root(bufnr, { ".git", ".luarc.json" }) or vim.fn.expand("%:p:h"))
    end,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
    capabilities = capabilities,
})

vim.lsp.enable("lua_ls")

vim.lsp.config("basedpyright", {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(bufnr, on_dir)
        on_dir(
            vim.fs.root(bufnr, { ".git", "pyproject.toml", "setup.py", "requirements.txt" })
            or vim.fn.expand("%:p:h")
        )
    end,
    capabilities = capabilities,
})

vim.lsp.enable("basedpyright")

