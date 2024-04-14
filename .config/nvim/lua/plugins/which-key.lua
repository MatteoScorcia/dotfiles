return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		mode = "n",
		prefix = "<leader>",
	},
	config = function()
		require("which-key").setup({
			window = {
				border = "rounded",
				position = "bottom",
				padding = { 2, 2, 2, 2 },
			},
		})
	end,
}
