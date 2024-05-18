local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "jimit.lazy",
    change_detection = { notify = false }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', "<leader>f", builtin.git_files, {})
vim.keymap.set('n', '<leader>F', function()
    builtin.grep_string({ search = vim.fn.input("Grep:") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
