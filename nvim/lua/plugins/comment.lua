return {
	"numToStr/Comment.nvim",
	lazy = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		vim.g.skip_ts_context_commentstring_module = true
		---@diagnostic disable: missing-fields
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
