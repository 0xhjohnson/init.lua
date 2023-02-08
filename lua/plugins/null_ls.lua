return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")

		return {
			sources = {
				nls.builtins.formatting.prettierd,
				nls.builtins.formatting.goimports,
				nls.builtins.diagnostics.vale,
				nls.builtins.diagnostics.eslint_d,
				nls.builtins.code_actions.eslint_d
			},
		}
	end,
}
