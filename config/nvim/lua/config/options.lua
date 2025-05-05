vim.g.mapleader = " " -- The leader key is used in mappings (e.g., <leader>w for saving a file).

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Tab width = 4 spaces (Go standard)
vim.opt.shiftwidth = 4 -- Indentation width = 4 spaces
vim.opt.softtabstop = 4 -- When pressing Tab, use 4 spaces
vim.opt.autoindent = true -- Keep indenting new lines
vim.opt.smartindent = true -- Smarter auto-indentation
vim.opt.wrap = false -- Disable word wrap for better readability

vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- But case-sensitive if uppercase is used
vim.opt.incsearch = true -- Show search results as you type
vim.opt.hlsearch = true -- Highlight search results
vim.opt.path:append("**") -- Enable recursive file searching
vim.opt.wildignore:append({ "*/node_modules/*", "*/vendor/*", "*/.git/*" }) -- Ignore unnecessary directories
vim.opt.scrolloff = 8 -- Keep at least 8 lines visible above/below cursor
vim.opt.cursorline = true -- Highlight the current line
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = false -- Show relative line numbers for quick navigation
vim.opt.title = true

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- vim.g.lazyvim_prettier_needs_config = true -- Enables custom Prettier settings for LazyVim.
-- vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"
