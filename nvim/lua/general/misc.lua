-- highlight briefly on yank
local group = vim.api.nvim_create_augroup("my_group", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 100, on_visual = false })
	end,
	group = group,
})

-- override vim.ui.input, mainly for lsp rename
local function wininput(opts, on_confirm, win_opts)
	-- create a "prompt" buffer that will be deleted once focus is lost
	local buf = vim.api.nvim_create_buf(false, false)

	local prompt = opts.prompt or ""
	local default = opts.default or ""

	-- Calculate a minimal width with a bit buffer
	local default_width = vim.str_utfindex(default) + 10
	local prompt_width = vim.str_utfindex(prompt) + 10
	local win_width = default_width > prompt_width and default_width or prompt_width

	local default_win_config = {
		relative = "editor",
		row = vim.o.lines / 2 - 1,
		col = vim.o.columns / 2 - win_width / 2,
		width = win_width,
		height = 1,
		focusable = true,
		style = "minimal",
		border = "rounded",
		title = prompt,
	}

	win_opts = vim.tbl_deep_extend("force", default_win_config, win_opts)

	-- open the floating window pointing to our buffer and show the prompt
	vim.cmd("norm wb")
	local win = vim.api.nvim_open_win(buf, true, win_opts)
	vim.api.nvim_win_set_option(win, "winhighlight", "NormalFloat:Normal,FloatBorder:FloatTitle")

	vim.cmd("startinsert")
	-- set some keymaps: CR confirm and exit, ESC in normal mode to abort

	vim.keymap.set({ "i", "n" }, "<CR>", function()
		local lines = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
		on_confirm(lines[1])
		vim.api.nvim_input("<Esc>:close!<CR>:stopinsert<CR>l")
		vim.api.nvim_buf_delete(buf, { force = true })
	end, { silent = true, buffer = buf })

	vim.keymap.set("n", "<esc>", function()
		return vim.fn.mode() == "n" and "ZQ" or "<esc>"
	end, { expr = true, silent = true, buffer = buf })

	vim.keymap.set("n", "q", function()
		return vim.fn.mode() == "n" and "ZQ" or "<esc>"
	end, { expr = true, silent = true, buffer = buf })

	-- set the default text (needs to be deferred after the prompt is drawn)
	vim.defer_fn(function()
		vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, { default })
		vim.cmd("stopinsert")
		vim.api.nvim_win_set_cursor(win, { 1, 1 })
	end, 15)
end

vim.ui.input = function(opts, on_confirm)
	wininput(opts, on_confirm, { border = "rounded", relative = "cursor", row = 1, col = -1 })
end
