return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--single-quote", "--jsx-single-quote", "--trailing-comma", "es5" },
          -- Ensure you include file types relevant to your projects, e.g., jsx, tsx for React projects
          filetypes = { "javascript", "typescript", "css", "html", "json", "markdown", "jsx", "tsx" },
        }),
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
