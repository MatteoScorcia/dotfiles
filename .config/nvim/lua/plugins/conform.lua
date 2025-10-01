return {
  "stevearc/conform.nvim",
  opts = {
    -- Define your formatters for specific file types
    formatters_by_ft = {
      python = { "ruff_format" },
    },
  },
}
