local fc = {}
fc[".*"] = { selector = "textarea", priority = 1, takeover = "never" }
vim.g.firenvim_config = { localSettings = fc }
