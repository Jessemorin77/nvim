return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    --:lua require("harpoon.ui").toggle_quick_menu()
    --:lua require("harpoon.mark").add_file()
    --:lua require("harpoon.ui").nav_file(3)
    --:lua require("harpoon.ui").nav_next()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>hn",
      ':lua require("harpoon.ui").nav_next()<CR>',
      { noremap = true, silent = true }
    )

    -- Navigate to the previous mark
    vim.api.nvim_set_keymap(
      "n",
      "<leader>hp",
      ':lua require("harpoon.ui").nav_prev()<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ha",
      ':lua require("harpoon.mark").add_file()<CR>',
      { noremap = true, silent = true }
    ) --:lua require("harpoon.ui").nav_prev()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>H",
      ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
      { noremap = true, silent = true }
    )
  end,
}
