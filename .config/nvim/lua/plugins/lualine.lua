return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- empty z section
      opts.sections.lualine_z = {}
    end,
  },
}
