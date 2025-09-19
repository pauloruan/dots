return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "rose-pine",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {
            "neo-tree",
          },
          winbar = {
            "neo-tree",
          },
        },
      },
      sections = {
        lualine_a = { "mode"},
        lualine_b = { "filename", "diff" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "branch" },
        lualine_z = { "filetype" },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "filetype" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
