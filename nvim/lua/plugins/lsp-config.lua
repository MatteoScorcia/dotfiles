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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.eslint.setup({ capabilities = capabilities })

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})

            local wk = require("which-key")
            wk.register({
                ["<leader>l"] = { name = "+Lsp"},
                ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
                ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
                ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
                ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
                ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
                ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            })

            wk.register({
                ["<leader>la"] = {
                    name = "LSP",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
                },
            })

            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})
        end,
    },
}
