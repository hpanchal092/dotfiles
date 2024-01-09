return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				endwise = {
					enable = true,
				},
			})
		end,
		lazy = false,
		priority = 1000,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",

		config = function()
			vim.g.skip_ts_context_commentstring_module = true
			require("ts_context_commentstring").setup()
		end,
	},

	"windwp/nvim-ts-autotag",
	"RRethy/nvim-treesitter-endwise",
}
