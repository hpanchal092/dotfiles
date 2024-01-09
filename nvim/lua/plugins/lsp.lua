return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"mfussenegger/nvim-lint",
			"stevearc/conform.nvim",
		},

		config = function()
			require("lsp")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",

		config = function()
			require("lsp_signature").setup({
				hint_enable = false,
				hi_parameter = "Visual",
				handler_opts = {
					border = "none",
				},
			})
		end,
	},
}
