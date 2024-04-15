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

			mason.setup({
				ui = {
					border = "rounded",
				},
			})

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

			-- lsp leader keymaps
			wk.register({
				["<leader>l"] = { name = "+Lsp" },
				["<leader>li"] = { "<cmd>LspInfo<CR>", "Info" },
				["<leader>lr"] = { "<cmd>LspRestart<CR>", "Restart" },
				["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
				["<leader>r"] = { "<cdm>lua vim.lsp.buf.rename()<CR>", "Rename" },
				["<leader>D"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics" },
				["<leader>d"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line disgnostics" },
				["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
				["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
				["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
			})

			wk.register({
				["<leader>l"] = { name = "+Lsp" },
				["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action", mode = "v" },
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

			-- todo: remove from nvim 0.10
			local function sign_define(args)
				vim.fn.sign_define(args.name, {
					texthl = args.name,
					text = args.text,
					numhl = "",
				})
			end
			sign_define({ name = "DiagnosticSignError", text = "" })
			sign_define({ name = "DiagnosticSignWarn", text = "" })
			sign_define({ name = "DiagnosticSignHint", text = "" })
			sign_define({ name = "DiagnosticSignInfo", text = "" })

			vim.diagnostic.config({
				-- from nvim 0.10
				-- signs = {
				-- 	text = {
				-- 		[vim.diagnostic.severity.ERROR] = "",
				-- 		[vim.diagnostic.severity.WARN] = "",
				-- 		[vim.diagnostic.severity.HINT] = "",
				-- 		[vim.diagnostic.severity.INFO] = "",
				-- 	},
				-- },
				virtual_text = {
					prefix = "",
				},
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
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
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end

			-- styiling lsp handlers
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			-- lspconfig setup
			mason_lspconfig.setup_handlers({
				-- default handler for installed server
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
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
			})
		end,
	},
}
