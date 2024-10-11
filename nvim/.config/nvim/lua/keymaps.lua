-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move focus to the right pane" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move focus to the left pane" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move focus to the upper pane" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move focus to the lower pane" })

-- Center buffer when navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down" })
vim.keymap.set("n", "#", "#zz", { desc = "Search previous occurrence of word uncer cursor" })
vim.keymap.set("n", "*", "*zz", { desc = "Search next occurrence of word uncer cursor" })

-- save file without auto-formatting
vim.keymap.set(
  "n",
  "<leader>dw",
  "<cmd>noautocmd w <CR>",
  { silent = true, desc = "[D]ocument [W]rite without formatiing" }
)

-- Remove highlight
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Remove highlights" })

-- Press 'S' for quick find/replace for the word under the cursor
vim.keymap.set("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Find/replace word under cursor" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { desc = "Jump to start of line (first char)" })
vim.keymap.set("n", "H", "^", { desc = "Jump to end of line (last char)" })

-- Press 'U' for redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Press gx to open the link under the cursor
vim.keymap.set("n", "gx", ":sil !open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- Move selected lines up or down
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- Open spectre
vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Open Spectre" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { silent = true, desc = "Toggle line wrapping" })

-- Open hover for diagnostics
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float({
    border = "rounded",
  })
end, { desc = "Open hover for diagnostics" })

-- Reselect the last visual selection
vim.keymap.set("x", "<", function()
  -- Move selected text up/down in visual mode
  vim.cmd("normal! <<")
  vim.cmd("normal! gv")
end, { desc = "Indent line or selected inwards" })

vim.keymap.set("x", ">", function()
  vim.cmd("normal! >>")
  vim.cmd("normal! gv")
end, { desc = "Indent line or selected outwards" })
