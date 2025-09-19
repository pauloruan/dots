return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.starter").setup({
      {
        autoopen = true,
        evaluate_single = false,
        items = nil,
        header = nil,
        footer = nil,
        content_hooks = nil,
        query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
        silent = false,
      },
    })
  end,
}
