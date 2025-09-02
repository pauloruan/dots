return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        buffer_path_display = "unique_from_cwd",
        indicator = {
          style = "bar_only",
          position = "right",
        },
        separator_style = nil,
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },

      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
        },
        indicator_selected = {
          fg = "#89b4fa",
        },
      },
    })

    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
    vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
    vim.keymap.set("n", "<leader>bc", "<Cmd>bdelete<CR>", { desc = "Close current buffer" })
  end,
}
