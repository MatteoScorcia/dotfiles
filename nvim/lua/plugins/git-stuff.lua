return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            local wk = require "which-key"

            wk.register {
                ["<leader>g"] = { name = "+Gitsigns" },
                ["<leader>gb"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame" },
                ["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
                ["<leader>gr"] = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
            }
        end,
    },
}
