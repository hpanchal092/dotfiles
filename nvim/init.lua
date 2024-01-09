require("general")

-- install lazy if its not installed already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local lazy_opts = {
	ui = {
		icons = {
			cmd = "🤖",
			config = "🔨",
			event = "📅",
			ft = "📂",
			init = "⚙️",
			keys = "🔑",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

-- plugins
require("lazy").setup("plugins", lazy_opts)
