return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	event = "VeryLazy",
	dependencies = {
		-- LSP support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Autocompletion
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua" },
		-- Snippets
		{
			"L3MON4D3/LuaSnip",
			version = "1.*",
			build = "make install_jsregexp",
		},
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		local lsp = require('lsp-zero')

		lsp.preset('recommended')

		lsp.ensure_installed({
			"tsserver",
			"sumneko_lua",
			"rust_analyzer",
			"html",
			"cssls",
			"bashls",
			"jsonls",
			"yamlls",
			"dockerls",
			"gopls",
			"marksman",
			"sqlls",
			"tailwindcss"
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
			vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
			vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
			vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>v", function() vim.lsp.buf.signature_help() end, opts)
			vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format() end, opts)

			lsp_group = vim.api.nvim_create_augroup("LSP", { clear = true })
			vim.api.nvim_create_autocmd(
				{ "BufWritePre" },
				{ callback = function() vim.lsp.buf.format() end, group = lsp_group }
			)
		end)

		lsp.nvim_workspace()
		lsp.setup()
	end
}
