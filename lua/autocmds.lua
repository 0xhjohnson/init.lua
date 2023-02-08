local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '40' })
	end
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e"
})

-- Enable spellcheck when it matters
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
