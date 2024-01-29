return {
	"simonmclean/triptych.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	event = 'VeryLazy',
	keys = {
		{ "<leader>-", "<cmd>:Triptych<cr>", desc = "File Explorer" },
	},
	config = function()
		require("triptych").setup()
	end
}
