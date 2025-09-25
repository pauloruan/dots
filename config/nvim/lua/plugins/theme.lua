return {
  {
    "gbprod/nord.nvim",
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
        },
      })
      vim.cmd("colorscheme nord")
    end,
  },
}
