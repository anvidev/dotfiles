return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            file_ignore_patterns = { "node_modules", ".git" },
            hidden = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          mappings = {
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fs", builtin.git_status, {})
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set("n", "<leader>fc", builtin.commands, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
