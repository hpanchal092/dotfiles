local get_hex = require("cokeline.hlgroups").get_hl_attr

require("cokeline").setup({
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = "NONE",
	},
	components = {
		{
			text = function(buffer)
				return not buffer.is_first and "▏ " or "  "
			end,
			fg = function()
				return get_hex("Normal", "fg")
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix
			end,
			fg = get_hex("Comment", "fg"),
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			bold = function(buffer)
				return buffer.is_focused
			end,
		},
	},
})

-- cycle through buffers
vim.keymap.set("n", "<leader>n", "<Plug>(cokeline-focus-next)", { silent = true })
vim.keymap.set("n", "<leader>p", "<Plug>(cokeline-focus-prev)", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { silent = true })
