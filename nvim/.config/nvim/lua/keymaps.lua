-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Center buffer when navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "gd", "gdzz")

-- Remove highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Press 'S' for quick find/replace for the word under the cursor
vim.keymap.set("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- Press 'U' for redo
vim.keymap.set("n", "U", "<C-r>")

-- Press gx to open the link under the cursor
vim.keymap.set("n", "gx", ":sil !open <cWORD><cr>", { silent = true })

-- Move selected lines up or down
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", {})

-- Open floating terminal
vim.keymap.set("n", "<leader>tt", ":NeotermToggle<CR>", { silent = true })

-- Open spectre
vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end)

-- Open hover for diagnostics
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float({
    border = "rounded",
  })
end)

vim.keymap.set("n", "<leader>ss", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[S]earch [S]pelling suggestions" })
