return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- +-------------------------------------------------+
		-- | A | B | C                             X | Y | Z |
		-- +-------------------------------------------------+
		lualine.setup({
			options = {
				component_separators = "",
				section_separators = "",
				theme = "catppuccin-macchiato",
			},
			sections = {
				lualine_a = { "branch", "diagnostic" },
				lualine_b = {},
				lualine_c = { "filename" },

				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
				},
				lualine_y = { "progress", "location" },
				lualine_z = { "mode" },
			},
		})
	end,
}
