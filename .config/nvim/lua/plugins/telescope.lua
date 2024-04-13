return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
			{ "nvim-telescope/telescope-project.nvim" },
		},
		config = function()
			require("telescope").load_extension("project")

			local wk = require("which-key")
			wk.register({
				["<leader>f"] = { name = "+File" },
				["<leader>fb"] = { "<cmd>Telescope buffers previewer=false<CR>", "Find buffers" },
				["<leader>fg"] = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
				["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
				["<leader>fp"] = { "<cmd>lua require('telescope').extensions.project.project{}<CR>", "Projects" },
				["<leader>ft"] = { "<cmd>Telescope live_grep<CR>", "Find Text" },
				["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help" },
				["<leader>fl"] = { "<cmd>Telescope resume<CR>", "Last Search" },
				["<leader>fr"] = { "<cmd>Telescope oldfiles<CR>", "Recent File" },
			})

			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					initial_mode = "insert",
					selection_strategy = "reset",
					path_display = { "smart" },
					prompt_prefix = " ",
					selection_caret = " ",
					entry_prefix = "   ",
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					live_grep = {
						theme = "dropdown",
					},

					grep_string = {
						theme = "dropdown",
					},

					find_files = {
						theme = "dropdown",
						previewer = false,
					},

					buffers = {
						theme = "dropdown",
						previewer = false,
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},

					planets = {
						show_pluto = true,
						show_moon = true,
					},

					colorscheme = {
						enable_preview = true,
					},

					lsp_references = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_definitions = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_declarations = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_implementations = {
						theme = "dropdown",
						initial_mode = "normal",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
