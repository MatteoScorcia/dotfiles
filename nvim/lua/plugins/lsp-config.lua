return {
	{
		"williamboman/mason.nvim",
        lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
        lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "zls", "pylsp", "tsserver", "eslint", "tailwindcss", "cssls", "html" },
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
        lazy = false,
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
                    -- lua
					null_ls.builtins.formatting.stylua,
                    -- go
                    null_ls.builtins.formatting.gofmt,
                    -- jabascript
                    null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
        lazy = false,
		config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.eslint.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
