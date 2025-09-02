return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      opleader = {
        line = "gc",
        block = "gb",
      },
      toggler = {
        line = "<C-_>",
        block = "<C-_>",
      },
    })

    vim.keymap.set({ "n", "v" }, "<C-/>", "<Plug>(comment_toggle_linewise)")
  end,
}
