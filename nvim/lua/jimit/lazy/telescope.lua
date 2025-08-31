return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>sf', builtin.find_files)
		vim.keymap.set('n', '<leader>sh', function ()
			builtin.find_files({hidden = true})
		end)
		vim.keymap.set('n', "<leader>f", function()
			builtin.git_files({show_untracked = true})
		end)
		vim.keymap.set('n', '<leader>/', function()
			builtin.grep_string({ search = vim.fn.input("Grep:") })
		end)
		vim.keymap.set('n', '<leader>vh', builtin.help_tags)
	end
}
