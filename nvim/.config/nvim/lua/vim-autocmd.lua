vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- vim.api.nvim_create_autocmd("BuffPreWrite", {
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
