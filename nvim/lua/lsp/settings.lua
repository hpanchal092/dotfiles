-- put server specific settings here
return {
	jdtls = {
		java = {
			{
				signatureHelp = { enabled = true },
				contentProvider = { preferred = "fernflower" },
			},
		},
	},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
