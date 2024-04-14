return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enabled = true },
			ensure_installed = {
				"c",
				"zig",
				"go",
				"rust",
				"sql",
				"lua",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"scss",
				"yaml",
				"toml",
				"json5",
				"dockerfile",
				"markdown",
				"make",
				"vimdoc",
			},
		})
	end,
}
