return {
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		cmd = "Gitsigns",
		config = function()
			local wk = require("which-key")
			local gs = require("gitsigns")

			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>h", group = "Hunk" },
			})

			gs.setup({
				on_attach = function(bufnr)
					local keymap = vim.keymap -- for conciseness
					local opts = { buffer = bufnr }

					-- Hunk Navigation
					opts.desc = "Prev Hunk"
					keymap.set("n", "<leader>hk", gs.prev_hunk, opts)

					opts.desc = "Next Hunk"
					keymap.set("n", "<leader>hj", gs.next_hunk, opts)

					-- Hunk Actions
					opts.desc = "Preview Hunk"
					keymap.set("n", "<leader>hp", gs.preview_hunk, opts)

					opts.desc = "Stage Hunk"
					keymap.set("n", "<leader>hs", gs.stage_hunk, opts)

					opts.desc = "Reset Hunk"
					keymap.set("n", "<leader>hr", gs.reset_hunk, opts)

					opts.desc = "Reset Hunk"
					keymap.set("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, opts)

					opts.desc = "Reset Hunk"
					keymap.set("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, opts)

					opts.desc = "Stage Hunk"
					keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)

					-- Git Actions
					opts.desc = "Stage Buffer"
					keymap.set("n", "<leader>gS", gs.stage_buffer, opts)

					opts.desc = "Reset Buffer"
					keymap.set("n", "<leader>gr", gs.reset_buffer, opts)

					opts.desc = "Blame Line"
					keymap.set("n", "<leader>gb", function()
						gs.blame_line({ full = true })
					end, opts)

					opts.desc = "Toggle Blame line"
					keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, opts)

					opts.desc = "Diff this"
					keymap.set("n", "<leader>gd", gs.diffthis, opts)
				end,
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "┃" },
					untracked = { text = "┃" },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				update_debounce = 200,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open lazygit" },
		},
	},
}
