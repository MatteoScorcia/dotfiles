return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "williamboman/mason-lspconfig.nvim" },
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local wk = require("which-key")

			-- lsp leader keymaps
			wk.add({
				{ "<leader>l", group = "Lsp" },
				{ "<leader>li", "<cmd>LspInfo<CR>", desc = "Info" },
				{ "<leader>lr", "<cmd>LspRestart<CR>", desc = "Restart" },
				{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
				{ "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
				{ "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Buffer diagnostics" },
				{ "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line diagnostics" },
				{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
				{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev diagnostic" },
				{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix" },
			})

			wk.add({
				{ "<leader>l", group = "Lsp" },
				{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action", mode = "v" },
			})

			-- lsp  goto keymaps
			local function lsp_keymaps(bufnr)
				local opts = { noremap = true, silent = true }
				local keymap = vim.api.nvim_buf_set_keymap

				opts.desc = "Go to declaration"
				keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

				opts.desc = "Show LSP definitions"
				keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap(bufnr, "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Show documentation on hover"
				keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP references"
				keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			end

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
				virtual_text = {
					prefix = "",
				},
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					source = true,
					style = "minimal",
					border = "rounded",
					header = "",
					prefix = "",
				},
			})

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- on_attach function (assign to every lsp server config)
			local on_attach = function(client, bufnr)
				lsp_keymaps(bufnr)

				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr })
				end
			end

			-- styiling lsp handlers
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			-- lspconfig setup
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"gopls",
					"zls",

					-- python
					"pyright",

					-- web
					"tsserver",
					"tailwindcss",
					"cssls",
					"html",
				},
			})

			mason_lspconfig.setup_handlers({
				-- default handler for installed server
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				-- configure lua server with special settings
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						on_attach = on_attach,
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
				-- configure eslint server with special settings
				["eslint"] = function()
					lspconfig["eslint"].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							on_attach(client, bufnr)
						end,
					})
				end,
			})
		end,
	},
}
