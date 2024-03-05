return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")

		return {
			sources = {
				nls.builtins.formatting.eslint_d,
				nls.builtins.formatting.prettierd.with({
					filetypes = { 
						"css",
						"html",
						"json",
						"graphql",
						"yaml",
						"markdown",
					},
				}),
				nls.builtins.formatting.goimports,
				nls.builtins.diagnostics.vale,
				nls.builtins.diagnostics.eslint_d,
				nls.builtins.code_actions.eslint_d
			},
			on_attach = function(client)
				if client.server_capabilities.document_formatting then
					vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
				end
			end,
		}
	end,
}
