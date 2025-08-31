return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('vscode').setup({
			transparent = true,
			italic_comments = true,
		})
	end
}
