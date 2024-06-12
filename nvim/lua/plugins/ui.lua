return {
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

	-- {
	-- 	"willothy/nvim-cokeline",
	--
	-- 	config = function()
	-- 		local get_hex = require("cokeline.hlgroups").get_hl_attr
	--
	-- 		require("cokeline").setup({
	-- 			default_hl = {
	-- 				fg = function(buffer)
	-- 					return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
	-- 				end,
	-- 				bg = "NONE",
	-- 			},
	-- 			components = {
	-- 				{
	-- 					text = function(buffer)
	-- 						return not buffer.is_first and "▏ " or "  "
	-- 					end,
	-- 					fg = function()
	-- 						return get_hex("Normal", "fg")
	-- 					end,
	-- 				},
	-- 				{
	-- 					text = function(buffer)
	-- 						return buffer.unique_prefix
	-- 					end,
	-- 					fg = get_hex("Comment", "fg"),
	-- 				},
	-- 				{
	-- 					text = function(buffer)
	-- 						return buffer.filename .. "  "
	-- 					end,
	-- 					bold = function(buffer)
	-- 						return buffer.is_focused
	-- 					end,
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- cycle through buffers
	-- 		vim.keymap.set("n", "<leader>n", "<Plug>(cokeline-focus-next)", { silent = true })
	-- 		vim.keymap.set("n", "<leader>p", "<Plug>(cokeline-focus-prev)", { silent = true })
	-- 		vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { silent = true })
	-- 	end,
	-- },
}
