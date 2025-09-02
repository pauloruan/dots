return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          bufferline = true,
          telescope = {
            enabled = true,
          },
          neotree = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
