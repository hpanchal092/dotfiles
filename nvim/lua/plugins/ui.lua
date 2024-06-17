return {
	{
		"folke/todo-comments.nvim",
		opts = {
			signs = false,
			highlight = {
				before = "",
				keyword = "fg",
				after = "",
				pattern = [[.*<(KEYWORDS)\s*]],
			},
		},
	},
	{ "lewis6991/gitsigns.nvim", config = true },

	{
		"nvim-lualine/lualine.nvim",

		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
					icons_enabled = false,
					globalstatus = true,
					component_separators = "│",
					section_separators = "",
					-- component_separators = { left = '', right = '' },
					-- section_separators = { left = '', right = '' },
				},
			})
		end,
	},

	{
		"ThePrimeagen/harpoon",

		config = function()
			require("harpoon").setup({
				tabline = true,
				tabline_prefix = "  ",
				tabline_suffix = "  ",
			})

			vim.keymap.set("n", "<M-m>", function()
				require("harpoon.ui").toggle_quick_menu()
			end, { silent = true })
			vim.keymap.set("n", "<M-h>", function()
				require("harpoon.mark").add_file()
				vim.cmd("redrawtabline")
			end, { silent = true })

			vim.keymap.set("n", "<M-j>", function()
				require("harpoon.ui").nav_file(1)
			end, { silent = true })
			vim.keymap.set("n", "<M-k>", function()
				require("harpoon.ui").nav_file(2)
			end, { silent = true })
			vim.keymap.set("n", "<M-l>", function()
				require("harpoon.ui").nav_file(3)
			end, { silent = true })
			vim.keymap.set("n", "<M-;>", function()
				require("harpoon.ui").nav_file(4)
			end, { silent = true })

			vim.api.nvim_set_hl(0, "HarpoonInactive", { link = "TabLineFill" })
			vim.api.nvim_set_hl(0, "HarpoonActive", { fg = "White" })
			vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = "#61afef", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = "#61afef" })
		end,
	},
}
