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

		lsp.preset("recommended")

		lsp.ensure_installed({
			"tsserver",
			"lua_ls",
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

		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			['<C-y>'] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		cmp_mappings['<Tab>'] = nil
		cmp_mappings['<S-Tab>'] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings
		})

		lsp.on_attach(function(client, bufnr)
			function optsWithDesc(desc)
				return {
					buffer = bufnr,
					remap = false,
					desc = desc
				}
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, optsWithDesc("Hover"))
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", optsWithDesc("Goto Definition"))
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", optsWithDesc("References"))
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, optsWithDesc("Goto Declaration"))
			vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", optsWithDesc("Goto Implementation"))
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", optsWithDesc("Goto Type Definition"))
			vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, optsWithDesc("Signature Help"))
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, optsWithDesc("Next Diagnostic"))
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, optsWithDesc("Prev Diagnostic"))
			vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = "ERROR" }) end,
				optsWithDesc("Next Error"))
			vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = "ERROR" }) end,
				optsWithDesc("Prev Error"))
			vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = "WARN" }) end,
				optsWithDesc("Next Warning"))
			vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = "WARN" }) end,
				optsWithDesc("Prev Warning"))
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, optsWithDesc("Line Diagnostic"))
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, optsWithDesc("Code Action"))
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, optsWithDesc("Rename"))
			vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, optsWithDesc("Format Document"))

			lsp.buffer_autoformat()
		end)

		lsp.nvim_workspace()
		lsp.setup()
	end
}
