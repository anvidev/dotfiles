return {
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.diagnostic.config({
        float = {
          border = "rounded",
        },
      })
    end,
  },
}
