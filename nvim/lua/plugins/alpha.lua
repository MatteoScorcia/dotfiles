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
			dashboard.button("f", "  Find file", "<cmd>Telescope find_files <cr>"),
			dashboard.button("t", "󰙩  Find text", "<cmd>Telescope live_grep <cr>"),
			dashboard.button(
				"p",
				"  Find project",
				"<cmd>lua require('telescope').extensions.project.project() <cr>"
			),
			dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles <cr>"),
			dashboard.button("c", "  Config", "<cmd>e ~/.config/nvim/init.lua <cr>"),
			dashboard.button("q", "  Quit", "<cmd>qa <cr>"),
		}

		dashboard.section.footer.val = function()
			local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
			local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
			return datetime .. version
		end

		alpha.setup(dashboard.opts)
	end,
}
