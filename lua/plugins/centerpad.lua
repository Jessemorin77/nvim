return {
  "smithbm2316/centerpad.nvim",
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>z",
      "<cmd>lua require'centerpad'.toggle{ leftpad = 20, rightpad = 20 }<cr>",
      { silent = true, noremap = true }
    )
  end,
}
