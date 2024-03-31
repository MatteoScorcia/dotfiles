return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "zig",
                "go",
                "rust",
                "sql",
                "lua",
                "python",
                "javascript",
                "typescript",
                "html",
                "css",
                "scss",
                "yaml",
                "toml",
                "json5",
                "make"
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
