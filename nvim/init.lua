
-- Visual indent stay in selection
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

local o = vim.o        -- global options
local bo = vim.bo      -- buffer-local options
local wo = vim.wo      -- window-local options

-- Tabs
o.expandtab = false     -- use actual tabs, not spaces
o.tabstop = 4           -- a tab character is 4 spaces wide
o.shiftwidth = 4        -- indentation uses 4 spaces
o.softtabstop = 4       -- how many spaces a Tab inserts in insert mode
o.smarttab = true       -- Tab respects shiftwidth at start of line

-- Optional: apply buffer-local as well (useful for new buffers)
bo.expandtab = false
bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 4

vim.o.cursorline = true;
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF" })
vim.o.relativenumber = true;
