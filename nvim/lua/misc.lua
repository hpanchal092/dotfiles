-- highlight briefly on yank
local group = vim.api.nvim_create_augroup("my_group", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
    end;
    group = group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    command = "silent! !pdflatex %",
    group = group,
})

-- toggle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.disable()
    else
        vim.diagnostic.enable()
    end
end
vim.keymap.set('n', '<leader>d', toggle_diagnostics)

local function wininput(opts, on_confirm, win_opts)
    -- create a "prompt" buffer that will be deleted once focus is lost
    local buf = vim.api.nvim_create_buf(false, false)
    vim.bo[buf].buftype = "prompt"
    vim.bo[buf].bufhidden = "wipe"

    local prompt = opts.prompt or ""
    local default_text = opts.default or ""

    -- defer the on_confirm callback so that it is
    -- executed after the prompt window is closed
    local deferred_callback = function(input)
        vim.defer_fn(function()
            on_confirm(input)
        end, 10)
    end

    -- set prompt and callback (CR) for prompt buffer
    vim.fn.prompt_setprompt(buf, prompt)
    vim.fn.prompt_setcallback(buf, deferred_callback)

    -- set some keymaps: CR confirm and exit, ESC in normal mode to abort
    vim.keymap.set({ "i", "n" }, "<CR>", "<CR><Esc>:close!<CR>:stopinsert<CR>", {
        silent = true,
        buffer = buf,
    })
    vim.keymap.set("n", "<esc>", function()
        return vim.fn.mode() == "n" and "ZQ" or "<esc>"
    end, { expr = true, silent = true, buffer = buf })

    vim.keymap.set("n", "q", function()
        return vim.fn.mode() == "n" and "ZQ" or "<esc>"
    end, { expr = true, silent = true, buffer = buf })

    local default_win_opts = {
        relative = "editor",
        row = vim.o.lines / 2 - 1,
        col = vim.o.columns / 2 - 25,
        width = 50,
        height = 1,
        focusable = true,
        style = "minimal",
        border = "rounded",
    }

    win_opts = vim.tbl_deep_extend("force", default_win_opts, win_opts)

    -- adjust window width so that there is always space
    -- for prompt + default text plus a little bit
    win_opts.width = #default_text + #prompt + 5 < win_opts.width and win_opts.width or #default_text + #prompt + 5

    -- open the floating window pointing to our buffer and show the prompt
    local win = vim.api.nvim_open_win(buf, true, win_opts)
    vim.api.nvim_win_set_option(win, "winhighlight", "Search:None")

    vim.cmd("startinsert")

    -- set the default text (needs to be deferred after the prompt is drawn)
    vim.defer_fn(function()
        vim.api.nvim_buf_set_text(buf, 0, #prompt, 0, #prompt, { default_text })
        vim.cmd("stopinsert") -- vim.api.nvim_input("<ESC>")
        vim.api.nvim_win_set_cursor(0, { 1, #prompt + 1 })
    end, 15)
end

-- override vim.ui.input ( telescope rename/create, lsp rename, etc )
vim.ui.input = function(opts, on_confirm)
    -- intercept opts and on_confirm,
    -- check buffer options, filetype, etc and set window options accordingly.
    wininput(opts, on_confirm, { border = "rounded", relative = "cursor", row = 1, col = 1, width = 0 })
end
