return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				hl = {
					border = "FloatTitle",
				},
			},
			keymap = {
				fzf = {
					["ctrl-u"] = "preview-page-up",
					["ctrl-d"] = "preview-page-down",
				},
			},
		})

		vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { silent = true })
		vim.keymap.set("n", "<C-P>", "<cmd>FzfLua files<CR>")
		vim.keymap.set("n", "<C-F>", "<cmd>FzfLua live_grep<CR>")
		vim.keymap.set("n", "<C-B>", "<cmd>FzfLua buffers<CR>")

		require("fzf-lua").register_ui_select()
	end,
}
