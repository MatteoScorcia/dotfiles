return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["o"] = { "open", nowait = true },
					["oc"] = "noop",
					["od"] = "noop",
					["og"] = "noop",
					["om"] = "noop",
					["on"] = "noop",
					["os"] = "noop",
					["ot"] = "noop",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_hidden = false,
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
			default_component_configs = {
				diagnostics = {
					highlights = {
						-- hint = "DiagnosticSignHint",
						-- info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},

				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
		})
		vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left toggle<CR>", {})
	end,
}
