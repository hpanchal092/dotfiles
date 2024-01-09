return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("onedark").setup({
			code_style = {
				comments = "none",
			},
		})
		require("onedark").load()
	end,
}
