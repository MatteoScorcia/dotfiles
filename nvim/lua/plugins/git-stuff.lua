return {
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gs = require("gitsigns")
			local wk = require("which-key")
			gs.setup()

			vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
			vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })

			wk.register({
				["<leader>g"] = { name = "+Gitsigns" },
				["<leader>gb"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame" },
				["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
				["<leader>gr"] = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },

				["<leader>gR"] = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
				["<leader>gs"] = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },

				["<leader>gd"] = { "<cmd>Gitsigns diffthis<cr>", "Diff this" },
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
