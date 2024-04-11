return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "jdtls",
          "prismals",
          "tailwindcss",
          "pylsp"
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      --setup servers here
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({}) 
      lspconfig.jdtls.setup{}
      lspconfig.pylsp.setup{}

      lspconfig.prismals.setup({})
      lspconfig.tailwindcss.setup({})

    end,
  },
}
--:h vim.lsp.buf
