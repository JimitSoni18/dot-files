local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
    float = {
        source = 'if_many',
        focusable = false,
    },
}, nil)

vim.api.nvim_command('autocmd CursorHold * lua vim.diagnostic.open_float(nil, {scope = "line", close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave"}})')

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"html",
		"emmet_ls",
		"cssmodules_ls",
		"tsserver",
		"eslint",
		"lua_ls",
		"rust_analyzer"
	}
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
	['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }
})
