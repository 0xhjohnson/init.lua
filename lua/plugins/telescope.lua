return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.*",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>,",  "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
			{ "<leader>/",  "<cmd>Telescope live_grep<cr>",                     desc = "Find in Files (Grep)" },
			{ "<leader>:",  "<cmd>Telescope command_history<cr>",               desc = "Command History" },
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>",                    desc = "status" },
			-- search
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>",                      desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>",                   desc = "Diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                     desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>",                         desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>",                   desc = "Word" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Goto Symbol" },
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "fd", "--type", "file", "--hidden", "--exclude", ".git" },
				},
			},
		},
	},
}
