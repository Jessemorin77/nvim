return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      map_cr = true,    -- map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
      auto_select = true, -- automatically select the first item
    })
  end,
}
