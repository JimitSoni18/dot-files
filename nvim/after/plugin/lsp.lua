local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"tsserver",
		"eslint",
		"lua_ls",
		"rust_analyzer"
	}
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}

lsp.setup()
