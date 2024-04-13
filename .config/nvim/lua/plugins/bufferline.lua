return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				diagnostics = "nvim_lsp",
				left_mouse_command = "buffer %d",
				middle_mouse_command = "bdelete! %d",
				right_mouse_command = nil,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				hover = {
					enabled = true,
					delay = 0,
					reveal = { "close" },
				},
				buffer_close_icon = "×",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
			},
		})
	end,
}
