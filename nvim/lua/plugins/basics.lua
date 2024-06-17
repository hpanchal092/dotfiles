return {
	"nvim-lua/plenary.nvim",
	{ "windwp/nvim-autopairs", config = true },
	{ "windwp/nvim-ts-autotag", config = true },
	"tpope/vim-sleuth",

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = { enable_autocmd = false },
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		opts = {
			use_icons = false,
			signs = {
				fold_closed = "▶ ",
				fold_open = "⯆ ",
				done = "✓",
			},
		},
	},
}
