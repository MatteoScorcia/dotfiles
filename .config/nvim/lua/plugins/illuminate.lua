return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"mason",
				"fugitive",
				"alpha",
				"neo-tree",
				"lazy",
				"Trouble",
				"DiffviewFiles",
				"TelescopePrompt",
			},
		})
	end,
}
