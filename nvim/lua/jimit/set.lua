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
if package.config:sub(1,1) == '/' then
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
	vim.opt.undodir = os.getenv("USERPROFILE") .. "\\AppData\\Local\\.vim\\undodir"
end
vim.opt.undofile = true

-- search and highlight
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.updatetime = 600
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 5

-- local theme_change = vim.api.nvim_create_augroup('theme_change', {})

RemoveBg = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- vim.api.nvim_create_autocmd('ColorScheme', {
-- 	group = theme_change,
-- 	callback = remove_bg
-- })

local vim_enter = vim.api.nvim_create_augroup('vim_enter', {})

---@param file file*
local process_env = function(file)
	for line in file:lines() do
		local first_part, second_part = line:match("([^=]+)=(.*)");
		if first_part ~= nil and second_part ~= nil then
			vim.env[first_part] = second_part;
		end
	end
end

vim.api.nvim_create_autocmd('VimEnter', {
	group = vim_enter,
	callback = function()
		local cwd = vim.fn.getcwd()
		local init = cwd .. "/.nvim/init.lua"
		local env = cwd .. "/.env.nvim"
		local init_stat = vim.loop.fs_stat(init)
		local env_stat = vim.loop.fs_stat(env)
		if init_stat and init_stat.type == 'file' then
			vim.cmd("so " .. init)
		end
		if env_stat and env_stat.type == 'file' then
			local file = io.open(env, 'r');
			if file then
				process_env(file)
				file:close();
			else
				print("failed to read env")
			end
		end
	end
})
