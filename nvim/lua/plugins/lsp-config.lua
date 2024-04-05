return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({})
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"gopls",
					"zls",
					"pylsp",
					"tsserver",
					"eslint",
					"tailwindcss",
					"cssls",
					"html",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,

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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local wk = require("which-key")

			local capabilities = cmp_nvim_lsp.default_capabilities()
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Reformat Buffer"
				vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)

				wk.register({
					["<leader>l"] = { name = "+Lsp" },
					["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
					["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
					["<leader>li"] = { "<cmd>LspInfo<CR>", "Info" },
					["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
					["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
					["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
					["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
				})

				wk.register({
					["<leader>l"] = { name = "+Lsp" },
					["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action", mode = "v" },
				})

				wk.register({
					["<leader>d"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show line diagnostic" },
					["<leader>D"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostic" },
				})
			end

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- javascript + html + css
			lspconfig.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.eslint.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })
		end,
	},
}
