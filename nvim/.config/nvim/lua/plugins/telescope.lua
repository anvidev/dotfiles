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
					prompt_prefix = "   ",
					selection_caret = " ",
					entry_prefix = " ",
					sorting_strategy = "descending",
					layout_config = {
						horizontal = {
							prompt_position = "bottom",
							preview_width = 0.60,
						},
						width = 0.80,
						height = 0.80,
					},
					mappings = {
						n = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
							["q"] = require("telescope.actions").close,
						},
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent Files" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [Help]" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Search Open Buffers" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "[S]earch [T]odo Comments" })
			vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

			vim.keymap.set("n", "<leader>ss", function()
				require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [S]pelling suggestions" })

			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "[/] Fuzzily search current buffer" }
			)

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			require("telescope").load_extension("ui-select")
		end,
	},
}
