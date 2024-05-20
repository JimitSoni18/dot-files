-- 14rnu
vim.opt.nu = true
vim.opt.rnu = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.smartindent = true

-- undo
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search and highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 5

-- column
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

