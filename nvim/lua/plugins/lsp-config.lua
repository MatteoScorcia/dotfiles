return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({})

			mason_lspconfig.setup({
				ensure_installed = {
					-- misc
					"lua_ls",
					"clangd",
					"gopls",
					"zls",
					"pylsp",

					-- javascript
					"tsserver",
					"tailwindcss",
					"cssls",
					"html",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local wk = require("which-key")

			wk.register({
				["<leader>l"] = { name = "+Lsp" },
			})

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local keymap = vim.keymap -- for conciseness
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = event.buf, silent = true }

					-- set keybinds
					opts.desc = "Show LSP references"
					keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

					opts.desc = "Show LSP type definitions"
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					opts.desc = "Go to previous diagnostic"
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostic"
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Smart rename"
					keymap.set("n", "<leader>la", vim.lsp.buf.rename, opts)

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)

					opts.desc = "Info LSP"
					keymap.set("n", "<leader>li", ":LspInfo<CR>", opts)
				end,
			})

			mason_lspconfig.setup_handlers({
				-- default handler for installed server
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			})
		end,
	},
}
