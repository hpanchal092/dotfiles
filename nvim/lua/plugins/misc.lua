return {
	{
		"glacambre/firenvim",

		build = function()
			vim.fn["firenvim#install"](0)
		end,

		config = function()
			local fc = {}
			fc[".*"] = { selector = "textarea", priority = 1, takeover = "never" }
			vim.g.firenvim_config = { localSettings = fc }
		end,
	},

	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
}
