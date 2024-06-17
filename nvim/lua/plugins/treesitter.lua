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
				endwise = {  -- because of nvim-treesitter-endwise
					enable = true,
				},
			})
		end,
		lazy = false,
		priority = 1000,
	},

	"RRethy/nvim-treesitter-endwise",
}
