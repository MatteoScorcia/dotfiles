return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
            { "ahmedkhalf/project.nvim", event = "VeryLazy" }
		},
		config = function()
            require("telescope").load_extension('projects')

			local wk = require("which-key")
			wk.register({
                ["<leader>f"] = { name = "+File" },
				["<leader>fb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find buffers" },
				["<leader>fg"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
				["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
				["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
				["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
				["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
				["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			})

            local actions = require "telescope.actions"
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

                            ["<C-d>"] = actions.delete_buffer + actions.move_to_top
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
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
