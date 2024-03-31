return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

        dashboard.section.buttons.val = {
            dashboard.button("<leader> ff", "   Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("<leader> ft", "   Find Text", "<cmd>Telescope live_grep<CR>"),
        }

		dashboard.section.footer.val = function()
			local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
			local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
			return datetime .. version
		end

		alpha.setup(dashboard.opts)
	end,
}
