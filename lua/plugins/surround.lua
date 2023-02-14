return {
	"echasnovski/mini.surround",
	version = "*",
	keys = function(_, keys)
		local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
		local opts = require("lazy.core.plugin").values(plugin, "opts", false)
		local mappings = {
			{ opts.mappings.add,            desc = "Add surrounding",                     mode = { "n", "v" } },
			{ opts.mappings.delete,         desc = "Delete surrounding" },
			{ opts.mappings.find,           desc = "Find right surrounding" },
			{ opts.mappings.find_left,      desc = "Find left surrounding" },
			{ opts.mappings.highlight,      desc = "Highlight surrounding" },
			{ opts.mappings.replace,        desc = "Replace surrounding" },
			{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
		}
		return vim.list_extend(mappings, keys)
	end,
	opts = {
		mappings = {
			add = "gza",
			delete = "gzd",
			find = "gzf",
			find_left = "gzF",
			highlight = "gzh",
			replace = "gzr",
			update_n_lines = "gzn",
		},
	},
	config = function(_, opts)
		require("mini.surround").setup(opts)
	end,
}
