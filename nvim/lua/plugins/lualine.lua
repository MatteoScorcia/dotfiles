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
				lualine_c = { "buffers" },

				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { "location" },
				lualine_z = { "mode" },
			},
		})
	end,
}
